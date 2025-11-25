import requests
from bs4 import BeautifulSoup
import pandas as pd
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
                'Detail_URL': detail_url,
                'Email': email,
                'Research_Areas': research_areas,
                'Interested_Studies': interested_studies
            })
            
    except Exception as e:
        print(f"{e}")

df = pd.DataFrame(all_staff_data)
df.to_excel("SoICT_Staff_List.xlsx", index=False)