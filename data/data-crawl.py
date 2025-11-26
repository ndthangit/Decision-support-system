import requests
from bs4 import BeautifulSoup
import pandas as pd
import uuid
from pathlib import Path
import time
import urllib3
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

session = requests.Session()
retry = Retry(
    total=5,
    backoff_factor=1,
    status_forcelist=[500, 502, 503, 504],
    allowed_methods=["GET"]
)
adapter = HTTPAdapter(max_retries=retry)
session.mount('http://', adapter)
session.mount('https://', adapter)

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Language': 'vi-VN,vi;q=0.9,en-US;q=0.8,en;q=0.7',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
}

base_url = "https://soict.hust.edu.vn/can-bo/page/{}/"
all_staff_data = []

for page in range(1, 7):
    url = base_url.format(page)
    
    try:
        time.sleep(2)
        response = session.get(url, headers=headers)
        if response.status_code != 200:
            continue            
        soup = BeautifulSoup(response.content, 'html.parser')
        staff_list = soup.find_all('div', class_='article-inner can-bo-bm row-box-shadow-1')
        print(f"Crawl page {page}")
        
        for staff in staff_list:
            name_tag = staff.find('h2')
            name = name_tag.get_text(strip=True) if name_tag else None
            link_tag = staff.find('a', href=True)
            detail_url = link_tag['href'] if link_tag else None

            email = None
            research_areas = None
            interested_studies = None
            print(f"Crawling: {name}")
            if detail_url:
                try:
                    time.sleep(2)
                    detail_res = session.get(detail_url, headers=headers)
                    detail_soup = BeautifulSoup(detail_res.content, 'html.parser')                    
                    email_tag = detail_soup.find('a', href=lambda x: x and x.startswith('mailto:'))
                    if email_tag:
                        email = email_tag.get_text(strip=True)

                    all_fields = detail_soup.find_all('div', class_='section-title-container')                    
                    for field in all_fields:
                        field_text = field.get_text(strip=True).lower()

                        ul_tag = field.find_next_sibling('ul')
                        if ul_tag:
                            items = [li.get_text(strip=True) for li in ul_tag.find_all('li')]
                            items_str = ", ".join(items)
                            if "lĩnh vực nghiên cứu" in field_text:
                                research_areas = items_str
                            elif "các nghiên cứu quan tâm" in field_text:
                                interested_studies = items_str
                except Exception as e:
                    print(f"{e}")

            all_staff_data.append({
                'Name': name,
                'Email': email,
                'Research_Areas': research_areas,
                'Interested_Studies': interested_studies
            })
            
    except Exception as e:
        print(f"{e}")

df = pd.DataFrame(all_staff_data)

data_dir = Path(__file__).parent
sql_path = data_dir / "init.sql"

def _esc(s: str) -> str:
    return str(s).replace("'", "''")

ra_set = set()
is_set = set()
lecturers = []
for row in all_staff_data:
    name = row.get('Name') or ''
    email = row.get('Email') or None
    ra_raw = row.get('Research_Areas') or ''
    is_raw = row.get('Interested_Studies') or ''
    ra_names = [s.strip() for s in str(ra_raw).split(',') if s.strip()]
    is_names = [s.strip() for s in str(is_raw).split(',') if s.strip()]
    for r in ra_names:
        ra_set.add(r)
    for i in is_names:
        is_set.add(i)
    lecturers.append((name, email, ra_names, is_names))

lines = []

for r in sorted(ra_set):
    r_esc = _esc(r)
    rid = str(uuid.uuid4())
    lines.append(
        f"INSERT INTO research_area (id, name) SELECT '{rid}'::uuid, '{r_esc}' WHERE NOT EXISTS (SELECT 1 FROM research_area WHERE name = '{r_esc}');"
    )

for i in sorted(is_set):
    i_esc = _esc(i)
    iid = str(uuid.uuid4())
    lines.append(
        f"INSERT INTO interested_study (id, name) SELECT '{iid}'::uuid, '{i_esc}' WHERE NOT EXISTS (SELECT 1 FROM interested_study WHERE name = '{i_esc}');"
    )

for name, email, _, _ in lecturers:
    name_esc = _esc(name or '')
    lid = str(uuid.uuid4())
    if email:
        email_esc = _esc(email)
        lines.append(
            f"INSERT INTO lecturer (id, full_name, email) SELECT '{lid}'::uuid, '{name_esc}', '{email_esc}' WHERE NOT EXISTS (SELECT 1 FROM lecturer WHERE email = '{email_esc}');"
        )
    else:
        lines.append(
            f"INSERT INTO lecturer (id, full_name, email) SELECT '{lid}'::uuid, '{name_esc}', NULL WHERE NOT EXISTS (SELECT 1 FROM lecturer WHERE full_name = '{name_esc}');"
        )

for name, email, ra_names, is_names in lecturers:
    if email:
        lecturer_condition = f"l.email = '{_esc(email)}'"
    else:
        lecturer_condition = f"l.full_name = '{_esc(name or '')}'"

    for r in ra_names:
        r_esc = _esc(r)
        lines.append(
            f"INSERT INTO lecturer_research_area (lecturer_id, research_area_id) SELECT l.id, r.id FROM lecturer l, research_area r WHERE {lecturer_condition} AND r.name = '{r_esc}' AND NOT EXISTS (SELECT 1 FROM lecturer_research_area lr WHERE lr.lecturer_id = l.id AND lr.research_area_id = r.id);"
        )

    for isn in is_names:
        is_esc = _esc(isn)
        lines.append(
            f"INSERT INTO lecturer_interested_study (lecturer_id, interested_study_id) SELECT l.id, s.id FROM lecturer l, interested_study s WHERE {lecturer_condition} AND s.name = '{is_esc}' AND NOT EXISTS (SELECT 1 FROM lecturer_interested_study li WHERE li.lecturer_id = l.id AND li.interested_study_id = s.id);"
        )

with open(sql_path, 'w', encoding='utf-8') as fh:
    fh.write('\n'.join(lines))

print(f"Wrote SQL file to {sql_path}")