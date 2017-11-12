--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: defect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE defect (
    name text,
    kanbanstate text,
    schedulestate text,
    owner text,
    requirement text,
    project text,
    iteration text,
    release text,
    planestimate text,
    severity text,
    state text,
    environment text,
    priority text,
    ready text,
    resolution text,
    blocked text,
    blockedreason text,
    description text,
    notes text,
    displaycolor text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE defect OWNER TO postgres;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feature (
    name text,
    investmentcategory text,
    project text,
    owner text,
    parent text,
    release text,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    description text,
    displaycolor text,
    notes text,
    ready text,
    riskscore text,
    valuescore text,
    preliminaryestimate text,
    state text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE feature OWNER TO postgres;

--
-- Name: fundingincrement; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE fundingincrement (
    name character varying(100),
    amount integer,
    dataset character varying(100),
    listing_order integer
);


ALTER TABLE fundingincrement OWNER TO thomas;

--
-- Name: initiative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE initiative (
    name text,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    parent text,
    description text,
    displaycolor text,
    investmentcategory text,
    notes text,
    ready text,
    riskscore integer,
    valuescore integer,
    project text,
    state text,
    owner text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE initiative OWNER TO postgres;

--
-- Name: iteration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE iteration (
    project text,
    name text,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    plannedvelocity integer,
    state text,
    theme text,
    notes text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE iteration OWNER TO postgres;

--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE release (
    project text,
    name text,
    plannedvelocity integer,
    releasedate timestamp without time zone,
    releasestartdate timestamp without time zone,
    state text,
    theme text,
    grossestimateconversionratio integer,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE release OWNER TO postgres;

--
-- Name: story; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE story (
    name text,
    schedulestate text,
    kanbanstate text,
    portfolioitem text,
    project text,
    iteration text,
    owner text,
    planestimate integer,
    release text,
    description text,
    ready text,
    blocked text,
    blockedreason text,
    displaycolor text,
    notes text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE story OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE task (
    name text,
    workproduct text,
    state text,
    owner text,
    estimate text,
    todo text,
    actuals text,
    blocked text,
    blockedreason text,
    description text,
    displaycolor text,
    ready text,
    taskindex text,
    project text,
    listing_order integer,
    dataset character varying(100),
    notes text
);


ALTER TABLE task OWNER TO postgres;

--
-- Name: testcase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testcase (
    name text,
    owner text,
    project text,
    testfolder text,
    workproduct text,
    method text,
    description text,
    objective text,
    postconditions text,
    preconditions text,
    priority text,
    ready text,
    risk text,
    type text,
    validationexpectedresult text,
    validationinput text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE testcase OWNER TO postgres;

--
-- Name: testcaseresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testcaseresult (
    build text,
    date timestamp without time zone,
    duration text,
    notes text,
    verdict text,
    testcase text,
    testset text,
    tester text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE testcaseresult OWNER TO postgres;

--
-- Name: testcasestep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testcasestep (
    expectedresult text,
    input text,
    stepindex text,
    testcase text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE testcasestep OWNER TO postgres;

--
-- Name: testfolder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testfolder (
    name text,
    project text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE testfolder OWNER TO postgres;

--
-- Name: testset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testset (
    description text,
    name text,
    planestimate text,
    ready text,
    schedulestate text,
    project text,
    iteration text,
    release text,
    owner text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE testset OWNER TO postgres;

--
-- Name: theme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE theme (
    name text,
    owner text,
    plannedstartdate timestamp without time zone,
    plannedenddate timestamp without time zone,
    description text,
    displaycolor text,
    investmentcategory text,
    ready text,
    riskscore integer,
    valuescore integer,
    project text,
    preliminaryestimate text,
    state text,
    listing_order integer,
    dataset character varying(100)
);


ALTER TABLE theme OWNER TO postgres;

--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO readonly;
GRANT USAGE ON SCHEMA public TO thomas;


--
-- Name: defect; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE defect TO readonly;
GRANT SELECT ON TABLE defect TO thomas;


--
-- Name: feature; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE feature TO readonly;
GRANT SELECT ON TABLE feature TO thomas;


--
-- Name: fundingincrement; Type: ACL; Schema: public; Owner: thomas
--

GRANT SELECT ON TABLE fundingincrement TO readonly;


--
-- Name: initiative; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE initiative TO readonly;
GRANT SELECT ON TABLE initiative TO thomas;


--
-- Name: iteration; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE iteration TO readonly;
GRANT SELECT ON TABLE iteration TO thomas;


--
-- Name: release; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE release TO readonly;
GRANT SELECT ON TABLE release TO thomas;


--
-- Name: story; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE story TO readonly;
GRANT SELECT ON TABLE story TO thomas;


--
-- Name: task; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE task TO readonly;
GRANT SELECT ON TABLE task TO thomas;


--
-- Name: testcase; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE testcase TO readonly;
GRANT SELECT ON TABLE testcase TO thomas;


--
-- Name: testcaseresult; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE testcaseresult TO readonly;
GRANT SELECT ON TABLE testcaseresult TO thomas;


--
-- Name: testcasestep; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE testcasestep TO readonly;
GRANT SELECT ON TABLE testcasestep TO thomas;


--
-- Name: testfolder; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE testfolder TO readonly;
GRANT SELECT ON TABLE testfolder TO thomas;


--
-- Name: testset; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE testset TO readonly;
GRANT SELECT ON TABLE testset TO thomas;


--
-- Name: theme; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE theme TO readonly;
GRANT SELECT ON TABLE theme TO thomas;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO readonly;


--
-- PostgreSQL database dump complete
--

