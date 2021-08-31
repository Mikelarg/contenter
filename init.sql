--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: content_audiocontent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_audiocontent (
    content_ptr_id integer NOT NULL,
    bitrate integer NOT NULL,
    CONSTRAINT content_audiocontent_bitrate_check CHECK ((bitrate >= 0))
);


ALTER TABLE public.content_audiocontent OWNER TO root;

--
-- Name: content_content; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_content (
    id integer NOT NULL,
    counter integer NOT NULL,
    title character varying(256) NOT NULL,
    polymorphic_ctype_id integer,
    CONSTRAINT content_content_counter_check CHECK ((counter >= 0))
);


ALTER TABLE public.content_content OWNER TO root;

--
-- Name: content_content_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.content_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_content_id_seq OWNER TO root;

--
-- Name: content_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.content_content_id_seq OWNED BY public.content_content.id;


--
-- Name: content_contenttopage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_contenttopage (
    id integer NOT NULL,
    "order" integer NOT NULL,
    content_id integer NOT NULL,
    page_id integer NOT NULL,
    CONSTRAINT content_contenttopage_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.content_contenttopage OWNER TO root;

--
-- Name: content_contenttopage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.content_contenttopage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_contenttopage_id_seq OWNER TO root;

--
-- Name: content_contenttopage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.content_contenttopage_id_seq OWNED BY public.content_contenttopage.id;


--
-- Name: content_page; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_page (
    id integer NOT NULL,
    title character varying(256) NOT NULL
);


ALTER TABLE public.content_page OWNER TO root;

--
-- Name: content_page_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.content_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.content_page_id_seq OWNER TO root;

--
-- Name: content_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.content_page_id_seq OWNED BY public.content_page.id;


--
-- Name: content_textcontent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_textcontent (
    content_ptr_id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.content_textcontent OWNER TO root;

--
-- Name: content_videocontent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.content_videocontent (
    content_ptr_id integer NOT NULL,
    video_url character varying(200) NOT NULL,
    subtitles_url character varying(200) NOT NULL
);


ALTER TABLE public.content_videocontent OWNER TO root;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: content_content id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_content ALTER COLUMN id SET DEFAULT nextval('public.content_content_id_seq'::regclass);


--
-- Name: content_contenttopage id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_contenttopage ALTER COLUMN id SET DEFAULT nextval('public.content_contenttopage_id_seq'::regclass);


--
-- Name: content_page id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_page ALTER COLUMN id SET DEFAULT nextval('public.content_page_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add content	7	add_content
26	Can change content	7	change_content
27	Can delete content	7	delete_content
28	Can view content	7	view_content
29	Can add content to page	8	add_contenttopage
30	Can change content to page	8	change_contenttopage
31	Can delete content to page	8	delete_contenttopage
32	Can view content to page	8	view_contenttopage
33	Can add audio content	9	add_audiocontent
34	Can change audio content	9	change_audiocontent
35	Can delete audio content	9	delete_audiocontent
36	Can view audio content	9	view_audiocontent
37	Can add text content	10	add_textcontent
38	Can change text content	10	change_textcontent
39	Can delete text content	10	delete_textcontent
40	Can view text content	10	view_textcontent
41	Can add video content	11	add_videocontent
42	Can change video content	11	change_videocontent
43	Can delete video content	11	delete_videocontent
44	Can view video content	11	view_videocontent
45	Can add page	12	add_page
46	Can change page	12	change_page
47	Can delete page	12	delete_page
48	Can view page	12	view_page
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$S6KJFoOHMu3i$wydPedmkaTK+aKgywjHCYnI0CKdgYa2m0s8kSuUf7yw=	2021-08-29 22:18:04.012275+05	t	root				t	t	2021-08-29 22:17:50.580616+05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: content_audiocontent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_audiocontent (content_ptr_id, bitrate) FROM stdin;
8	40960
5	40960
\.


--
-- Data for Name: content_content; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_content (id, counter, title, polymorphic_ctype_id) FROM stdin;
7	0	Очень интересное видео	11
8	0	Аудиофайл	9
9	0	Другое очень интересное видео	11
5	2	Какой-то аудиофайл	9
6	1	Какой-то текст про что-то другое	10
4	2	Какой-то текст	10
\.


--
-- Data for Name: content_contenttopage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_contenttopage (id, "order", content_id, page_id) FROM stdin;
8	1	4	3
9	2	5	3
10	1	6	4
11	2	5	4
12	1	7	5
13	1	6	6
14	2	8	6
15	1	4	7
16	2	9	7
17	1	6	8
18	2	4	8
19	1	5	9
20	2	7	9
21	1	9	10
22	2	7	10
23	1	5	11
24	2	8	11
25	1	7	12
26	2	4	12
\.


--
-- Data for Name: content_page; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_page (id, title) FROM stdin;
3	Страница 1
4	Страница 2
5	Страница 3
6	Страница 4
7	Страница 5
8	Страница 6
9	Страница 7
10	Страница 8
11	Страница 9
12	Страница 10
\.


--
-- Data for Name: content_textcontent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_textcontent (content_ptr_id, text) FROM stdin;
6	Про кого-то
4	Про что-то
\.


--
-- Data for Name: content_videocontent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.content_videocontent (content_ptr_id, video_url, subtitles_url) FROM stdin;
7	https://www.youtube.com/watch?v=dQw4w9WgXcQ	https://www.youtube.com/watch?v=dQw4w9WgXcQ
9	https://www.youtube.com/watch?v=dQw4w9WgXcQ	https://www.youtube.com/watch?v=dQw4w9WgXcQ
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-08-29 22:18:42.636128+05	1	test	1	[{"added": {}}]	11	1
2	2021-08-29 22:18:58.810977+05	2	3test	1	[{"added": {}}]	10	1
3	2021-08-29 22:19:11.394515+05	1	testset	1	[{"added": {}}, {"added": {"name": "content to page", "object": "ContentToPage object (1)"}}, {"added": {"name": "content to page", "object": "ContentToPage object (2)"}}]	12	1
4	2021-08-29 22:23:06.458565+05	1	testset	2	[{"changed": {"name": "content to page", "object": "ContentToPage object (1)", "fields": ["order"]}}, {"changed": {"name": "content to page", "object": "ContentToPage object (2)", "fields": ["order"]}}]	12	1
5	2021-08-29 22:25:14.030961+05	3	tetst	1	[{"added": {}}]	9	1
6	2021-08-29 22:25:16.319594+05	1	testset	2	[{"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}]	12	1
7	2021-08-29 22:25:46.388437+05	2	ttt	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}]	12	1
8	2021-08-29 22:39:40.367677+05	2	tett	2	[{"changed": {"fields": ["title"]}}]	12	1
9	2021-08-29 22:39:47.127742+05	2	ttet	2	[{"changed": {"fields": ["title"]}}]	12	1
10	2021-08-29 23:55:52.095016+05	1	testset	2	[{"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e", "fields": ["order"]}}, {"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442", "fields": ["order"]}}]	12	1
11	2021-08-29 23:56:01.321965+05	1	testset	2	[{"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442", "fields": ["order"]}}, {"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e", "fields": ["order"]}}]	12	1
12	2021-08-30 00:03:15.897647+05	1	testset	2	[{"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e", "fields": ["order"]}}, {"changed": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442", "fields": ["order"]}}]	12	1
13	2021-08-30 01:31:25.596445+05	1	testset	2	[{"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}]	12	1
14	2021-08-30 11:59:56.658593+05	3	 — tetst	3		7	1
15	2021-08-30 11:59:56.667298+05	2	 — 3test	3		7	1
16	2021-08-30 11:59:56.669193+05	1	 — test	3		7	1
17	2021-08-30 12:00:08.054912+05	2	ttet	3		12	1
18	2021-08-30 12:00:08.057296+05	1	testset	3		12	1
19	2021-08-30 12:01:09.35913+05	4	Текст — Какой-то текст	1	[{"added": {}}]	10	1
20	2021-08-30 12:01:32.504959+05	5	Аудио — Какой-то аудиофайл	1	[{"added": {}}]	9	1
21	2021-08-30 12:01:33.629066+05	3	Страница 1	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}]	12	1
22	2021-08-30 12:04:03.968677+05	5	Аудио — Какой-то аудиофайл	2	[{"changed": {"fields": ["bitrate"]}}]	9	1
23	2021-08-30 12:04:36.742918+05	6	Текст — Какой-то текст про что-то другое	1	[{"added": {}}]	10	1
24	2021-08-30 12:04:40.629437+05	4	Страница 2	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}]	12	1
25	2021-08-30 12:06:38.235456+05	7	Видео — Очень интересное видео	1	[{"added": {}}]	11	1
26	2021-08-30 12:06:43.284503+05	5	Страница 3	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}]	12	1
27	2021-08-30 12:07:20.703511+05	8	Аудио — Аудиофайл	1	[{"added": {}}]	9	1
28	2021-08-30 12:07:25.000155+05	6	Страница 4	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}]	12	1
29	2021-08-30 12:07:46.535174+05	9	Видео — Другое очень интересное видео	1	[{"added": {}}]	11	1
30	2021-08-30 12:07:47.914853+05	7	Страница 5	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}]	12	1
31	2021-08-30 12:08:01.284976+05	8	Страница 6	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}]	12	1
32	2021-08-30 12:08:10.759778+05	9	Страница 7	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}]	12	1
33	2021-08-30 12:08:21.136096+05	10	Страница 8	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}]	12	1
34	2021-08-30 12:08:30.679514+05	11	Страница 9	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0410\\u0443\\u0434\\u0438\\u043e"}}]	12	1
35	2021-08-30 12:08:45.590729+05	12	Страница 10	1	[{"added": {}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0412\\u0438\\u0434\\u0435\\u043e"}}, {"added": {"name": "content to page", "object": "\\u041a\\u043e\\u043d\\u0442\\u0435\\u043d\\u0442 \\u2014 \\u0422\\u0435\\u043a\\u0441\\u0442"}}]	12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	content	content
8	content	contenttopage
9	content	audiocontent
10	content	textcontent
11	content	videocontent
12	content	page
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-29 22:14:53.320297+05
2	auth	0001_initial	2021-08-29 22:14:53.350029+05
3	admin	0001_initial	2021-08-29 22:14:53.381716+05
4	admin	0002_logentry_remove_auto_add	2021-08-29 22:14:53.395465+05
5	admin	0003_logentry_add_action_flag_choices	2021-08-29 22:14:53.402738+05
6	contenttypes	0002_remove_content_type_name	2021-08-29 22:14:53.425539+05
7	auth	0002_alter_permission_name_max_length	2021-08-29 22:14:53.435319+05
8	auth	0003_alter_user_email_max_length	2021-08-29 22:14:53.445949+05
9	auth	0004_alter_user_username_opts	2021-08-29 22:14:53.459511+05
10	auth	0005_alter_user_last_login_null	2021-08-29 22:14:53.470494+05
11	auth	0006_require_contenttypes_0002	2021-08-29 22:14:53.4726+05
12	auth	0007_alter_validators_add_error_messages	2021-08-29 22:14:53.483901+05
13	auth	0008_alter_user_username_max_length	2021-08-29 22:14:53.497195+05
14	auth	0009_alter_user_last_name_max_length	2021-08-29 22:14:53.50944+05
15	auth	0010_alter_group_name_max_length	2021-08-29 22:14:53.521177+05
16	auth	0011_update_proxy_permissions	2021-08-29 22:14:53.532913+05
17	content	0001_initial	2021-08-29 22:14:53.652883+05
18	sessions	0001_initial	2021-08-29 22:14:53.663252+05
19	content	0002_auto_20210829_1750	2021-08-29 22:50:13.063463+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
tjfkwaze8tqcojwmhph2q9dtp81nkk17	MjJkNDRkNzQ1YjMzMWEwNDM1NjY1YTMxNmY2ZDE2NDNjNTFkNjJiMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MWQ0NTFlMDcyMTIzZGI1MjA1ZTgxMDY3YTIzZjFjMjZhYTVjYzg5In0=	2021-09-12 22:18:04.031575+05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: content_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.content_content_id_seq', 9, true);


--
-- Name: content_contenttopage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.content_contenttopage_id_seq', 26, true);


--
-- Name: content_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.content_page_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 35, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: content_audiocontent content_audiocontent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_audiocontent
    ADD CONSTRAINT content_audiocontent_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: content_content content_content_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_content
    ADD CONSTRAINT content_content_pkey PRIMARY KEY (id);


--
-- Name: content_contenttopage content_contenttopage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_contenttopage
    ADD CONSTRAINT content_contenttopage_pkey PRIMARY KEY (id);


--
-- Name: content_page content_page_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_page
    ADD CONSTRAINT content_page_pkey PRIMARY KEY (id);


--
-- Name: content_textcontent content_textcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_textcontent
    ADD CONSTRAINT content_textcontent_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: content_videocontent content_videocontent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_videocontent
    ADD CONSTRAINT content_videocontent_pkey PRIMARY KEY (content_ptr_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: content_content_polymorphic_ctype_id_b8ab5253; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX content_content_polymorphic_ctype_id_b8ab5253 ON public.content_content USING btree (polymorphic_ctype_id);


--
-- Name: content_contenttopage_content_id_9912432e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX content_contenttopage_content_id_9912432e ON public.content_contenttopage USING btree (content_id);


--
-- Name: content_contenttopage_page_id_723fcde9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX content_contenttopage_page_id_723fcde9 ON public.content_contenttopage USING btree (page_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_audiocontent content_audiocontent_content_ptr_id_3ad94123_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_audiocontent
    ADD CONSTRAINT content_audiocontent_content_ptr_id_3ad94123_fk_content_c FOREIGN KEY (content_ptr_id) REFERENCES public.content_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_content content_content_polymorphic_ctype_id_b8ab5253_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_content
    ADD CONSTRAINT content_content_polymorphic_ctype_id_b8ab5253_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contenttopage content_contenttopage_content_id_9912432e_fk_content_content_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_contenttopage
    ADD CONSTRAINT content_contenttopage_content_id_9912432e_fk_content_content_id FOREIGN KEY (content_id) REFERENCES public.content_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_contenttopage content_contenttopage_page_id_723fcde9_fk_content_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_contenttopage
    ADD CONSTRAINT content_contenttopage_page_id_723fcde9_fk_content_page_id FOREIGN KEY (page_id) REFERENCES public.content_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_textcontent content_textcontent_content_ptr_id_abb759a8_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_textcontent
    ADD CONSTRAINT content_textcontent_content_ptr_id_abb759a8_fk_content_c FOREIGN KEY (content_ptr_id) REFERENCES public.content_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_videocontent content_videocontent_content_ptr_id_748c4a6b_fk_content_c; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.content_videocontent
    ADD CONSTRAINT content_videocontent_content_ptr_id_748c4a6b_fk_content_c FOREIGN KEY (content_ptr_id) REFERENCES public.content_content(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

