--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.9 (Debian 12.9-1.pgdg110+1)

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
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    news_id integer,
    text character varying(255) NOT NULL,
    create_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- Name: COLUMN article.create_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.article.create_at IS '(DC2Type:datetime_immutable)';


--
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.article_id_seq OWNER TO postgres;

--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO postgres;

--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    is_show boolean NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, news_id, text, create_at) FROM stdin;
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211210094605	2021-12-10 09:48:33	80
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, is_show, description) FROM stdin;
1	В Саудовской Аравии более 40 верблюдов сняли с конкурса красоты	t	Более 40 верблюдов были дисквалифицированы с конкурса красоты в Саудовской Аравии после того, как десяткам животных сделали ботокс, подтяжку лица, а также вкололи гормоны, стимулирующие мышцы.
4	Одинокая корова устроила забег по Софийской улице и удивила автомобилистов	t	Необычного «участника дорожного движения» можно было наблюдать во вторник.  Прямо по обочине Софийской улице бегала корова . Судя по видео, корова всерьез решила посостязаться в скорости с машинами: по обочине она мчалась весьма быстро.
6	Олень позвонил в дверь мужчине и напугал его	t	Инцидент произошел в штате Колорадо. К крыльцу подошел большой олень. Животное ело цветы и случайно позвонило в дверь американцу, а после погрызло висящий у входа рождественский венок и ушло обратно в лес
8	В чем секрет "Черного квадрата" Малевича и почему это шедевр	t	На самом деле, картина "Черный квадрат" не так проста, как кажется на первый взгляд. Во-первых, он не совсем черный. Во-вторых, это не совсем квадрат. Дело в том, что его стороны не равны друг другу и не параллельны друг другу.
7	Купленный семьей щенок оказался лисицей и съел соседских кур и морских свинок	t	Семья приобрели щенка в небольшом магазине в центре города. Пока он не подрос, были уверены, что завели породистого пса. Когда щенок подрос, он стал охотиться на кур и уток, которых держали соседи. Затем он съел трех крупных морских свинок
9	Контрабандисты попытались вывезти из Колумбии пауков и тараканов	t	Двое немецких туристов собирались возвращаться домой, но их сумки показались таможенникам подозрительными. Обыскав багаж, люди обнаружили множество контейнеров, в которых находились 232 паука, скорпион и 7 его детёнышей, 9 паучьих яиц и 67 тараканов.
\.


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 9, true);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: idx_23a0e66b5a459a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_23a0e66b5a459a0 ON public.article USING btree (news_id);


--
-- Name: article fk_23a0e66b5a459a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT fk_23a0e66b5a459a0 FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- PostgreSQL database dump complete
--

