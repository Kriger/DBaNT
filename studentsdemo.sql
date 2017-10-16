SET client_encoding = 'UTF8';
SET client_min_messages = warning;

DROP DATABASE IF EXISTS "studentsdemo";

CREATE DATABASE "studentsdemo" WITH ENCODING = 'UTF8';

\c "studentsdemo"

SET client_encoding = 'UTF8';
SET client_min_messages = warning;

--
-- examinations 
--
CREATE TABLE examinations (
    id integer NOT NULL,
    subject_id smallint,
    semester_id smallint
);

CREATE SEQUENCE examinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE examinations_id_seq OWNED BY examinations.id;

ALTER TABLE ONLY examinations ALTER COLUMN id SET DEFAULT nextval('examinations_id_seq'::regclass);

COPY examinations (id, subject_id, semester_id) FROM stdin;
1	1	2
2	2	2
3	4	2
4	5	2
5	6	2
6	1	3
7	2	3
8	5	3
9	6	3
10	3	3
\.

SELECT pg_catalog.setval('examinations_id_seq', 10, true);

--
-- groups 
--
CREATE TABLE groups (
    id smallint NOT NULL,
    number integer,
    steward_id integer
);

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);

COPY groups (id, number, steward_id) FROM stdin;
1	201	\N
2	202	\N
3	203	\N
4	204	\N
5	205	\N
6	206	\N
7	207	\N
8	208	\N
9	209	\N
10	210	\N
11	211	\N
12	212	\N
\.

SELECT pg_catalog.setval('groups_id_seq', 1, false);

--
-- groups_examinations 
--
CREATE TABLE groups_examinations (
    id integer NOT NULL,
    examination_id integer,
    group_id smallint,
    date timestamp without time zone
);

CREATE SEQUENCE groups_examinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE groups_examinations_id_seq OWNED BY groups_examinations.id;

ALTER TABLE ONLY groups_examinations ALTER COLUMN id SET DEFAULT nextval('groups_examinations_id_seq'::regclass);

COPY groups_examinations (id, examination_id, group_id, date) FROM stdin;
17	9	3	2016-01-23 14:00:00
18	9	4	2016-01-14 10:00:00
19	7	3	2016-01-17 10:00:00
20	7	4	2016-01-28 10:00:00
21	9	1	2016-01-24 14:00:00
22	9	2	2016-01-12 14:00:00
23	7	1	2016-01-25 10:00:00
24	7	2	2016-01-17 10:00:00
25	6	1	2016-01-22 10:00:00
26	6	2	2016-01-19 10:00:00
27	8	1	2016-01-30 14:00:00
28	8	2	2016-01-12 14:00:00
29	8	3	2016-01-16 10:00:00
30	8	4	2016-01-21 10:00:00
31	10	3	2016-01-18 10:00:00
32	10	4	2016-01-27 10:00:00
1	1	3	2015-06-18 10:00:00
2	1	4	2015-06-09 10:00:00
3	2	3	2015-06-04 10:00:00
4	2	4	2015-06-09 14:00:00
5	1	1	2015-06-20 10:00:00
6	1	2	2015-06-09 14:00:00
7	2	1	2015-06-21 14:00:00
8	2	2	2015-06-01 14:00:00
9	3	1	2015-06-02 10:00:00
10	3	2	2015-06-17 10:00:00
11	4	1	2015-06-04 14:00:00
12	4	2	2015-06-19 10:00:00
13	4	3	2015-06-06 10:00:00
14	4	4	2015-06-13 14:00:00
15	5	3	2015-06-11 10:00:00
16	5	4	2015-06-17 10:00:00
\.

SELECT pg_catalog.setval('groups_examinations_id_seq', 32, true);

--
-- hobbies 
--
CREATE TABLE hobbies (
    id integer NOT NULL,
    name character varying
);

COPY hobbies (id, name) FROM stdin;
4	Dancing
5	Painting
6	Traveling
7	Sleeping
8	Gaming
9	Collecting
1	Reading
2	Singing
3	Swimming
10	Photography
11	Movies
12	Music
13	Cooking
\.

--
-- marks 
--
CREATE TABLE marks (
    id bigint NOT NULL,
    student_id integer,
    group_examination_id integer,
    mark smallint,
    date timestamp without time zone
);

CREATE SEQUENCE marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE marks_id_seq OWNED BY marks.id;

ALTER TABLE ONLY marks ALTER COLUMN id SET DEFAULT nextval('marks_id_seq'::regclass);

