--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Debian 15.8-0+deb12u1)
-- Dumped by pg_dump version 15.8 (Debian 15.8-0+deb12u1)

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
-- Name: logs; Type: TABLE; Schema: public; Owner: developer
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    ip inet,
    service character varying(255) NOT NULL,
    status smallint NOT NULL,
    login_time timestamp without time zone NOT NULL,
    logout_time timestamp without time zone NOT NULL
);


ALTER TABLE public.logs OWNER TO developer;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: developer
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO developer;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: developer
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: developer
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: developer
--

COPY public.logs (id, ip, service, status, login_time, logout_time) FROM stdin;
15	194.1.151.101	Apache2	10	2022-08-24 12:17:41	2022-08-24 12:17:55
16	129.201.169.11	SSH	20	2022-08-24 12:17:42	2022-08-24 12:17:59
17	122.21.19.117	PostgreSQL	20	2022-08-24 12:17:51	2022-08-24 12:18:02
18	12.3.198.118	OpenVPN	20	2022-08-24 12:17:56	2022-08-24 12:18:10
19	142.203.18.1	NextCloud	20	2022-08-24 12:17:58	2022-08-24 12:18:19
20	14.23.184.100	Nginx	30	2022-08-24 12:17:59	2022-08-24 12:18:46
21	149.230.81.10	Nginx	20	2022-08-24 12:18:05	2022-08-24 12:18:15
22	204.250.49.5	SSH	20	2022-08-24 12:18:07	2022-08-24 12:18:25
23	24.251.1.88	Apache2	20	2022-08-24 12:18:09	2022-08-24 12:18:54
24	244.22.18.98	NextCloud	20	2022-08-24 12:18:16	2022-08-24 12:18:59
25	23.221.1.2	NextCloud	20	2022-08-24 12:18:29	2022-08-24 12:19:09
1	216.12.14.171	SSH	20	2021-03-24 11:07:10	2021-03-24 11:09:08
2	156.1.148.141	Nginx	20	2022-08-24 12:10:11	2022-08-24 12:18:02
3	171.15.248.11	NextCloud	20	2022-08-24 12:14:13	2022-08-24 12:19:21
5	171.15.248.11	SSH	20	2022-08-24 12:15:39	2022-08-24 12:16:14
6	204.19.4.221	OpenVPN	20	2022-08-24 12:15:40	2022-08-24 12:17:25
7	221.191.44.228	SSH	20	2022-08-24 12:16:02	2022-08-24 12:18:57
9	254.1.8.14	OpenVPN	20	2022-08-24 12:16:09	2022-08-24 12:17:31
11	232.9.2.44	Apache2	20	2022-08-24 12:16:19	2022-08-24 12:17:48
12	121.91.26.40	PostgreSQL	20	2022-08-24 12:16:29	2022-08-24 12:16:52
14	231.5.24.211	Apache2	20	2022-08-24 12:17:39	2022-08-24 12:17:49
4	231.5.24.211	Apache2	10	2022-08-24 12:15:31	2022-08-24 12:35:01
10	255.1.22.47	NextCloud	10	2022-08-24 12:16:11	2022-08-24 12:17:04
13	185.1.15.140	NextCloud	10	2022-08-24 12:16:43	2022-08-24 12:17:20
8	210.190.8.248	Nginx	30	2022-08-24 12:16:04	2022-08-24 12:17:51
26	126.5.85.22	Apache2	20	2022-08-24 12:18:49	2022-08-24 12:20:24
27	253.2.125.21	SSH	30	2022-08-24 12:18:36	2022-08-24 12:19:29
28	231.5.24.211	Apache2	20	2022-08-24 12:18:50	2022-08-24 12:20:54
29	23.211.12.56	Nginx	20	2022-08-24 12:18:51	2022-08-24 12:19:55
30	16.159.88.11	Apache2	40	2022-08-24 12:20:00	2022-08-24 12:20:59
31	26.211.126.6	NextCloud	50	2022-08-24 12:20:01	2022-08-24 12:20:05
\.


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: developer
--

SELECT pg_catalog.setval('public.logs_id_seq', 31, true);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: developer
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

