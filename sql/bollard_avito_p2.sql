--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.21

-- Started on 2026-07-22 16:49:08

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

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 1839624894)
-- Name: avito_product_list; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.avito_product_list (
    id bigint NOT NULL,
    avito_id bigint NOT NULL,
    ad_id bigint,
    price real,
    status character varying(20),
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.avito_product_list OWNER TO postgreadmin;

--
-- TOC entry 197 (class 1259 OID 1839624897)
-- Name: avito_product_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.avito_product_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avito_product_list_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 197
-- Name: avito_product_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.avito_product_list_id_seq OWNED BY public.avito_product_list.id;


--
-- TOC entry 198 (class 1259 OID 1839624899)
-- Name: avz_products; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.avz_products (
    id bigint NOT NULL,
    products_uploads_id bigint NOT NULL,
    sku integer,
    name text,
    part_number character varying(150),
    created_at timestamp without time zone NOT NULL,
    stock character varying(10)
);


ALTER TABLE public.avz_products OWNER TO postgreadmin;

--
-- TOC entry 199 (class 1259 OID 1839624905)
-- Name: avz_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.avz_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avz_products_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 199
-- Name: avz_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.avz_products_id_seq OWNED BY public.avz_products.id;


--
-- TOC entry 200 (class 1259 OID 1839624907)
-- Name: avz_products_products_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.avz_products_products_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avz_products_products_uploads_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 200
-- Name: avz_products_products_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.avz_products_products_uploads_id_seq OWNED BY public.avz_products.products_uploads_id;


--
-- TOC entry 201 (class 1259 OID 1839624909)
-- Name: avz_products_uploads; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.avz_products_uploads (
    id bigint NOT NULL,
    file_name character varying(255),
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.avz_products_uploads OWNER TO postgreadmin;

--
-- TOC entry 202 (class 1259 OID 1839624912)
-- Name: avz_products_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.avz_products_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avz_products_uploads_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 202
-- Name: avz_products_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.avz_products_uploads_id_seq OWNED BY public.avz_products_uploads.id;


--
-- TOC entry 203 (class 1259 OID 1839624914)
-- Name: inventory_avito; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.inventory_avito (
    id bigint NOT NULL,
    avito_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory_avito OWNER TO postgreadmin;

--
-- TOC entry 204 (class 1259 OID 1839624917)
-- Name: meta_function; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.meta_function (
    id bigint NOT NULL,
    process_num bigint NOT NULL,
    num bigint NOT NULL,
    parent bigint NOT NULL,
    code character varying(10),
    bundle_name character varying(250),
    name character varying(250),
    description text,
    url character varying(250),
    command character varying(250),
    tasks_qdpm character varying(250),
    stores character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    log_path character varying(256)
);


ALTER TABLE public.meta_function OWNER TO postgreadmin;

--
-- TOC entry 205 (class 1259 OID 1839624923)
-- Name: meta_function_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.meta_function_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_function_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 205
-- Name: meta_function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.meta_function_id_seq OWNED BY public.meta_function.id;


--
-- TOC entry 206 (class 1259 OID 1839624925)
-- Name: meta_process; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.meta_process (
    id bigint NOT NULL,
    num bigint NOT NULL,
    parent bigint NOT NULL,
    code character varying(10),
    name character varying(250),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.meta_process OWNER TO postgreadmin;

--
-- TOC entry 207 (class 1259 OID 1839624928)
-- Name: meta_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.meta_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_process_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 207
-- Name: meta_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.meta_process_id_seq OWNED BY public.meta_process.id;


--
-- TOC entry 208 (class 1259 OID 1839624930)
-- Name: meta_store; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.meta_store (
    id bigint NOT NULL,
    num bigint NOT NULL,
    code character varying(10),
    name character varying(250),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.meta_store OWNER TO postgreadmin;

--
-- TOC entry 209 (class 1259 OID 1839624936)
-- Name: meta_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.meta_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meta_store_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 209
-- Name: meta_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.meta_store_id_seq OWNED BY public.meta_store.id;


--
-- TOC entry 210 (class 1259 OID 1839624938)
-- Name: prepared_list; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.prepared_list (
    id bigint NOT NULL,
    product_list_id bigint NOT NULL,
    product_id bigint NOT NULL,
    offer_id bigint NOT NULL,
    kol integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.prepared_list OWNER TO postgreadmin;

--
-- TOC entry 211 (class 1259 OID 1839624941)
-- Name: prepared_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.prepared_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prepared_list_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 211
-- Name: prepared_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.prepared_list_id_seq OWNED BY public.prepared_list.id;


--
-- TOC entry 212 (class 1259 OID 1839624943)
-- Name: products_map; Type: TABLE; Schema: public; Owner: postgreadmin
--

CREATE TABLE public.products_map (
    id bigint NOT NULL,
    avito_id bigint NOT NULL,
    ad_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.products_map OWNER TO postgreadmin;

--
-- TOC entry 213 (class 1259 OID 1839624946)
-- Name: products_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.products_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_map_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 213
-- Name: products_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.products_map_id_seq OWNED BY public.products_map.id;


--
-- TOC entry 214 (class 1259 OID 1839624948)
-- Name: remainds_avito_id_seq; Type: SEQUENCE; Schema: public; Owner: postgreadmin
--

CREATE SEQUENCE public.remainds_avito_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remainds_avito_id_seq OWNER TO postgreadmin;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 214
-- Name: remainds_avito_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgreadmin
--

ALTER SEQUENCE public.remainds_avito_id_seq OWNED BY public.inventory_avito.id;


--
-- TOC entry 2097 (class 2604 OID 1839624950)
-- Name: avito_product_list id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avito_product_list ALTER COLUMN id SET DEFAULT nextval('public.avito_product_list_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 1839624951)
-- Name: avz_products id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avz_products ALTER COLUMN id SET DEFAULT nextval('public.avz_products_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 1839624952)
-- Name: avz_products products_uploads_id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avz_products ALTER COLUMN products_uploads_id SET DEFAULT nextval('public.avz_products_products_uploads_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 1839624953)
-- Name: avz_products_uploads id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avz_products_uploads ALTER COLUMN id SET DEFAULT nextval('public.avz_products_uploads_id_seq'::regclass);


--
-- TOC entry 2101 (class 2604 OID 1839624954)
-- Name: inventory_avito id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.inventory_avito ALTER COLUMN id SET DEFAULT nextval('public.remainds_avito_id_seq'::regclass);


--
-- TOC entry 2102 (class 2604 OID 1839624955)
-- Name: meta_function id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_function ALTER COLUMN id SET DEFAULT nextval('public.meta_function_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 1839624956)
-- Name: meta_process id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_process ALTER COLUMN id SET DEFAULT nextval('public.meta_process_id_seq'::regclass);


--
-- TOC entry 2104 (class 2604 OID 1839624957)
-- Name: meta_store id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_store ALTER COLUMN id SET DEFAULT nextval('public.meta_store_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 1839624958)
-- Name: prepared_list id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.prepared_list ALTER COLUMN id SET DEFAULT nextval('public.prepared_list_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 1839624959)
-- Name: products_map id; Type: DEFAULT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.products_map ALTER COLUMN id SET DEFAULT nextval('public.products_map_id_seq'::regclass);


--
-- TOC entry 2108 (class 2606 OID 1839624961)
-- Name: avito_product_list avito_product_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avito_product_list
    ADD CONSTRAINT avito_product_list_pkey PRIMARY KEY (id);


--
-- TOC entry 2110 (class 2606 OID 1839624963)
-- Name: avz_products avz_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avz_products
    ADD CONSTRAINT avz_products_pkey PRIMARY KEY (id);


--
-- TOC entry 2112 (class 2606 OID 1839624965)
-- Name: avz_products_uploads avz_products_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.avz_products_uploads
    ADD CONSTRAINT avz_products_uploads_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 1839624967)
-- Name: meta_function meta_function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_function
    ADD CONSTRAINT meta_function_pkey PRIMARY KEY (id);


--
-- TOC entry 2116 (class 2606 OID 1839624969)
-- Name: meta_process meta_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_process
    ADD CONSTRAINT meta_process_pkey PRIMARY KEY (id);


--
-- TOC entry 2118 (class 2606 OID 1839624971)
-- Name: meta_store meta_store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.meta_store
    ADD CONSTRAINT meta_store_pkey PRIMARY KEY (id);


--
-- TOC entry 2120 (class 2606 OID 1839624973)
-- Name: prepared_list prepared_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgreadmin
--

ALTER TABLE ONLY public.prepared_list
    ADD CONSTRAINT prepared_list_pkey PRIMARY KEY (id);


-- Completed on 2026-07-22 16:49:08

--
-- PostgreSQL database dump complete
--

