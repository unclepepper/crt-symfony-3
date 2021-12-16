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
    description character varying(255) DEFAULT NULL::character varying,
    article_id integer
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
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.article (id, news_id, text, create_at) FROM stdin;
8	4	<div>Жили у бабуси два веселых гуся</div>	2021-12-15 18:01:00
9	6	<div>Новость про оленя</div>	2021-12-10 18:53:00
10	8	<div>Секрет черного квадрата</div>	2021-12-16 14:50:00
11	7	<div>Комментарий про щенка</div>	2021-12-15 14:51:00
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20211210094605	2021-12-10 09:48:33	80
DoctrineMigrations\\Version20211210183717	2021-12-10 18:37:49	64
DoctrineMigrations\\Version20211210185705	2021-12-13 13:33:42	46
DoctrineMigrations\\Version20211213133301	2021-12-13 13:33:42	0
DoctrineMigrations\\Version20211215085425	2021-12-15 08:54:46	68
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, title, is_show, description, article_id) FROM stdin;
4	Одинокая корова устроила забег по Софийской улице и удивила автомобилистов	t	Необычного «участника дорожного движения» можно было наблюдать во вторник.  Прямо по обочине Софийской улице бегала корова . Судя по видео, корова всерьез решила посостязаться в скорости с машинами: по обочине она мчалась весьма быстро.	\N
6	Олень позвонил в дверь мужчине и напугал его	t	Инцидент произошел в штате Колорадо. К крыльцу подошел большой олень. Животное ело цветы и случайно позвонило в дверь американцу, а после погрызло висящий у входа рождественский венок и ушло обратно в лес	\N
8	В чем секрет "Черного квадрата" Малевича и почему это шедевр	t	На самом деле, картина "Черный квадрат" не так проста, как кажется на первый взгляд. Во-первых, он не совсем черный. Во-вторых, это не совсем квадрат. Дело в том, что его стороны не равны друг другу и не параллельны друг другу.	\N
7	Купленный семьей щенок оказался лисицей и съел соседских кур и морских свинок	t	Семья приобрели щенка в небольшом магазине в центре города. Пока он не подрос, были уверены, что завели породистого пса. Когда щенок подрос, он стал охотиться на кур и уток, которых держали соседи. Затем он съел трех крупных морских свинок	\N
9	Контрабандисты попытались вывезти из Колумбии пауков и тараканов	t	Двое немецких туристов собирались возвращаться домой, но их сумки показались таможенникам подозрительными. Обыскав багаж, люди обнаружили множество контейнеров, в которых находились 232 паука, скорпион и 7 его детёнышей, 9 паучьих яиц и 67 тараканов.	\N
1	В Саудовской Аравии более 40 верблюдов сняли с конкурса красоты	t	Более 40 верблюдов были дисквалифицированы с конкурса красоты в Саудовской Аравии после того, как десяткам животных сделали ботокс, подтяжку лица, а также вкололи гормоны, стимулирующие мышцы.	\N
10	New	f	Жили- были дед да баба	\N
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, email, roles, password, is_verified) FROM stdin;
3	test@mail.ru	[]	$2y$13$cccYRXRvuJ9Yyuahbk127ODotRansIDrXBamhMQZ45QFNDTq/tQYO	f
\.


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.article_id_seq', 11, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 10, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


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
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_1dd399507294869c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_1dd399507294869c ON public.news USING btree (article_id);


--
-- Name: idx_23a0e66b5a459a0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_23a0e66b5a459a0 ON public.article USING btree (news_id);


--
-- Name: uniq_8d93d649e7927c74; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8d93d649e7927c74 ON public."user" USING btree (email);


--
-- Name: news fk_1dd399507294869c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT fk_1dd399507294869c FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: article fk_23a0e66b5a459a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT fk_23a0e66b5a459a0 FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- PostgreSQL database dump complete
--

