CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    url_avatar TEXT
);

CREATE TABLE research_fields (
    field_id SERIAL PRIMARY KEY,
    field_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE papers (
    paper_id SERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    paper_url TEXT
);

create table constructed_projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(500) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);



create table proposed_topics (
    topic_id SERIAL PRIMARY KEY,
    topic_name VARCHAR(500) NOT NULL,
    teacher_id INT,
    semester VARCHAR(50),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

create table teacher_research_fields (
    teacher_id INT,
    field_id INT,
    PRIMARY KEY (teacher_id, field_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (field_id) REFERENCES research_fields(field_id)
);

create table teacher_papers (
    teacher_id INT,
    paper_id INT,
    PRIMARY KEY (teacher_id, paper_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (paper_id) REFERENCES papers(paper_id)
);

create table paper_research_fields (
    paper_id INT,
    field_id INT,
    PRIMARY KEY (paper_id, field_id),
    FOREIGN KEY (paper_id) REFERENCES papers(paper_id),
    FOREIGN KEY (field_id) REFERENCES research_fields(field_id)
);

create table constructed_project_research_fields (
    project_id INT,
    field_id INT,
    PRIMARY KEY (project_id, field_id),
    FOREIGN KEY (project_id) REFERENCES constructed_projects(project_id),
    FOREIGN KEY (field_id) REFERENCES research_fields(field_id)
);

create table proposed_topic_research_fields (
    topic_id INT,
    field_id INT,
    PRIMARY KEY (topic_id, field_id),
    FOREIGN KEY (topic_id) REFERENCES proposed_topics(topic_id),
    FOREIGN KEY (field_id) REFERENCES research_fields(field_id)
);

create table type_projects (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL UNIQUE
);

create table history (
    history_id SERIAL PRIMARY KEY,
    student_id varchar(50) NOT NULL,
    teacher_id INT NOT NULL,
    type_project int,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (type_project) REFERENCES type_projects(type_id)
);

create table history_research_fields (
    history_id INT NOT NULL,
    field_id INT NOT NULL,
    PRIMARY KEY (history_id, field_id),
    FOREIGN KEY (history_id) REFERENCES history(history_id),
    FOREIGN KEY (field_id) REFERENCES research_fields(field_id)
);

create table skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name VARCHAR(255) NOT NULL UNIQUE
);

create table history_skills (
    history_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (history_id, skill_id),
    FOREIGN KEY (history_id) REFERENCES history(history_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);


insert into type_projects (type_name) values
('website'),
('Ứng dụng di động'),
('Phần mềm quản lý'),
('Hệ thống nhúng'),
('Trí tuệ nhân tạo'),
('nghiên cứu khoa học');


insert into skills (skill_name) values
('Python'),
('Java'),
('C++'),
('JavaScript'),
('HTML/CSS'),
('SQL'),
('Machine Learning'),
('Project Management'),
('Backend Development'),
('Frontend Development'),
('Database'),
('Data'),
('Cybersecurity'),
('Cloud Computing'),
('Mobile Development');

insert into research_fields (field_name) values
('Trí tuệ nhân tạo'),
('Khoa học dữ liệu'),
('Hệ thống nhúng'),
('Tối ưu hóa'),
('Hệ thống phân tán'),
('An ninh mạng'),
('Điện toán đám mây'),
('Phát triển phần mềm'),
('Cơ sở dữ liệu');












