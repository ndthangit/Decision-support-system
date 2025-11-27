--
-- PostgreSQL database dump
--

\restrict 1aydeAM0BYDyxwGq3XmuVRvUTXLNbk1HEWehxCCMS0sRUtqNAAl74gZx6rGVCGK

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constructed_project_research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constructed_project_research_fields (
    project_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.constructed_project_research_fields OWNER TO postgres;

--
-- Name: constructed_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constructed_projects (
    project_id integer NOT NULL,
    project_name character varying(500) NOT NULL,
    teacher_id integer
);


ALTER TABLE public.constructed_projects OWNER TO postgres;

--
-- Name: constructed_projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constructed_projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.constructed_projects_project_id_seq OWNER TO postgres;

--
-- Name: constructed_projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constructed_projects_project_id_seq OWNED BY public.constructed_projects.project_id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    history_id integer NOT NULL,
    student_id character varying(50) NOT NULL,
    teacher_id integer NOT NULL,
    type_project integer
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.history_history_id_seq OWNER TO postgres;

--
-- Name: history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_history_id_seq OWNED BY public.history.history_id;


--
-- Name: history_research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_research_fields (
    history_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.history_research_fields OWNER TO postgres;

--
-- Name: history_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_skills (
    history_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.history_skills OWNER TO postgres;

--
-- Name: paper_research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paper_research_fields (
    paper_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.paper_research_fields OWNER TO postgres;

--
-- Name: papers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.papers (
    paper_id integer NOT NULL,
    title character varying(500) NOT NULL,
    paper_url text
);


ALTER TABLE public.papers OWNER TO postgres;

--
-- Name: papers_paper_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.papers_paper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.papers_paper_id_seq OWNER TO postgres;

--
-- Name: papers_paper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.papers_paper_id_seq OWNED BY public.papers.paper_id;


--
-- Name: proposed_topic_research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proposed_topic_research_fields (
    topic_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.proposed_topic_research_fields OWNER TO postgres;

--
-- Name: proposed_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proposed_topics (
    topic_id integer NOT NULL,
    topic_name character varying(500) NOT NULL,
    teacher_id integer,
    semester character varying(50)
);


ALTER TABLE public.proposed_topics OWNER TO postgres;

--
-- Name: proposed_topics_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proposed_topics_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proposed_topics_topic_id_seq OWNER TO postgres;

--
-- Name: proposed_topics_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proposed_topics_topic_id_seq OWNED BY public.proposed_topics.topic_id;


--
-- Name: research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.research_fields (
    field_id integer NOT NULL,
    field_name character varying(255) NOT NULL
);


ALTER TABLE public.research_fields OWNER TO postgres;

--
-- Name: research_fields_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.research_fields_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.research_fields_field_id_seq OWNER TO postgres;

--
-- Name: research_fields_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.research_fields_field_id_seq OWNED BY public.research_fields.field_id;


--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    skill_id integer NOT NULL,
    skill_name character varying(255) NOT NULL
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_skill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_skill_id_seq OWNER TO postgres;

--
-- Name: skills_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_skill_id_seq OWNED BY public.skills.skill_id;


--
-- Name: teacher_papers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_papers (
    teacher_id integer NOT NULL,
    paper_id integer NOT NULL
);


ALTER TABLE public.teacher_papers OWNER TO postgres;

--
-- Name: teacher_research_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_research_fields (
    teacher_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.teacher_research_fields OWNER TO postgres;

--
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    teacher_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url_avatar text
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_teacher_id_seq OWNER TO postgres;

--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_teacher_id_seq OWNED BY public.teachers.teacher_id;


--
-- Name: type_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_projects (
    type_id integer NOT NULL,
    type_name character varying(255) NOT NULL
);


ALTER TABLE public.type_projects OWNER TO postgres;

--
-- Name: type_projects_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_projects_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_projects_type_id_seq OWNER TO postgres;

--
-- Name: type_projects_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_projects_type_id_seq OWNED BY public.type_projects.type_id;


--
-- Name: constructed_projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_projects ALTER COLUMN project_id SET DEFAULT nextval('public.constructed_projects_project_id_seq'::regclass);


--
-- Name: history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN history_id SET DEFAULT nextval('public.history_history_id_seq'::regclass);


--
-- Name: papers paper_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.papers ALTER COLUMN paper_id SET DEFAULT nextval('public.papers_paper_id_seq'::regclass);


--
-- Name: proposed_topics topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topics ALTER COLUMN topic_id SET DEFAULT nextval('public.proposed_topics_topic_id_seq'::regclass);


--
-- Name: research_fields field_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_fields ALTER COLUMN field_id SET DEFAULT nextval('public.research_fields_field_id_seq'::regclass);


--
-- Name: skills skill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN skill_id SET DEFAULT nextval('public.skills_skill_id_seq'::regclass);


--
-- Name: teachers teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_teacher_id_seq'::regclass);


--
-- Name: type_projects type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_projects ALTER COLUMN type_id SET DEFAULT nextval('public.type_projects_type_id_seq'::regclass);


--
-- Data for Name: constructed_project_research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constructed_project_research_fields (project_id, field_id) FROM stdin;
\.


--
-- Data for Name: constructed_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constructed_projects (project_id, project_name, teacher_id) FROM stdin;
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (history_id, student_id, teacher_id, type_project) FROM stdin;
\.


--
-- Data for Name: history_research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_research_fields (history_id, field_id) FROM stdin;
\.


--
-- Data for Name: history_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_skills (history_id, skill_id) FROM stdin;
\.


--
-- Data for Name: paper_research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paper_research_fields (paper_id, field_id) FROM stdin;
\.


--
-- Data for Name: papers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.papers (paper_id, title, paper_url) FROM stdin;
\.


--
-- Data for Name: proposed_topic_research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proposed_topic_research_fields (topic_id, field_id) FROM stdin;
\.


--
-- Data for Name: proposed_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proposed_topics (topic_id, topic_name, teacher_id, semester) FROM stdin;
\.


--
-- Data for Name: research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.research_fields (field_id, field_name) FROM stdin;
1	Trí tuệ nhân tạo
2	Khoa học dữ liệu
3	Hệ thống nhúng
4	Tối ưu hóa
5	Hệ thống phân tán
6	An ninh mạng
7	Điện toán đám mây
8	Phát triển phần mềm
9	Cơ sở dữ liệu
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (skill_id, skill_name) FROM stdin;
1	Python
2	Java
3	C++
4	JavaScript
5	HTML/CSS
6	SQL
7	Machine Learning
8	Project Management
9	Backend Development
10	Frontend Development
11	Database
12	Data
13	Cybersecurity
14	Cloud Computing
15	Mobile Development
\.


--
-- Data for Name: teacher_papers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_papers (teacher_id, paper_id) FROM stdin;
\.


--
-- Data for Name: teacher_research_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_research_fields (teacher_id, field_id) FROM stdin;
\.


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (teacher_id, name, url_avatar) FROM stdin;
\.


--
-- Data for Name: type_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_projects (type_id, type_name) FROM stdin;
1	website
2	Ứng dụng di động
3	Phần mềm quản lý
4	Hệ thống nhúng
5	Trí tuệ nhân tạo
6	nghiên cứu khoa học
\.


--
-- Name: constructed_projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constructed_projects_project_id_seq', 1, false);


--
-- Name: history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_history_id_seq', 1, false);


--
-- Name: papers_paper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.papers_paper_id_seq', 1, false);


--
-- Name: proposed_topics_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proposed_topics_topic_id_seq', 1, false);


--
-- Name: research_fields_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.research_fields_field_id_seq', 9, true);


--
-- Name: skills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_skill_id_seq', 15, true);


--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_teacher_id_seq', 1, false);


--
-- Name: type_projects_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_projects_type_id_seq', 6, true);


--
-- Name: constructed_project_research_fields constructed_project_research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_project_research_fields
    ADD CONSTRAINT constructed_project_research_fields_pkey PRIMARY KEY (project_id, field_id);


--
-- Name: constructed_projects constructed_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_projects
    ADD CONSTRAINT constructed_projects_pkey PRIMARY KEY (project_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (history_id);


--
-- Name: history_research_fields history_research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_research_fields
    ADD CONSTRAINT history_research_fields_pkey PRIMARY KEY (history_id, field_id);


--
-- Name: history_skills history_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_skills
    ADD CONSTRAINT history_skills_pkey PRIMARY KEY (history_id, skill_id);


--
-- Name: paper_research_fields paper_research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_research_fields
    ADD CONSTRAINT paper_research_fields_pkey PRIMARY KEY (paper_id, field_id);


--
-- Name: papers papers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (paper_id);


--
-- Name: proposed_topic_research_fields proposed_topic_research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topic_research_fields
    ADD CONSTRAINT proposed_topic_research_fields_pkey PRIMARY KEY (topic_id, field_id);


--
-- Name: proposed_topics proposed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topics
    ADD CONSTRAINT proposed_topics_pkey PRIMARY KEY (topic_id);


--
-- Name: research_fields research_fields_field_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_fields
    ADD CONSTRAINT research_fields_field_name_key UNIQUE (field_name);


--
-- Name: research_fields research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.research_fields
    ADD CONSTRAINT research_fields_pkey PRIMARY KEY (field_id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- Name: skills skills_skill_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_skill_name_key UNIQUE (skill_name);


--
-- Name: teacher_papers teacher_papers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_papers
    ADD CONSTRAINT teacher_papers_pkey PRIMARY KEY (teacher_id, paper_id);


--
-- Name: teacher_research_fields teacher_research_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_research_fields
    ADD CONSTRAINT teacher_research_fields_pkey PRIMARY KEY (teacher_id, field_id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (teacher_id);


--
-- Name: type_projects type_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_projects
    ADD CONSTRAINT type_projects_pkey PRIMARY KEY (type_id);


--
-- Name: type_projects type_projects_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_projects
    ADD CONSTRAINT type_projects_type_name_key UNIQUE (type_name);


--
-- Name: constructed_project_research_fields constructed_project_research_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_project_research_fields
    ADD CONSTRAINT constructed_project_research_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.research_fields(field_id);


--
-- Name: constructed_project_research_fields constructed_project_research_fields_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_project_research_fields
    ADD CONSTRAINT constructed_project_research_fields_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.constructed_projects(project_id);


--
-- Name: constructed_projects constructed_projects_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constructed_projects
    ADD CONSTRAINT constructed_projects_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id);


--
-- Name: history_research_fields history_research_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_research_fields
    ADD CONSTRAINT history_research_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.research_fields(field_id);


--
-- Name: history_research_fields history_research_fields_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_research_fields
    ADD CONSTRAINT history_research_fields_history_id_fkey FOREIGN KEY (history_id) REFERENCES public.history(history_id);


--
-- Name: history_skills history_skills_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_skills
    ADD CONSTRAINT history_skills_history_id_fkey FOREIGN KEY (history_id) REFERENCES public.history(history_id);


--
-- Name: history_skills history_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_skills
    ADD CONSTRAINT history_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id);


--
-- Name: history history_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id);


--
-- Name: history history_type_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_type_project_fkey FOREIGN KEY (type_project) REFERENCES public.type_projects(type_id);


--
-- Name: paper_research_fields paper_research_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_research_fields
    ADD CONSTRAINT paper_research_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.research_fields(field_id);


--
-- Name: paper_research_fields paper_research_fields_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paper_research_fields
    ADD CONSTRAINT paper_research_fields_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(paper_id);


--
-- Name: proposed_topic_research_fields proposed_topic_research_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topic_research_fields
    ADD CONSTRAINT proposed_topic_research_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.research_fields(field_id);


--
-- Name: proposed_topic_research_fields proposed_topic_research_fields_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topic_research_fields
    ADD CONSTRAINT proposed_topic_research_fields_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.proposed_topics(topic_id);


--
-- Name: proposed_topics proposed_topics_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposed_topics
    ADD CONSTRAINT proposed_topics_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id);


--
-- Name: teacher_papers teacher_papers_paper_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_papers
    ADD CONSTRAINT teacher_papers_paper_id_fkey FOREIGN KEY (paper_id) REFERENCES public.papers(paper_id);


--
-- Name: teacher_papers teacher_papers_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_papers
    ADD CONSTRAINT teacher_papers_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id);


--
-- Name: teacher_research_fields teacher_research_fields_field_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_research_fields
    ADD CONSTRAINT teacher_research_fields_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.research_fields(field_id);


--
-- Name: teacher_research_fields teacher_research_fields_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_research_fields
    ADD CONSTRAINT teacher_research_fields_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(teacher_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 1aydeAM0BYDyxwGq3XmuVRvUTXLNbk1HEWehxCCMS0sRUtqNAAl74gZx6rGVCGK