COPY marks (id, student_id, group_examination_id, mark, date) FROM stdin;
1	75	1	4	2015-06-18 12:03:00
2	10	2	5	2015-06-09 11:04:00
3	8	2	4	2015-06-09 13:49:00
4	6	2	4	2015-06-09 11:09:00
5	4	2	4	2015-06-09 10:55:00
6	2	2	5	2015-06-09 11:07:00
7	1	2	4	2015-06-09 12:24:00
8	5	2	4	2015-06-09 12:27:00
9	9	2	3	2015-06-09 11:20:00
10	7	2	5	2015-06-09 10:54:00
11	3	2	5	2015-06-09 13:30:00
13	10	4	4	2015-06-09 16:30:00
15	6	4	4	2015-06-09 15:40:00
16	4	4	4	2015-06-09 14:09:00
18	1	4	4	2015-06-09 16:15:00
19	5	4	3	2015-06-09 17:26:00
20	9	4	5	2015-06-09 16:00:00
21	7	4	3	2015-06-09 16:44:00
22	3	4	5	2015-06-09 15:59:00
23	34	5	4	2015-06-20 11:45:00
24	24	6	3	2015-06-09 15:57:00
25	19	6	5	2015-06-09 14:07:00
26	101	6	4	2015-06-09 16:13:00
27	34	7	5	2015-06-21 17:21:00
28	24	8	4	2015-06-01 16:31:00
29	19	8	4	2015-06-01 17:03:00
30	101	8	5	2015-06-01 14:18:00
31	34	9	3	2015-06-02 10:59:00
32	24	10	3	2015-06-17 10:26:00
33	19	10	4	2015-06-17 11:40:00
34	101	10	4	2015-06-17 12:26:00
35	34	11	4	2015-06-04 16:05:00
37	19	12	3	2015-06-19 13:33:00
38	101	12	5	2015-06-19 11:56:00
40	10	14	5	2015-06-13 14:23:00
41	8	14	5	2015-06-13 16:44:00
43	4	14	4	2015-06-13 14:17:00
44	2	14	4	2015-06-13 17:57:00
45	1	14	5	2015-06-13 16:00:00
46	5	14	3	2015-06-13 14:03:00
48	7	14	3	2015-06-13 14:48:00
49	3	14	4	2015-06-13 17:10:00
50	75	15	5	2015-06-11 13:28:00
51	10	16	4	2015-06-17 13:41:00
52	8	16	3	2015-06-17 12:03:00
53	6	16	5	2015-06-17 10:20:00
54	4	16	5	2015-06-17 10:32:00
55	2	16	3	2015-06-17 13:52:00
56	1	16	3	2015-06-17 10:09:00
57	5	16	4	2015-06-17 13:31:00
58	9	16	5	2015-06-17 10:41:00
59	7	16	5	2015-06-17 11:51:00
60	3	16	3	2015-06-17 13:08:00
12	75	3	2	2015-06-04 13:28:00
14	8	4	2	2015-06-09 15:23:00
36	24	12	2	2015-06-19 11:27:00
39	75	13	2	2015-06-06 13:51:00
47	9	14	2	2015-06-13 14:42:00
17	2	4	\N	2015-06-09 14:49:00
42	6	14	\N	2015-06-13 17:36:00
61	75	3	4	2015-06-24 10:29:00
62	8	4	3	2015-06-24 10:30:00
63	24	12	3	2015-06-24 10:12:00
65	9	14	3	2015-06-24 10:52:00
66	2	4	4	2015-06-24 10:56:00
67	6	14	4	2015-06-24 10:54:00
64	75	13	\N	2015-06-24 10:34:00
68	75	13	4	2015-06-26 10:31:00
69	75	17	4	2016-01-23 16:14:00
70	10	18	3	2016-01-14 11:46:00
71	8	18	3	2016-01-14 10:01:00
72	6	18	2	2016-01-14 11:08:00
73	4	18	3	2016-01-14 12:06:00
74	2	18	2	2016-01-14 10:48:00
75	1	18	4	2016-01-14 12:09:00
76	5	18	3	2016-01-14 10:58:00
77	9	18	3	2016-01-14 12:51:00
79	3	18	4	2016-01-14 10:19:00
80	75	19	2	2016-01-17 12:46:00
81	34	21	5	2016-01-24 14:50:00
82	24	22	3	2016-01-12 17:23:00
83	19	22	4	2016-01-12 16:57:00
84	101	22	5	2016-01-12 14:31:00
85	34	23	3	2016-01-25 10:28:00
86	24	24	4	2016-01-17 12:06:00
87	19	24	2	2016-01-17 12:58:00
88	101	24	4	2016-01-17 12:28:00
89	34	25	3	2016-01-22 13:25:00
90	24	26	4	2016-01-19 13:23:00
91	19	26	3	2016-01-19 10:32:00
93	24	28	5	2016-01-12 14:29:00
94	19	28	5	2016-01-12 15:45:00
95	101	28	3	2016-01-12 14:37:00
97	10	30	3	2016-01-21 11:38:00
98	8	30	2	2016-01-21 13:40:00
99	6	30	2	2016-01-21 13:30:00
100	4	30	2	2016-01-21 11:46:00
101	2	30	5	2016-01-21 12:29:00
102	1	30	5	2016-01-21 10:28:00
103	5	30	3	2016-01-21 13:06:00
104	9	30	4	2016-01-21 12:31:00
105	7	30	4	2016-01-21 12:12:00
106	3	30	3	2016-01-21 10:05:00
107	75	31	4	2016-01-18 12:15:00
108	3	32	\N	\N
109	3	20	\N	\N
110	7	32	\N	\N
111	7	20	\N	\N
112	9	32	\N	\N
113	9	20	\N	\N
114	5	32	\N	\N
115	5	20	\N	\N
116	1	32	\N	\N
117	1	20	\N	\N
118	2	32	\N	\N
119	2	20	\N	\N
120	4	32	\N	\N
121	4	20	\N	\N
122	6	32	\N	\N
123	6	20	\N	\N
124	8	32	\N	\N
125	8	20	\N	\N
126	34	27	\N	\N
127	10	32	\N	\N
128	10	20	\N	\N
78	7	18	\N	2016-01-14 10:50:00
92	101	26	\N	2016-01-19 13:09:00
96	75	29	\N	2016-01-16 10:46:00
129	6	18	3	2016-01-26 10:32:00
130	2	18	2	2016-01-26 10:51:00
132	19	24	3	2016-01-26 10:55:00
133	8	30	4	2016-01-26 10:33:00
134	6	30	3	2016-01-26 10:13:00
135	4	30	3	2016-01-26 10:58:00
136	7	18	3	2016-01-26 10:04:00
137	101	26	3	2016-01-26 10:21:00
138	75	29	4	2016-01-26 10:53:00
131	75	19	\N	2016-01-26 10:13:00
139	75	19	\N	\N
\.

