--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authorizations (
    id integer NOT NULL,
    provider character varying(255),
    uid character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authorizations_id_seq OWNED BY authorizations.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    slug character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: coordinates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE coordinates (
    id integer NOT NULL,
    lat numeric,
    lon numeric,
    latlon geography(Point,4326),
    locatable_id integer,
    locatable_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: coordinates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coordinates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coordinates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coordinates_id_seq OWNED BY coordinates.id;


--
-- Name: establishments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE establishments (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    latitude numeric,
    longitude numeric,
    latlon geography(Point,4326),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: establishments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE establishments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: establishments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE establishments_id_seq OWNED BY establishments.id;


--
-- Name: favorite_neighborhoods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE favorite_neighborhoods (
    id integer NOT NULL,
    user_id integer,
    neighborhood_id integer,
    "primary" boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: favorite_neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE favorite_neighborhoods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorite_neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE favorite_neighborhoods_id_seq OWNED BY favorite_neighborhoods.id;


--
-- Name: neighborhoods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE neighborhoods (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    slug character varying(255),
    city_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE neighborhoods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE neighborhoods_id_seq OWNED BY neighborhoods.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_search_documents (
    id integer NOT NULL,
    content text,
    searchable_id integer,
    searchable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pg_search_documents_id_seq OWNED BY pg_search_documents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    display_name character varying(255),
    name character varying(255),
    city character varying(255),
    phone_number character varying(255),
    image character varying(255),
    send_texts boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations ALTER COLUMN id SET DEFAULT nextval('authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinates ALTER COLUMN id SET DEFAULT nextval('coordinates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY establishments ALTER COLUMN id SET DEFAULT nextval('establishments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY favorite_neighborhoods ALTER COLUMN id SET DEFAULT nextval('favorite_neighborhoods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY neighborhoods ALTER COLUMN id SET DEFAULT nextval('neighborhoods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pg_search_documents ALTER COLUMN id SET DEFAULT nextval('pg_search_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT authorizations_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY coordinates
    ADD CONSTRAINT coordinates_pkey PRIMARY KEY (id);


--
-- Name: establishments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY establishments
    ADD CONSTRAINT establishments_pkey PRIMARY KEY (id);


--
-- Name: favorite_neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY favorite_neighborhoods
    ADD CONSTRAINT favorite_neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY neighborhoods
    ADD CONSTRAINT neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO public,postgis;

INSERT INTO schema_migrations (version) VALUES ('20140930040126');

INSERT INTO schema_migrations (version) VALUES ('20140930215452');

INSERT INTO schema_migrations (version) VALUES ('20141001191820');

INSERT INTO schema_migrations (version) VALUES ('20141001193331');

INSERT INTO schema_migrations (version) VALUES ('20141002171137');

INSERT INTO schema_migrations (version) VALUES ('20141002200314');

INSERT INTO schema_migrations (version) VALUES ('20141006020116');

INSERT INTO schema_migrations (version) VALUES ('20141006231730');

INSERT INTO schema_migrations (version) VALUES ('20141009160707');

