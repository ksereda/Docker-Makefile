--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
  id bigint NOT NULL,
  email character varying NOT NULL,
  password character varying NOT NULL,
  first_name character varying NOT NULL,
  last_name character varying NOT NULL,
  enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts2roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts2roles (
  account_id bigint NOT NULL,
  role_id bigint NOT NULL
);


ALTER TABLE public.accounts2roles OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: agreement_confirmations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement_confirmations (
  id bigint NOT NULL,
  account_id bigint NOT NULL,
  date timestamp without time zone DEFAULT now() NOT NULL,
  ip character varying NOT NULL,
  organization_id bigint NOT NULL
);


ALTER TABLE public.agreement_confirmations OWNER TO postgres;

--
-- Name: agreement_confirmations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agreement_confirmations_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.agreement_confirmations_id_seq OWNER TO postgres;

--
-- Name: agreement_confirmations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agreement_confirmations_id_seq OWNED BY public.agreement_confirmations.id;


--
-- Name: billing_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_addresses (
  id bigint NOT NULL,
  first_address_line character varying NOT NULL,
  second_address_line character varying,
  city character varying NOT NULL,
  state character varying NOT NULL,
  zip_code character varying NOT NULL
);


ALTER TABLE public.billing_addresses OWNER TO postgres;

--
-- Name: billing_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_addresses_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.billing_addresses_id_seq OWNER TO postgres;

--
-- Name: billing_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_addresses_id_seq OWNED BY public.billing_addresses.id;


