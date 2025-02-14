--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    userid integer NOT NULL,
    token character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    shorturl text NOT NULL,
    visitcount integer DEFAULT 0 NOT NULL,
    userid integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq1 OWNED BY public.users.id;


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq1'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (3, '1234', '2022-10-17 09:07:11.530125');
INSERT INTO public.sessions VALUES (3, '6cd1ca73-7456-4548-bc87-1b530069c2eb', '2022-10-17 09:09:47.313615');
INSERT INTO public.sessions VALUES (4, '9d581b10-5aee-4ef4-b863-d416c35582be', '2022-10-17 14:06:10.453991');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'https://bootcampra.notion.site/Segunda-03-10-Livecode-Boardcamp-b2c0836216f247d9938cd8b5024de5c9', 'xPt0AAg7l4', 1, 3, '2022-10-17 09:54:59.603088');
INSERT INTO public.urls VALUES (2, 'https://bootcampra.notion.site/Segunda-03-10-Livecode-Boardcamp-b2c0836216f247d9938cd8b5024de5c9', 'ZHg98M-sW9', 1, 3, '2022-10-17 09:55:07.526175');
INSERT INTO public.urls VALUES (6, 'https://bootcampra.notion.site/Segunda-03-10-Livecode-Boardcamp-b2c0836216f247d9938cd8b5024de5c9', '5u3U5lIz22', 1, 3, '2022-10-17 10:03:53.795008');
INSERT INTO public.urls VALUES (11, 'https://bootcampra.notion.site/Projeto-Shortly-API-21533489cd5042058524caf3429b62e4', 'JeIQpIA6hw', 3, 4, '2022-10-17 14:11:51.75787');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'joao', 'jvfp@hotmail.com', '38790997', '2022-10-17 08:49:38.022313');
INSERT INTO public.users VALUES (2, 'lelel', 'jvfpasda@hotmail.com', '38790997', '2022-10-17 08:49:59.804905');
INSERT INTO public.users VALUES (3, 'João', 'joao@driven.com.br', '$2b$10$ci4QnkKaO.VvOQw6dbuK0.TnizcZWZSF4NBQcQ4PPhxiFFE4MlBPK', '2022-10-17 08:51:35.231573');
INSERT INTO public.users VALUES (4, 'joao2', 'jvfp@sapo.com.br', '$2b$10$jGbpfUfaf1/tMqd3aemWf.3mp9nuFYvpTxK.OmjET42qMIK8YkF.m', '2022-10-17 14:05:18.991968');
INSERT INTO public.users VALUES (5, 'Vinicius', 'vini@gmail.com', '$2b$10$IIpGE1EF24zCfKKOJT4Gpujbib8JMjVWepqf9flQodRM2IGawUUg6', '2022-10-18 17:34:50.338436');
INSERT INTO public.users VALUES (6, 'Ronald', 'ronald@ronaldinho.com', '$2b$10$gKCpe8OcQ4gwUtRIfFU4Z.KOMmiXZzF3BCIaWVnbYaBSPFHoh8.YW', '2022-10-18 17:40:20.632914');
INSERT INTO public.users VALUES (7, 'Guga', 'guga@guguinha.com', '$2b$10$G/ClkumZkl.IRxjXW85co.xXX..uUUEe59vpPMQzF34DfImLOyrPO', '2022-10-18 17:40:20.971454');


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 13, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: users_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq1', 7, true);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