SELECT pg_catalog.setval('marks_id_seq', 139, true);

--
-- semesters 
--
CREATE TABLE semesters (
    id smallint NOT NULL
);

COPY semesters (id) FROM stdin;
1
2
3
4
5
6
7
8
\.

--
-- students 
--
CREATE TABLE students (
    id integer NOT NULL,
    lastname character varying(80),
    firstname character varying(80),
    group_id integer,
    sex character varying(6)
);

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    
ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);

COPY students (id, lastname, firstname, group_id, sex) FROM stdin;
3	Korolev	Konstantin	4	male
7	Maylatova	Ekaterina	4	male
9	Khaliullina	Liya	4	male
101	Kaplun	Igor	2	male
19	Pomazkova	Galina	2	male
75	Ustinova	Svetlana	3	male
5	Levdic	Veronica	4	male
1	Kiriluk	Anton	4	male
2	Koreshkova	Natalya	4	female
4	Le	Ian	4	female
6	Logosha	Elizaveta	4	female
8	Prokhorenko	Philipp	4	female
24	Livotova	Wassilisa	2	female
34	Logachev	Mikhail	1	female
172	Shulga	Valentin	\N	female
78	Avdeenko	Dmitrii	\N	female
10	Vlad	Andrei	4	female
\.

SELECT pg_catalog.setval('students_id_seq', 172, false);

--
-- students_hobbies_relations 
--
CREATE TABLE students_hobbies_relations (
    students_id integer NOT NULL,
    hobbies_id integer NOT NULL
);


--
-- subjects 
--
CREATE TABLE subjects (
    id smallint NOT NULL,
    name character varying(80)
);


CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);

COPY subjects (id, name) FROM stdin;
1	mathematical analysis
2	higher mathematics
3	differential equations
4	physical culture
5	databases and network technologies
6	programming technology
\.

SELECT pg_catalog.setval('subjects_id_seq', 6, true);

--
-- CONSTRAINTS
--
ALTER TABLE ONLY examinations
    ADD CONSTRAINT examinations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY groups_examinations
    ADD CONSTRAINT groups_examinations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);

ALTER TABLE ONLY hobbies
    ADD CONSTRAINT hobbies_pkey PRIMARY KEY (id);

ALTER TABLE ONLY marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);

ALTER TABLE ONLY semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);

ALTER TABLE ONLY students_hobbies_relations
    ADD CONSTRAINT students_hobbies_relations_pkey PRIMARY KEY (students_id, hobbies_id);

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);
    
ALTER TABLE ONLY students
    ADD CONSTRAINT students_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