--
-- Name: comment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_types (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.comment_types OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
  id bigint NOT NULL,
  issue_id bigint NOT NULL,
  type_id integer NOT NULL,
  author character varying NOT NULL,
  date timestamp without time zone NOT NULL,
  content character varying NOT NULL,
  external_id character varying NOT NULL,
  meta character varying,
  deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: customer_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_accounts (
  id bigint NOT NULL,
  organization_id bigint NOT NULL,
  alternative_email character varying(255),
  "position" character varying(255) NOT NULL
);


ALTER TABLE public.customer_accounts OWNER TO postgres;

--
-- Name: discount_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_codes (
  id bigint NOT NULL,
  code character varying NOT NULL,
  discount integer NOT NULL,
  creation_date date DEFAULT now() NOT NULL,
  activated boolean DEFAULT false NOT NULL,
  organization_id bigint NOT NULL
);


ALTER TABLE public.discount_codes OWNER TO postgres;

--
-- Name: discount_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_codes_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.discount_codes_id_seq OWNER TO postgres;

--
-- Name: discount_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_codes_id_seq OWNED BY public.discount_codes.id;


--
-- Name: holidays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holidays (
  id bigint NOT NULL,
  date date NOT NULL
);


ALTER TABLE public.holidays OWNER TO postgres;

--
-- Name: holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holidays_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.holidays_id_seq OWNER TO postgres;

--
-- Name: holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holidays_id_seq OWNED BY public.holidays.id;


--
-- Name: hour_transaction_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hour_transaction_types (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.hour_transaction_types OWNER TO postgres;

--
-- Name: hour_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hour_transactions (
  id bigint NOT NULL,
  project_id bigint NOT NULL,
  amount integer NOT NULL,
  type_id integer NOT NULL,
  entity_id bigint NOT NULL,
  date date NOT NULL
);


ALTER TABLE public.hour_transactions OWNER TO postgres;

--
-- Name: hour_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hour_transactions_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.hour_transactions_id_seq OWNER TO postgres;

--
-- Name: hour_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hour_transactions_id_seq OWNED BY public.hour_transactions.id;


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
  id bigint NOT NULL,
  key character varying NOT NULL,
  project_id bigint NOT NULL,
  unit_count integer NOT NULL,
  price_per_unit numeric NOT NULL,
  debt integer NOT NULL,
  date date NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- Name: invoices2issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices2issues (
  invoice_id bigint NOT NULL,
  issue_id bigint NOT NULL
);


ALTER TABLE public.invoices2issues OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.invoices_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.invoices_id_seq OWNED BY public.invoices.id;


--
-- Name: issue_priorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_priorities (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.issue_priorities OWNER TO postgres;

--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_statuses (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.issue_statuses OWNER TO postgres;

--
-- Name: issue_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_types (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.issue_types OWNER TO postgres;

--
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
  id bigint NOT NULL,
  external_id character varying NOT NULL,
  project_id bigint NOT NULL,
  key character varying NOT NULL,
  title character varying NOT NULL,
  priority_id integer NOT NULL,
  type_id integer NOT NULL,
  estimate integer NOT NULL,
  status_id integer NOT NULL,
  deleted boolean DEFAULT false NOT NULL,
  epic_id character varying
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- Name: issues2sprints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues2sprints (
  issue_id bigint NOT NULL,
  sprint_id bigint NOT NULL
);


ALTER TABLE public.issues2sprints OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizations (
  id bigint NOT NULL,
  name character varying NOT NULL,
  active boolean DEFAULT false NOT NULL
);


ALTER TABLE public.organizations OWNER TO postgres;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organizations_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO postgres;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
  id bigint NOT NULL,
  account_id bigint NOT NULL,
  value character varying NOT NULL,
  valid boolean DEFAULT true NOT NULL,
  activation_date timestamp without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.password_reset_tokens_id_seq OWNER TO postgres;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: payment_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_accounts (
  id bigint NOT NULL,
  organization_id bigint NOT NULL,
  customer_id character varying NOT NULL,
  current_payment_source_id bigint,
  deleted boolean,
  billing_address_id bigint NOT NULL
);


ALTER TABLE public.payment_accounts OWNER TO postgres;

--
-- Name: payment_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_accounts_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.payment_accounts_id_seq OWNER TO postgres;

--
-- Name: payment_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_accounts_id_seq OWNED BY public.payment_accounts.id;


--
-- Name: payment_source_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_source_statuses (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.payment_source_statuses OWNER TO postgres;

--
-- Name: payment_source_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_source_types (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.payment_source_types OWNER TO postgres;

--
-- Name: payment_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_sources (
  id bigint NOT NULL,
  holder character varying NOT NULL,
  last4 character varying NOT NULL,
  name character varying NOT NULL,
  source_id character varying NOT NULL,
  status_id integer NOT NULL,
  type_id integer NOT NULL,
  account_id bigint
);


ALTER TABLE public.payment_sources OWNER TO postgres;

--
-- Name: payment_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_sources_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.payment_sources_id_seq OWNER TO postgres;

--
-- Name: payment_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_sources_id_seq OWNED BY public.payment_sources.id;


--
-- Name: project_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_origins (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.project_origins OWNER TO postgres;

--
-- Name: project_team_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_team_sizes (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.project_team_sizes OWNER TO postgres;

--
-- Name: project_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_types (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.project_types OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
  id bigint NOT NULL,
  organization_id bigint NOT NULL,
  name character varying NOT NULL,
  url character varying NOT NULL,
  username character varying NOT NULL,
  password character varying NOT NULL,
  type_id integer NOT NULL,
  origin_id integer NOT NULL,
  team_size_id integer NOT NULL,
  subscription_id bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects2zen_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects2zen_accounts (
  project_id bigint NOT NULL,
  zen_account_id bigint NOT NULL
);


ALTER TABLE public.projects2zen_accounts OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
  id bigint NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: schema_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_version (
  version_rank integer NOT NULL,
  installed_rank integer NOT NULL,
  version character varying(50) NOT NULL,
  description character varying(200) NOT NULL,
  type character varying(20) NOT NULL,
  script character varying(1000) NOT NULL,
  checksum integer,
  installed_by character varying(100) NOT NULL,
  installed_on timestamp without time zone DEFAULT now() NOT NULL,
  execution_time integer NOT NULL,
  success boolean NOT NULL
);


ALTER TABLE public.schema_version OWNER TO postgres;

--
-- Name: sprint_stages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint_stages (
  id bigint NOT NULL,
  sprint_id bigint NOT NULL,
  status_id integer NOT NULL,
  start_date date,
  end_date date,
  complete_date date
);


ALTER TABLE public.sprint_stages OWNER TO postgres;

--
-- Name: sprint_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprint_stages_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.sprint_stages_id_seq OWNER TO postgres;

--
-- Name: sprint_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprint_stages_id_seq OWNED BY public.sprint_stages.id;


--
-- Name: sprint_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprint_statuses (
  id integer NOT NULL,
  key character varying NOT NULL,
  duration integer NOT NULL
);


ALTER TABLE public.sprint_statuses OWNER TO postgres;

--
-- Name: sprints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sprints (
  id bigint NOT NULL,
  project_id bigint NOT NULL,
  capacity integer NOT NULL,
  external_id character varying NOT NULL,
  deleted boolean DEFAULT false NOT NULL,
  current_stage_id bigint
);


ALTER TABLE public.sprints OWNER TO postgres;

--
-- Name: sprints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sprints_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.sprints_id_seq OWNER TO postgres;

--
-- Name: sprints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sprints_id_seq OWNED BY public.sprints.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
  id bigint NOT NULL,
  name character varying NOT NULL,
  capacity integer NOT NULL,
  pay_per_hour numeric
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: transaction_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_statuses (
  id integer NOT NULL,
  key character varying NOT NULL
);


ALTER TABLE public.transaction_statuses OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
  id bigint NOT NULL,
  amount numeric NOT NULL,
  charge_id character varying NOT NULL,
  description character varying NOT NULL,
  issue_date timestamp without time zone NOT NULL,
  process_fee numeric NOT NULL,
  status_id integer NOT NULL,
  total numeric NOT NULL,
  account_id bigint NOT NULL,
  payment_source_id bigint NOT NULL,
  invoice_id bigint NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: worklogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worklogs (
  id bigint NOT NULL,
  external_id character varying NOT NULL,
  issue_id bigint NOT NULL,
  started timestamp with time zone,
  time_spent_seconds integer NOT NULL,
  deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.worklogs OWNER TO postgres;

--
-- Name: worklogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.worklogs_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


ALTER TABLE public.worklogs_id_seq OWNER TO postgres;

--
-- Name: worklogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.worklogs_id_seq OWNED BY public.worklogs.id;


--
-- Name: zen_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zen_accounts (
  id bigint NOT NULL,
  "position" character varying NOT NULL
);


ALTER TABLE public.zen_accounts OWNER TO postgres;

--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: agreement_confirmations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations ALTER COLUMN id SET DEFAULT nextval('public.agreement_confirmations_id_seq'::regclass);


--
-- Name: billing_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_addresses ALTER COLUMN id SET DEFAULT nextval('public.billing_addresses_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: discount_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_codes ALTER COLUMN id SET DEFAULT nextval('public.discount_codes_id_seq'::regclass);


--
-- Name: holidays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays ALTER COLUMN id SET DEFAULT nextval('public.holidays_id_seq'::regclass);


--
-- Name: hour_transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hour_transactions ALTER COLUMN id SET DEFAULT nextval('public.hour_transactions_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices ALTER COLUMN id SET DEFAULT nextval('public.invoices_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- Name: payment_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts ALTER COLUMN id SET DEFAULT nextval('public.payment_accounts_id_seq'::regclass);


--
-- Name: payment_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_sources ALTER COLUMN id SET DEFAULT nextval('public.payment_sources_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: sprint_stages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_stages ALTER COLUMN id SET DEFAULT nextval('public.sprint_stages_id_seq'::regclass);


--
-- Name: sprints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints ALTER COLUMN id SET DEFAULT nextval('public.sprints_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: worklogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worklogs ALTER COLUMN id SET DEFAULT nextval('public.worklogs_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, email, password, first_name, last_name, enabled) FROM stdin;
2	pm@zensoft.io	$2a$10$JPMpOWKQVI0DjrisxrXLiemmC.F.V9Sx6xv0zrZOj5UQXvv43d1zi	PM	ZenSoft	t
3	sagely@zensoft.io	$2a$10$P1LRCXoEa80ASDQlNsV6AerpMqWI1m576K.nEOf4o6RG/DlB.iSB2	Sagely	ZenSoft	t
4	goin@zensoft.io	$2a$10$wAfGzhR58B5ZKlRBv.itgu9WP2dIA7bAZZn16hlrTJ1fF6ikT6Su6	Goin	ZenSoft	t
5	admin@zensoft.io	$2a$10$A2wiEUf2gzWVZL7Zvjxv6.3BAauHkjxWL9UbKkZ19fdJIr23hSS/2	Admin	ZenSoft	t
\.


--
-- Data for Name: accounts2roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts2roles (account_id, role_id) FROM stdin;
2	2
3	1
4	1
5	4
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 5, true);


--
-- Data for Name: agreement_confirmations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agreement_confirmations (id, account_id, date, ip, organization_id) FROM stdin;
\.


--
-- Name: agreement_confirmations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agreement_confirmations_id_seq', 1, false);


--
-- Data for Name: billing_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_addresses (id, first_address_line, second_address_line, city, state, zip_code) FROM stdin;
\.


--
-- Name: billing_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_addresses_id_seq', 1, false);


--
-- Data for Name: comment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_types (id, key) FROM stdin;
1	PROBLEM
2	QUESTION
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, issue_id, type_id, author, date, content, external_id, meta, deleted) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Data for Name: customer_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_accounts (id, organization_id, alternative_email, "position") FROM stdin;
3	2	\N	default
4	3	\N	default
\.


--
-- Data for Name: discount_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discount_codes (id, code, discount, creation_date, activated, organization_id) FROM stdin;
\.


--
-- Name: discount_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_codes_id_seq', 1, false);


--
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holidays (id, date) FROM stdin;
\.


--
-- Name: holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holidays_id_seq', 1, false);


--
-- Data for Name: hour_transaction_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hour_transaction_types (id, key) FROM stdin;
1	PAYMENT
2	ITERATION
\.


--
-- Data for Name: hour_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hour_transactions (id, project_id, amount, type_id, entity_id, date) FROM stdin;
\.


--
-- Name: hour_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hour_transactions_id_seq', 1, false);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices (id, key, project_id, unit_count, price_per_unit, debt, date) FROM stdin;
1	S1-SAGELY-11142017	1	11	50	0	2017-11-14
\.


--
-- Data for Name: invoices2issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoices2issues (invoice_id, issue_id) FROM stdin;
\.


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 1, false);


--
-- Data for Name: issue_priorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_priorities (id, key) FROM stdin;
1	LOW
2	MID
3	HIGH
\.


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_statuses (id, key) FROM stdin;
1	TO_DO
2	IN_PROGRESS
3	TESTING
5	READY_FOR_REVIEW
4	TODO_DISPUTED
6	READY_FOR_DEPLOY
7	DEPLOYED
8	ACCEPTED
\.


--
-- Data for Name: issue_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_types (id, key) FROM stdin;
1	EPIC
2	OTHER
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (id, external_id, project_id, key, title, priority_id, type_id, estimate, status_id, deleted, epic_id) FROM stdin;
1	10026	1	SAG-27	Create initial project	2	2	0	6	f	\N
2	10028	1	SAG-29	Create database	2	2	0	6	f	\N
3	10030	1	SAG-31	Create several project configurations for different instances	2	2	0	6	f	\N
5	10031	1	SAG-32	Implement system architecture	2	2	14400	6	f	\N
6	10053	1	SAG-54	Establish project infrastruсture	2	2	0	6	f	\N
7	10032	1	SAG-33	Integrate RabbitMQ support	2	2	0	6	f	\N
8	10039	1	SAG-40	Configure front-end components structure	2	2	25200	6	f	\N
9	10036	1	SAG-37	Configure typescript + react	3	2	0	6	f	\N
10	10038	1	SAG-39	Integrate i18n (locales) for react	2	2	0	6	f	\N
11	10037	1	SAG-38	Configure react routing	2	2	0	6	f	\N
12	10042	1	SAG-43	Implement front-end services	2	2	0	6	f	\N
13	10043	1	SAG-44	Implement front-end repositories	2	2	0	6	f	\N
14	10040	1	SAG-41	Implement front-end models usage	2	2	0	6	f	\N
16	10058	1	SAG-59	Prepare build steps configuration for dev environments	2	2	0	6	f	\N
\.


--
-- Data for Name: issues2sprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues2sprints (issue_id, sprint_id) FROM stdin;
1	1
2	1
3	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
16	1
\.


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_id_seq', 1, false);


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organizations (id, name, active) FROM stdin;
1	ZenSoft, LLC	t
2	Sagely, LLC	t
3	Goin, LLC	t
\.


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organizations_id_seq', 3, true);


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (id, account_id, value, valid, activation_date) FROM stdin;
\.


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 1, false);


--
-- Data for Name: payment_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_accounts (id, organization_id, customer_id, current_payment_source_id, deleted, billing_address_id) FROM stdin;
\.


--
-- Name: payment_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_accounts_id_seq', 1, false);


--
-- Data for Name: payment_source_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_source_statuses (id, key) FROM stdin;
1	NOT_NEED
2	NEW
3	VALIDATED
4	VERIFIED
5	VERIFICATION_FAILED
6	ERRORED
\.


--
-- Data for Name: payment_source_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_source_types (id, key) FROM stdin;
1	CARD
2	BANK
\.


--
-- Data for Name: payment_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_sources (id, holder, last4, name, source_id, status_id, type_id, account_id) FROM stdin;
\.


--
-- Name: payment_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_sources_id_seq', 1, false);


--
-- Data for Name: project_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_origins (id, key) FROM stdin;
1	NEW
2	EXISTING
\.


--
-- Data for Name: project_team_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_team_sizes (id, key) FROM stdin;
1	NONE
2	SMALL
3	MID
4	LARGE
\.


--
-- Data for Name: project_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_types (id, key) FROM stdin;
1	WEB
2	MOBILE
3	MIXED
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, organization_id, name, url, username, password, type_id, origin_id, team_size_id, subscription_id) FROM stdin;
1	2	Sagely	https://sagely.atlassian.net/	qa@zensoft.io	S@gely_bish	1	1	1	1
\.


--
-- Data for Name: projects2zen_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects2zen_accounts (project_id, zen_account_id) FROM stdin;
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, key) FROM stdin;
1	ROLE_CUSTOMER
2	ROLE_PM
3	ROLE_ACTUATOR
4	ROLE_ADMIN
\.


--
-- Data for Name: schema_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_version (version_rank, installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	1.1	accounts	SQL	V1_1__accounts.sql	422566778	postgres	2018-03-22 11:00:39.959703	29	t
2	2	1.2	accounts2roles	SQL	V1_2__accounts2roles.sql	1531814169	postgres	2018-03-22 11:00:40.020831	25	t
3	3	1.3	projects	SQL	V1_3__projects.sql	-815616834	postgres	2018-03-22 11:00:40.062471	64	t
4	4	1.4	sprints	SQL	V1_4__sprints.sql	-753324593	postgres	2018-03-22 11:00:40.158026	24	t
5	5	1.5	issues	SQL	V1_5__issues.sql	-1486057870	postgres	2018-03-22 11:00:40.195498	38	t
6	6	1.6	password reset tokens	SQL	V1_6__password_reset_tokens.sql	-541730549	postgres	2018-03-22 11:00:40.24082	9	t
7	7	1.7	agreement confirmations	SQL	V1_7__agreement_confirmations.sql	-50767524	postgres	2018-03-22 11:00:40.256241	9	t
8	8	1.8	comments	SQL	V1_8__comments.sql	2011455902	postgres	2018-03-22 11:00:40.272046	23	t
9	9	1.9	calendar	SQL	V1_9__calendar.sql	1201026906	postgres	2018-03-22 11:00:40.30321	7	t
10	10	1.10	jira	SQL	V1_10__jira.sql	-346210874	postgres	2018-03-22 11:00:40.32497	11	t
11	11	1.11	init accounts	SQL	V1_11__init_accounts.sql	1045531652	postgres	2018-03-22 11:00:40.360231	16	t
12	12	1.12	payment init	SQL	V1_12__payment_init.sql	-1361289445	postgres	2018-03-22 11:00:40.395026	56	t
13	13	1.13	init accounts	SQL	V1_13__init_accounts.sql	-1716418053	postgres	2018-03-22 11:00:40.461283	8	t
14	14	1.14	discount codes	SQL	V1_14__discount_codes.sql	320630852	postgres	2018-03-22 11:00:40.479748	12	t
15	15	1.15	invoice	SQL	V1_15__invoice.sql	-1484884907	postgres	2018-03-22 11:00:40.507627	19	t
16	16	1.16	subscription	SQL	V1_16__subscription.sql	-1275770671	postgres	2018-03-22 11:00:40.545932	15	t
17	17	1.17	hour transaction	SQL	V1_17__hour_transaction.sql	217173183	postgres	2018-03-22 11:00:40.569709	12	t
18	18	1.19	issue estimate removed not null	SQL	V1_19__issue_estimate_removed_not_null.sql	-1823811666	postgres	2018-03-22 11:00:40.58917	2	t
19	19	1.20	added epic issue id	SQL	V1_20__added_epic_issue_id.sql	-666152143	postgres	2018-03-22 11:00:40.597508	2	t
20	20	1.21	change disputed issue status	SQL	V1_21__change_disputed_issue_status.sql	-702188915	postgres	2018-03-22 11:00:40.607163	2	t
21	21	1.22	remove number field	SQL	V1_22__remove_number_field.sql	-63847046	postgres	2018-03-22 11:00:40.61601	11	t
22	22	1.23	edit sprint stage	SQL	V1_23__edit_sprint_stage.sql	1890985834	postgres	2018-03-22 11:00:40.640299	4	t
23	23	1.24	CV 216 customer account	SQL	V1_24__CV_216_customer_account.sql	1529818425	postgres	2018-03-22 11:00:40.665497	26	t
24	24	1.25	billing address	SQL	V1_25__billing_address.sql	-469744490	postgres	2018-03-22 11:00:40.705486	12	t
25	25	1.26	added issues2sprints	SQL	V1_26__added_issues2sprints.sql	567227224	postgres	2018-03-22 11:00:40.728759	8	t
26	26	1.27	worklogs	SQL	V1_27__worklogs.sql	1563133294	postgres	2018-03-22 11:00:40.746596	11	t
27	27	1.28	nullable charge id	SQL	V1_28__nullable_charge_id.sql	-1989912080	postgres	2018-03-22 11:00:40.767534	5	t
28	28	1.29	transaction status and invoice id	SQL	V1_29__transaction_status_and_invoice_id.sql	1799490217	postgres	2018-03-22 11:00:40.782353	7	t
29	29	1.30	add relation organization agreement	SQL	V1_30__add_relation_organization_agreement.sql	1157361629	postgres	2018-03-22 11:00:40.79932	19	t
30	30	1.31	add statuses to issue	SQL	V1_31__add_statuses_to_issue.sql	-2014483412	postgres	2018-03-22 11:00:40.828425	3	t
31	31	1.32	add admin role	SQL	V1_32__add_admin_role.sql	1907724291	postgres	2018-03-22 11:00:40.841887	7	t
32	32	1.34	fix admin id	SQL	V1_34__fix_admin_id.sql	-1954095727	postgres	2018-03-22 11:00:40.858284	4	t
33	33	1.35	remove message from discount codes	SQL	V1_35__remove_message_from_discount_codes.sql	-1461259215	postgres	2018-03-22 11:00:40.87196	2	t
34	34	1.36	mv active field from customer to organization	SQL	V1_36__mv_active_field_from_customer_to_organization.sql	828079451	postgres	2018-03-22 11:00:40.884372	12	t
35	35	1.37	remove delete flag from customer	SQL	V1_37__remove_delete_flag_from_customer.sql	-1249839691	postgres	2018-03-22 11:00:40.906614	1	t
36	36	1.38	change account enable to true	SQL	V1_38__change_account_enable_to_true.sql	-1718699697	postgres	2018-03-22 11:00:40.939559	2	t
37	37	1.39	add projects2zen accounts	SQL	V1_39__add_projects2zen_accounts.sql	2141473657	postgres	2018-03-22 11:00:40.946611	5	t
38	38	1.40	rename amount in discount code	SQL	V1_40__rename_amount_in_discount_code.sql	-561507040	postgres	2018-03-22 11:00:40.957528	1	t
\.


--
-- Data for Name: sprint_stages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint_stages (id, sprint_id, status_id, start_date, end_date, complete_date) FROM stdin;
1	1	1	2017-11-08	2017-11-10	2017-11-10
2	1	2	2017-11-13	2017-11-14	2017-11-14
\.


--
-- Name: sprint_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprint_stages_id_seq', 1, false);


--
-- Data for Name: sprint_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprint_statuses (id, key, duration) FROM stdin;
1	ASSEMBLE	3
2	APPROVE	2
3	IN_PROGRESS	10
4	ACCEPT	5
\.


--
-- Data for Name: sprints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sprints (id, project_id, capacity, external_id, deleted, current_stage_id) FROM stdin;
1	1	300	1	f	2
\.


--
-- Name: sprints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sprints_id_seq', 1, false);


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, name, capacity, pay_per_hour) FROM stdin;
1	Low Capacity	400	50
2	Medium Capacity	800	45
3	High Capacity	1600	41
\.


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 3, true);


--
-- Data for Name: transaction_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_statuses (id, key) FROM stdin;
4	FAILED
3	PENDING
2	SUCCEEDED
1	INITIATED
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, amount, charge_id, description, issue_date, process_fee, status_id, total, account_id, payment_source_id, invoice_id) FROM stdin;
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 1, false);


--
-- Data for Name: worklogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.worklogs (id, external_id, issue_id, started, time_spent_seconds, deleted) FROM stdin;
\.


--
-- Name: worklogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.worklogs_id_seq', 1, false);


--
-- Data for Name: zen_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zen_accounts (id, "position") FROM stdin;
2	PM
5	Head of PM
\.


--
-- Name: accounts2roles accounts2roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts2roles
  ADD CONSTRAINT accounts2roles_pkey PRIMARY KEY (account_id, role_id);


--
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
  ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
  ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: agreement_confirmations agreement_confirmations_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations
  ADD CONSTRAINT agreement_confirmations_account_id_key UNIQUE (account_id);


--
-- Name: agreement_confirmations agreement_confirmations_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations
  ADD CONSTRAINT agreement_confirmations_organization_id_key UNIQUE (organization_id);


--
-- Name: agreement_confirmations agreement_confirmations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations
  ADD CONSTRAINT agreement_confirmations_pkey PRIMARY KEY (id);


--
-- Name: billing_addresses billing_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_addresses
  ADD CONSTRAINT billing_addresses_pkey PRIMARY KEY (id);


--
-- Name: comment_types comment_types_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_types
  ADD CONSTRAINT comment_types_key_key UNIQUE (key);


--
-- Name: comment_types comment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_types
  ADD CONSTRAINT comment_types_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
  ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: customer_accounts customer_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_accounts
  ADD CONSTRAINT customer_accounts_pkey PRIMARY KEY (id);


--
-- Name: discount_codes discount_codes_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_codes
  ADD CONSTRAINT discount_codes_organization_id_key UNIQUE (organization_id);


--
-- Name: discount_codes discount_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_codes
  ADD CONSTRAINT discount_codes_pkey PRIMARY KEY (id);


--
-- Name: holidays holidays_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
  ADD CONSTRAINT holidays_date_key UNIQUE (date);


--
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
  ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- Name: hour_transaction_types hour_transaction_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hour_transaction_types
  ADD CONSTRAINT hour_transaction_types_pkey PRIMARY KEY (id);


--
-- Name: hour_transactions hour_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hour_transactions
  ADD CONSTRAINT hour_transactions_pkey PRIMARY KEY (id);


--
-- Name: invoices2issues invoices2issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices2issues
  ADD CONSTRAINT invoices2issues_pkey PRIMARY KEY (invoice_id, issue_id);


--
-- Name: invoices invoices_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
  ADD CONSTRAINT invoices_key_key UNIQUE (key);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
  ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: issue_priorities issue_priorities_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_priorities
  ADD CONSTRAINT issue_priorities_key_key UNIQUE (key);


--
-- Name: issue_priorities issue_priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_priorities
  ADD CONSTRAINT issue_priorities_pkey PRIMARY KEY (id);


--
-- Name: issues issue_project_and_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issue_project_and_external_id_unique UNIQUE (project_id, external_id);


--
-- Name: issue_statuses issue_statuses_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses
  ADD CONSTRAINT issue_statuses_key_key UNIQUE (key);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses
  ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issue_types issue_types_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_types
  ADD CONSTRAINT issue_types_key_key UNIQUE (key);


--
-- Name: issue_types issue_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_types
  ADD CONSTRAINT issue_types_pkey PRIMARY KEY (id);


--
-- Name: issues2sprints issues2sprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues2sprints
  ADD CONSTRAINT issues2sprints_pkey PRIMARY KEY (issue_id, sprint_id);


--
-- Name: issues issues_external_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_external_id_key UNIQUE (external_id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: issues issues_project_id_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_project_id_key_key UNIQUE (project_id, key);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizations
  ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
  ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_value_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
  ADD CONSTRAINT password_reset_tokens_value_key UNIQUE (value);


--
-- Name: payment_accounts payment_accounts_billing_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT payment_accounts_billing_address_id_key UNIQUE (billing_address_id);


--
-- Name: payment_accounts payment_accounts_current_payment_source_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT payment_accounts_current_payment_source_id_key UNIQUE (current_payment_source_id);


--
-- Name: payment_accounts payment_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT payment_accounts_pkey PRIMARY KEY (id);


--
-- Name: payment_source_statuses payment_source_statuses_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_source_statuses
  ADD CONSTRAINT payment_source_statuses_key_key UNIQUE (key);


--
-- Name: payment_source_statuses payment_source_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_source_statuses
  ADD CONSTRAINT payment_source_statuses_pkey PRIMARY KEY (id);


--
-- Name: payment_source_types payment_source_types_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_source_types
  ADD CONSTRAINT payment_source_types_key_key UNIQUE (key);


--
-- Name: payment_source_types payment_source_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_source_types
  ADD CONSTRAINT payment_source_types_pkey PRIMARY KEY (id);


--
-- Name: payment_sources payment_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_sources
  ADD CONSTRAINT payment_sources_pkey PRIMARY KEY (id);


--
-- Name: sprints project_and_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
  ADD CONSTRAINT project_and_external_id_unique UNIQUE (external_id, project_id);


--
-- Name: project_origins project_origins_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_origins
  ADD CONSTRAINT project_origins_key_key UNIQUE (key);


--
-- Name: project_origins project_origins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_origins
  ADD CONSTRAINT project_origins_pkey PRIMARY KEY (id);


--
-- Name: project_team_sizes project_team_sizes_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_team_sizes
  ADD CONSTRAINT project_team_sizes_key_key UNIQUE (key);


--
-- Name: project_team_sizes project_team_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_team_sizes
  ADD CONSTRAINT project_team_sizes_pkey PRIMARY KEY (id);


--
-- Name: project_types project_types_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_types
  ADD CONSTRAINT project_types_key_key UNIQUE (key);


--
-- Name: project_types project_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_types
  ADD CONSTRAINT project_types_pkey PRIMARY KEY (id);


--
-- Name: projects2zen_accounts projects2zen_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects2zen_accounts
  ADD CONSTRAINT projects2zen_accounts_pkey PRIMARY KEY (project_id, zen_account_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: roles roles_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
  ADD CONSTRAINT roles_key_key UNIQUE (key);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
  ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_version schema_version_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_version
  ADD CONSTRAINT schema_version_pk PRIMARY KEY (version);


--
-- Name: sprints sprint_project_and_external_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
  ADD CONSTRAINT sprint_project_and_external_id_unique UNIQUE (project_id, external_id);


--
-- Name: sprint_stages sprint_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_stages
  ADD CONSTRAINT sprint_stages_pkey PRIMARY KEY (id);


--
-- Name: sprint_statuses sprint_statuses_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_statuses
  ADD CONSTRAINT sprint_statuses_key_key UNIQUE (key);


--
-- Name: sprint_statuses sprint_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_statuses
  ADD CONSTRAINT sprint_statuses_pkey PRIMARY KEY (id);


--
-- Name: sprints sprints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
  ADD CONSTRAINT sprints_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
  ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: transaction_statuses transaction_statuses_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_statuses
  ADD CONSTRAINT transaction_statuses_key_key UNIQUE (key);


--
-- Name: transaction_statuses transaction_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_statuses
  ADD CONSTRAINT transaction_statuses_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
  ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: projects url_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT url_unique UNIQUE (url);


--
-- Name: worklogs worklogs_external_id_issue_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worklogs
  ADD CONSTRAINT worklogs_external_id_issue_id_key UNIQUE (external_id, issue_id);


--
-- Name: worklogs worklogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worklogs
  ADD CONSTRAINT worklogs_pkey PRIMARY KEY (id);


--
-- Name: zen_accounts zen_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zen_accounts
  ADD CONSTRAINT zen_accounts_pkey PRIMARY KEY (id);


--
-- Name: payment_accounts_unique_organization_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payment_accounts_unique_organization_id ON public.payment_accounts USING btree (organization_id) WHERE (NOT deleted);


--
-- Name: schema_version_ir_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_ir_idx ON public.schema_version USING btree (installed_rank);


--
-- Name: schema_version_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_s_idx ON public.schema_version USING btree (success);


--
-- Name: schema_version_vr_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_vr_idx ON public.schema_version USING btree (version_rank);


--
-- Name: accounts2roles accounts2roles_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts2roles
  ADD CONSTRAINT accounts2roles_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: accounts2roles accounts2roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts2roles
  ADD CONSTRAINT accounts2roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: agreement_confirmations agreement_confirmations_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations
  ADD CONSTRAINT agreement_confirmations_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.customer_accounts(id);


--
-- Name: agreement_confirmations agreement_confirmations_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_confirmations
  ADD CONSTRAINT agreement_confirmations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: comments comments_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
  ADD CONSTRAINT comments_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);


--
-- Name: comments comments_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
  ADD CONSTRAINT comments_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.comment_types(id);


--
-- Name: customer_accounts customer_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_accounts
  ADD CONSTRAINT customer_accounts_id_fkey FOREIGN KEY (id) REFERENCES public.accounts(id);


--
-- Name: customer_accounts customer_accounts_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_accounts
  ADD CONSTRAINT customer_accounts_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: discount_codes discount_codes_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_codes
  ADD CONSTRAINT discount_codes_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: payment_accounts fk_payment_account_current_payment_source; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT fk_payment_account_current_payment_source FOREIGN KEY (current_payment_source_id) REFERENCES public.payment_sources(id);


--
-- Name: hour_transactions hour_transactions_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hour_transactions
  ADD CONSTRAINT hour_transactions_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: hour_transactions hour_transactions_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hour_transactions
  ADD CONSTRAINT hour_transactions_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.hour_transaction_types(id);


--
-- Name: invoices2issues invoices2issues_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices2issues
  ADD CONSTRAINT invoices2issues_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: invoices2issues invoices2issues_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices2issues
  ADD CONSTRAINT invoices2issues_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);


--
-- Name: invoices invoices_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
  ADD CONSTRAINT invoices_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: issues2sprints issues2sprints_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues2sprints
  ADD CONSTRAINT issues2sprints_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);


--
-- Name: issues2sprints issues2sprints_sprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues2sprints
  ADD CONSTRAINT issues2sprints_sprint_id_fkey FOREIGN KEY (sprint_id) REFERENCES public.sprints(id);


--
-- Name: issues issues_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.issue_priorities(id);


--
-- Name: issues issues_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: issues issues_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.issue_statuses(id);


--
-- Name: issues issues_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
  ADD CONSTRAINT issues_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.issue_types(id);


--
-- Name: password_reset_tokens password_reset_tokens_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
  ADD CONSTRAINT password_reset_tokens_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


--
-- Name: payment_accounts payment_accounts_billing_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT payment_accounts_billing_address_id_fkey FOREIGN KEY (billing_address_id) REFERENCES public.billing_addresses(id);


--
-- Name: payment_accounts payment_accounts_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_accounts
  ADD CONSTRAINT payment_accounts_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: payment_sources payment_sources_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_sources
  ADD CONSTRAINT payment_sources_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.payment_accounts(id);


--
-- Name: projects2zen_accounts projects2zen_accounts_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects2zen_accounts
  ADD CONSTRAINT projects2zen_accounts_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: projects2zen_accounts projects2zen_accounts_zen_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects2zen_accounts
  ADD CONSTRAINT projects2zen_accounts_zen_account_id_fkey FOREIGN KEY (zen_account_id) REFERENCES public.zen_accounts(id);


--
-- Name: projects projects_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organizations(id);


--
-- Name: projects projects_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_origin_id_fkey FOREIGN KEY (origin_id) REFERENCES public.project_origins(id);


--
-- Name: projects projects_subscription_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_subscription_id_fkey FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);


--
-- Name: projects projects_team_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_team_size_id_fkey FOREIGN KEY (team_size_id) REFERENCES public.project_team_sizes(id);


--
-- Name: projects projects_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
  ADD CONSTRAINT projects_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.project_types(id);


--
-- Name: sprint_stages sprint_stages_sprint_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_stages
  ADD CONSTRAINT sprint_stages_sprint_id_fkey FOREIGN KEY (sprint_id) REFERENCES public.sprints(id);


--
-- Name: sprint_stages sprint_stages_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprint_stages
  ADD CONSTRAINT sprint_stages_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.sprint_statuses(id);


--
-- Name: sprints sprints_current_stage_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
  ADD CONSTRAINT sprints_current_stage_id_fkey FOREIGN KEY (current_stage_id) REFERENCES public.sprint_stages(id);


--
-- Name: sprints sprints_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sprints
  ADD CONSTRAINT sprints_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: transactions transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
  ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.payment_accounts(id);


--
-- Name: transactions transactions_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
  ADD CONSTRAINT transactions_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoices(id);


--
-- Name: transactions transactions_payment_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
  ADD CONSTRAINT transactions_payment_source_id_fkey FOREIGN KEY (payment_source_id) REFERENCES public.payment_sources(id);


--
-- Name: worklogs worklogs_issue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worklogs
  ADD CONSTRAINT worklogs_issue_id_fkey FOREIGN KEY (issue_id) REFERENCES public.issues(id);


--
-- Name: zen_accounts zen_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zen_accounts
  ADD CONSTRAINT zen_accounts_id_fkey FOREIGN KEY (id) REFERENCES public.accounts(id);


--
-- PostgreSQL database dump complete
--
