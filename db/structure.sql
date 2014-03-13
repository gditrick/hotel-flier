--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hotel_fliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hotel_fliers (
    id integer NOT NULL,
    hotel_id integer,
    day date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    flier_pdf bytea
);


--
-- Name: hotel_fliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hotel_fliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotel_fliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hotel_fliers_id_seq OWNED BY hotel_fliers.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hotels (
    id integer NOT NULL,
    name text,
    address text,
    phone text,
    website text
);


--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hotels_id_seq OWNED BY hotels.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    filename text NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotel_fliers ALTER COLUMN id SET DEFAULT nextval('hotel_fliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotels ALTER COLUMN id SET DEFAULT nextval('hotels_id_seq'::regclass);


--
-- Name: hotel_fliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hotel_fliers
    ADD CONSTRAINT hotel_fliers_pkey PRIMARY KEY (id);


--
-- Name: hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- Name: hotel_fliers_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hotel_fliers
    ADD CONSTRAINT hotel_fliers_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES hotels(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO "schema_migrations" ("filename") VALUES ('20140311131942_create_hotels.rb');
INSERT INTO "schema_migrations" ("filename") VALUES ('20140311131959_create_hotel_fliers.rb');