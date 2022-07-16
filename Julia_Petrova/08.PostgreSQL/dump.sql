--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "belhard" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: belhard; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE belhard WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE belhard OWNER TO postgres;

\connect belhard

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: devops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devops (
    id integer NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    email character varying(30),
    age integer
);


ALTER TABLE public.devops OWNER TO postgres;

--
-- Name: devops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devops_id_seq OWNER TO postgres;

--
-- Name: devops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devops_id_seq OWNED BY public.devops.id;


--
-- Name: devops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devops ALTER COLUMN id SET DEFAULT nextval('public.devops_id_seq'::regclass);


--
-- Data for Name: devops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devops (id, firstname, lastname, email, age) FROM stdin;
1       Ivan    Ivanov  ivanov@test.com 30
2       Aleksey Ivanov  ivanov@test.com 30
3       Sergey  Petrov  petrov@test.com 35
4       Alexey  Medvedev        medvedev@test.com       40
5       Nikolay Ivanov  ivanov@test.com 30
6       Marina  Petrova petrova@test.com        35
7       Petr    Petrov  petrov@test.com 35
8       Ivan    Sidorov sidorov@test.com        40
9       Anna    Sidorova        sidorova@test.com       40
10      Juri    Fedorov fedorov@test.com        30
\.


--
-- Name: devops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devops_id_seq', 10, true);


--
-- Name: devops devops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devops
    ADD CONSTRAINT devops_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: devops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devops (
    id integer NOT NULL,
    firstname character varying(30),
    lastname character varying(30),
    email character varying(30),
    age integer
);


ALTER TABLE public.devops OWNER TO postgres;

--
-- Name: devops_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devops_id_seq OWNER TO postgres;

--
-- Name: devops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devops_id_seq OWNED BY public.devops.id;


--
-- Name: devops id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devops ALTER COLUMN id SET DEFAULT nextval('public.devops_id_seq'::regclass);


--
-- Data for Name: devops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devops (id, firstname, lastname, email, age) FROM stdin;
1       Ivan    Ivanov  ivanov@test.com 30
2       Aleksey Ivanov  ivanov@test.com 30
3       Sergey  Petrov  petrov@test.com 35
4       Alexey  Medvedev        medvedev@test.com       40
5       Nikolay Ivanov  ivanov@test.com 30
6       Marina  Petrova petrova@test.com        35
7       Petr    Petrov  petrov@test.com 35
8       Ivan    Sidorov sidorov@test.com        40
9       Anna    Sidorova        sidorova@test.com       40
10      Juri    Fedorov fedorov@test.com        30
\.


--
-- Name: devops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devops_id_seq', 10, true);


--
-- Name: devops devops_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devops
    ADD CONSTRAINT devops_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
