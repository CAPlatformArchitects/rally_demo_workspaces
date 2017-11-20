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
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL
);


ALTER TABLE defect OWNER TO postgres;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feature (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL,
    timecriticality integer,
    rroevalue integer,
    jobsize integer
);


ALTER TABLE feature OWNER TO postgres;

--
-- Name: fundingincrement; Type: TABLE; Schema: public; Owner: thomas
--

CREATE TABLE fundingincrement (
    name character varying(100) NOT NULL,
    amount integer,
    dataset character varying(100) NOT NULL,
    listing_order integer
);


ALTER TABLE fundingincrement OWNER TO thomas;

--
-- Name: initiative; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE initiative (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL,
    rroevalue integer,
    jobsize integer,
    timecriticality integer
);


ALTER TABLE initiative OWNER TO postgres;

--
-- Name: iteration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE iteration (
    project text,
    name text NOT NULL,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    plannedvelocity integer,
    state text,
    theme text,
    notes text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE iteration OWNER TO postgres;

--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE release (
    project text,
    name text NOT NULL,
    plannedvelocity integer,
    releasedate timestamp without time zone,
    releasestartdate timestamp without time zone,
    state text,
    theme text,
    grossestimateconversionratio integer,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE release OWNER TO postgres;

--
-- Name: story; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE story (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL
);


ALTER TABLE story OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE task (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL,
    notes text
);


ALTER TABLE task OWNER TO postgres;

--
-- Name: testcase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testcase (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL
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
    dataset character varying(100) NOT NULL
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
    dataset character varying(100) NOT NULL
);


ALTER TABLE testcasestep OWNER TO postgres;

--
-- Name: testfolder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testfolder (
    name text,
    project text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE testfolder OWNER TO postgres;

--
-- Name: testset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE testset (
    description text,
    name text NOT NULL,
    planestimate text,
    ready text,
    schedulestate text,
    project text,
    iteration text,
    release text,
    owner text,
    listing_order integer,
    dataset character varying(100) NOT NULL
);


ALTER TABLE testset OWNER TO postgres;

--
-- Name: theme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE theme (
    name text NOT NULL,
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
    dataset character varying(100) NOT NULL
);


ALTER TABLE theme OWNER TO postgres;

--
-- Data for Name: defect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY defect (name, kanbanstate, schedulestate, owner, requirement, project, iteration, release, planestimate, severity, state, environment, priority, ready, resolution, blocked, blockedreason, description, notes, displaycolor, listing_order, dataset) FROM stdin;
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	7	Standard
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	\N	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	32	Standard
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	33	Standard
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	34	Standard
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	35	Standard
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	36	Standard
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	37	Standard
Unable to login after entering invalid password	In Test	In-Progress	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	38	Standard
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	39	Standard
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	40	Standard
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	41	Standard
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	42	Standard
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	44	Standard
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	45	Standard
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	46	Standard
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	1	Standard
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	2	Standard
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	3	Standard
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	4	Standard
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	5	Standard
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	6	Standard
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	8	Standard
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	9	Standard
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	7	Color Coded
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	\N	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	32	Color Coded
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	33	Color Coded
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	34	Color Coded
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	35	Color Coded
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	36	Color Coded
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	37	Color Coded
Unable to login after entering invalid password	In Test	In-Progress	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	38	Color Coded
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	39	Color Coded
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	40	Color Coded
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	41	Color Coded
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	42	Color Coded
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	10	Standard
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	44	Color Coded
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	45	Color Coded
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	46	Color Coded
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	1	Color Coded
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	2	Color Coded
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	3	Color Coded
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	4	Color Coded
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	5	Color Coded
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	6	Color Coded
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	8	Color Coded
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	9	Color Coded
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	10	Color Coded
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	11	Color Coded
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	12	Color Coded
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	13	Color Coded
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	14	Color Coded
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	15	Color Coded
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	16	Color Coded
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	17	Color Coded
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	18	Color Coded
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	19	Color Coded
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	20	Color Coded
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	21	Color Coded
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	22	Color Coded
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	23	Color Coded
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	24	Color Coded
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	11	Standard
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	12	Standard
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	13	Standard
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	14	Standard
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	15	Standard
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	16	Standard
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	17	Standard
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	18	Standard
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	19	Standard
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	20	Standard
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	25	Color Coded
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	43	Color Coded
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	27	Color Coded
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	26	Color Coded
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	21	Standard
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	22	Standard
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	23	Standard
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	24	Standard
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	25	Standard
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	43	Standard
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	27	Standard
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	28	Color Coded
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	29	Color Coded
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	30	Color Coded
latest Promo Code is invalid.	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	31	Color Coded
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	26	Standard
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	28	Standard
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	29	Standard
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	30	Standard
latest Promo Code is invalid.	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	31	Standard
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	#f9a814	\N	CAWorld
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	#f9a814	\N	CAWorld
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	#f9a814	\N	CAWorld
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	#f9a814	\N	CAWorld
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	#f9a814	\N	CAWorld
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	#f9a814	\N	CAWorld
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	#f9a814	\N	CAWorld
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	#f9a814	\N	CAWorld
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	#f9a814	\N	CAWorld
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	#f9a814	\N	CAWorld
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	#f9a814	\N	CAWorld
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	#f9a814	\N	CAWorld
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	#f9a814	\N	CAWorld
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	#f9a814	\N	CAWorld
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	#f9a814	\N	CAWorld
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	#f9a814	\N	CAWorld
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	#f9a814	\N	CAWorld
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	#f9a814	\N	CAWorld
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	#f9a814	\N	CAWorld
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	#f9a814	\N	CAWorld
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	#f9a814	\N	CAWorld
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	#f9a814	\N	CAWorld
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	#f9a814	\N	CAWorld
latest Promo Code is invalid.	Accepted	Completed	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	#f9a814	\N	CAWorld
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	\N	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	#f9a814	\N	CAWorld
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	#f9a814	\N	CAWorld
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Unable to login after entering invalid password	In Test	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	#f9a814	\N	CAWorld
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	#f9a814	\N	CAWorld
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	\N	Summer
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	\N	Summer
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	\N	Summer
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	\N	Summer
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	\N	Summer
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	\N	Summer
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	\N	Summer
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	\N	Summer
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	\N	Summer
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	\N	Summer
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	\N	Summer
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	\N	Summer
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	\N	Summer
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	\N	Summer
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	\N	Summer
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	\N	Summer
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	\N	Summer
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	\N	Summer
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	\N	Summer
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	\N	Summer
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	\N	Summer
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	\N	Summer
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	\N	Summer
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	\N	Summer
latest Promo Code is invalid.	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	\N	Summer
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	\N	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	\N	Summer
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	\N	Summer
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to login after entering invalid password	In Test	In-Progress	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	\N	Summer
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feature (name, investmentcategory, project, owner, parent, release, plannedstartdate, plannedenddate, description, displaycolor, notes, ready, riskscore, valuescore, preliminaryestimate, state, listing_order, dataset, timecriticality, rroevalue, jobsize) FROM stdin;
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	\N	\N	37	Color Coded	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	Color Coded	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-11-17 07:00:00	2017-12-21 06:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#4a1d7e	\N	FALSE	6	20	L	Discover	\N	CAWorld	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-26 06:00:00	2017-12-21 06:59:00	\N	#848689	\N	FALSE	1	9	M	Develop	\N	CAWorld	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-04 06:00:00	2017-11-21 06:59:00	\N	#107c1e	\N	FALSE	3	5	M	Develop	\N	CAWorld	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-04 06:00:00	2017-12-12 06:59:00	see business case attached	#fce205	\N	FALSE	3	6	L	Develop	\N	CAWorld	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-10-26 06:00:00	2017-12-15 06:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#105cab	\N	FALSE	8	8	L	Discover	\N	CAWorld	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2017-11-01 06:00:00	2017-12-06 06:59:00	\N	#848689	\N	FALSE	4	7	M	Develop	\N	CAWorld	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-13 06:00:00	2017-12-15 06:59:00	\N	#848689	\N	FALSE	4	5	S	Discover	\N	CAWorld	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#4286f4	\N	FALSE	4	3	XL	Done	47	Color Coded	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#4286f4	\N	\N	\N	\N	\N	Develop	48	Color Coded	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-01 10:59:00	2017-12-05 10:59:00	\N	#df1a7b	\N	FALSE	2	0	S	Develop	2	Color Coded	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	Color Coded	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-29 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	17	Color Coded	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	18	Color Coded	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-10 10:59:00	2017-12-23 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	19	Color Coded	\N	\N	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	20	Color Coded	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2017-12-24 10:59:00	2018-01-18 10:59:00	\N	#4286f4	\N	FALSE	2	7	M	Discover	23	Color Coded	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	#4286f4	\N	FALSE	5	5	S	Propose	24	Color Coded	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-23 10:59:00	2018-02-17 10:59:00	\N	#4286f4	\N	FALSE	7	10	M	Propose	25	Color Coded	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2017-12-27 10:59:00	2018-02-05 10:59:00	\N	#df1a7b	\N	FALSE	3	5	S	Discover	26	Color Coded	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-07 10:59:00	2017-12-23 10:59:00	\N	#e7f298	\N	FALSE	5	0	L	Develop	27	Color Coded	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2018-01-05 10:59:00	2018-02-11 10:59:00	see business case attached	#4286f4	\N	FALSE	5	6	XL	Develop	28	Color Coded	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-12 10:59:00	2017-11-28 10:59:00	\N	#efab00	\N	FALSE	2	4	L	Discover	34	Color Coded	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-10-29 10:59:00	2017-12-17 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	8	8	L	Discover	10	Color Coded	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	XL	Discover	35	Color Coded	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	\N	Propose	36	Color Coded	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-04 10:59:00	2017-11-23 10:59:00	\N	#e7f298	\N	FALSE	2	0	M	Develop	4	Color Coded	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-01 10:59:00	2017-12-11 10:59:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	5	Color Coded	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	Standard	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-10-29 10:59:00	2017-12-16 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	L	Discover	40	Color Coded	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2017-12-21 07:00:00	2018-01-16 06:59:00	\N	#848689	\N	FALSE	2	7	M	Discover	\N	CAWorld	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	#848689	\N	FALSE	5	5	S	Propose	\N	CAWorld	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-10-29 10:59:00	2017-12-02 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#efab00	\N	FALSE	1	8	L	Discover	39	Color Coded	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-20 07:00:00	2018-02-15 06:59:00	\N	#848689	\N	FALSE	7	10	M	Propose	\N	CAWorld	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-12 10:59:00	2017-12-09 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	M	Discover	41	Color Coded	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-03 10:59:00	2017-10-13 10:59:00	\N	#4286f4	\N	FALSE	13	10	M	Open Beta	44	Color Coded	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#4286f4	\N	FALSE	4	3	XL	Done	47	Standard	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#4286f4	\N	\N	\N	\N	\N	Develop	48	Standard	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-27 10:59:00	2017-10-10 10:59:00	\N	#4286f4	\N	FALSE	0	5	M	Open Beta	49	Standard	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-05 10:59:00	2017-11-28 10:59:00	\N	#efab00	\N	FALSE	3	3	M	Discover	31	Color Coded	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-09 10:59:00	2017-12-23 10:59:00	\N	#efab00	\N	FALSE	1	5	XL	Discover	32	Color Coded	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#e7f298	\N	FALSE	3	4	M	Done	50	Color Coded	\N	\N	\N
Toms Test	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-10-03 10:59:00	2017-10-28 10:59:00	\N	#4286f4	\N	FALSE	5	7	L	Internal Release	46	Color Coded	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-01 10:59:00	2017-12-05 10:59:00	\N	#df1a7b	\N	FALSE	2	0	S	Develop	2	Standard	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-29 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	17	Standard	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	18	Standard	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-10 10:59:00	2017-12-23 10:59:00	see business case attached	#4286f4	\N	FALSE	6	6	M	Develop	19	Standard	\N	\N	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-08 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	M	Develop	20	Standard	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2017-12-24 10:59:00	2018-01-18 10:59:00	\N	#4286f4	\N	FALSE	2	7	M	Discover	23	Standard	\N	\N	\N
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	#4286f4	\N	FALSE	5	5	S	Propose	24	Standard	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-23 10:59:00	2018-02-17 10:59:00	\N	#4286f4	\N	FALSE	7	10	M	Propose	25	Standard	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2017-12-27 10:59:00	2018-02-05 10:59:00	\N	#df1a7b	\N	FALSE	3	5	S	Discover	26	Standard	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-07 10:59:00	2017-12-23 10:59:00	\N	#e7f298	\N	FALSE	5	0	L	Develop	27	Standard	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2018-01-05 10:59:00	2018-02-11 10:59:00	see business case attached	#4286f4	\N	FALSE	5	6	XL	Develop	28	Standard	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-10-29 10:59:00	2017-12-16 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	L	Discover	40	Standard	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-28 10:59:00	2017-12-16 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	S	Discover	42	Standard	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-14 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	L	Validate	9	Color Coded	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-13 10:59:00	2017-12-11 10:59:00	\N	#4286f4	\N	FALSE	7	5	L	Develop	11	Color Coded	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-12 10:59:00	2017-10-10 10:59:00	\N	#4286f4	\N	FALSE	6	1	L	Done	45	Standard	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-03 10:59:00	2017-10-13 10:59:00	\N	#4286f4	\N	FALSE	13	10	M	Open Beta	44	Standard	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-09 10:59:00	2017-12-23 10:59:00	\N	#efab00	\N	FALSE	1	5	XL	Discover	32	Standard	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2017-09-09 10:59:00	2017-10-19 10:59:00	\N	#e7f298	\N	FALSE	3	4	M	Done	50	Standard	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-07 10:59:00	2017-11-23 10:59:00	\N	#105cab	\N	FALSE	3	5	M	Develop	8	Standard	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-10-29 10:59:00	2017-12-02 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#efab00	\N	FALSE	1	8	L	Discover	39	Standard	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-12 10:59:00	2017-12-09 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	M	Discover	41	Standard	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-04 10:59:00	2017-12-11 10:59:00	\N	#105cab	\N	FALSE	12	4	M	Develop	3	Standard	\N	\N	\N
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	\N	2017-12-24 07:00:00	2018-02-03 06:59:00	\N	#ee6c19	\N	FALSE	3	5	S	Discover	\N	CAWorld	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-10-26 06:00:00	2017-11-30 06:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#848689	\N	FALSE	1	8	L	Discover	\N	CAWorld	\N	\N	\N
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-10-26 06:00:00	2017-12-14 06:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	L	Discover	\N	CAWorld	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-09 06:00:00	2017-12-07 06:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#21a2e0	\N	FALSE	1	8	M	Discover	\N	CAWorld	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-10 06:00:00	2017-12-06 06:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#21a2e0	\N	FALSE	3	8	M	Develop	\N	CAWorld	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-01 06:00:00	2017-11-21 06:59:00	\N	#848689	\N	FALSE	2	0	M	Develop	\N	CAWorld	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-10-29 06:00:00	2017-12-09 06:59:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	\N	CAWorld	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-10 06:00:00	2017-12-21 06:59:00	\N	#848689	\N	FALSE	1	0	M	Develop	\N	CAWorld	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-19 07:00:00	2017-12-18 06:59:00	\N	#848689	\N	FALSE	3	14	M	Develop	\N	CAWorld	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2017-10-26 06:00:00	2017-12-21 06:59:00	\N	#107c1e	\N	FALSE	4	0	L	Develop	\N	CAWorld	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-26 06:00:00	2017-12-06 06:59:00	see business case attached	#848689	\N	FALSE	6	6	M	Develop	\N	CAWorld	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-04 06:00:00	2017-12-06 06:59:00	see business case attached	#848689	\N	FALSE	3	6	M	Develop	\N	CAWorld	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-07 06:00:00	2017-12-21 06:59:00	see business case attached	#848689	\N	FALSE	6	6	M	Develop	\N	CAWorld	\N	\N	\N
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-07 10:59:00	2017-12-14 10:59:00	see business case attached	#4286f4	\N	FALSE	3	6	L	Validate	9	Standard	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-13 10:59:00	2017-12-11 10:59:00	\N	#4286f4	\N	FALSE	7	5	L	Develop	11	Standard	\N	\N	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-10-26 06:00:00	2017-12-21 06:59:00	see business case attached	#21a2e0	\N	FALSE	3	6	M	Develop	\N	CAWorld	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	#848689	\N	FALSE	5	1	L	Propose	\N	CAWorld	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	Color Coded	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-12 10:59:00	2017-10-10 10:59:00	\N	#4286f4	\N	FALSE	6	1	L	Done	45	Color Coded	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-05 10:59:00	2017-11-28 10:59:00	\N	#efab00	\N	FALSE	3	3	M	Discover	31	Standard	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-13 10:59:00	2017-12-23 10:59:00	\N	#e7f298	\N	FALSE	1	0	M	Develop	14	Standard	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-22 10:59:00	2017-12-20 10:59:00	\N	#e7f298	\N	FALSE	3	14	M	Develop	15	Standard	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-10-26 06:00:00	2017-12-21 06:59:00	\N	#105cab	\N	FALSE	6	1	L	Done	\N	CAWorld	\N	\N	\N
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-30 06:00:00	2017-10-26 05:59:00	\N	#848689	\N	FALSE	5	7	L	Internal Release	\N	CAWorld	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-06 06:00:00	2017-10-17 05:59:00	\N	#848689	\N	FALSE	4	3	XL	Done	\N	CAWorld	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-06 06:00:00	2017-10-17 05:59:00	\N	#848689	\N	FALSE	0	0	\N	Develop	\N	CAWorld	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-24 06:00:00	2017-10-08 05:59:00	\N	#848689	\N	FALSE	0	5	M	Open Beta	\N	CAWorld	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2017-09-06 06:00:00	2017-10-17 05:59:00	\N	#848689	\N	FALSE	3	4	M	Done	\N	CAWorld	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-10 06:00:00	2017-12-09 06:59:00	\N	#fce205	\N	FALSE	7	5	L	Develop	\N	CAWorld	\N	\N	\N
========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	#848689	\N	FALSE	0	0	\N	\N	\N	CAWorld	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-12 06:00:00	2017-12-21 06:59:00	see business case attached	#df1a7b	\N	FALSE	5	6	XL	Develop	\N	CAWorld	\N	\N	\N
========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	#848689	\N	FALSE	0	0	\N	\N	\N	CAWorld	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-29 07:00:00	2017-12-21 06:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#107c1e	\N	FALSE	3	3	L	Discover	\N	CAWorld	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-02 06:00:00	2017-11-26 06:59:00	\N	#ee6c19	\N	FALSE	3	3	M	Discover	\N	CAWorld	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-06 07:00:00	2017-12-21 06:59:00	\N	#848689	\N	FALSE	1	5	XL	Discover	\N	CAWorld	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-29 07:00:00	2017-12-14 06:59:00	\N	#848689	\N	FALSE	6	3	M	Propose	\N	CAWorld	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-29 10:59:00	2017-12-23 10:59:00	\N	#105cab	\N	FALSE	1	9	M	Develop	7	Color Coded	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-13 10:59:00	2017-12-08 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	3	8	M	Develop	1	Color Coded	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2017-11-04 10:59:00	2017-12-08 10:59:00	\N	#df1a7b	\N	FALSE	4	7	M	Develop	12	Color Coded	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-01 06:00:00	2017-12-09 06:59:00	\N	#848689	\N	FALSE	12	4	M	Develop	\N	CAWorld	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-23 10:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#efab00	\N	FALSE	3	3	L	Discover	30	Color Coded	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	\N	\N	37	Standard	\N	\N	\N
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-10-03 10:59:00	2017-10-28 10:59:00	\N	#4286f4	\N	FALSE	5	7	L	Internal Release	46	Standard	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-12 10:59:00	2017-11-28 10:59:00	\N	#efab00	\N	FALSE	2	4	L	Discover	34	Standard	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-23 10:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#efab00	\N	FALSE	6	20	L	Develop	6	Color Coded	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-16 10:59:00	\N	#efab00	\N	FALSE	6	3	M	Propose	33	Color Coded	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	XL	Discover	35	Standard	\N	\N	\N
========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	#848689	\N	FALSE	0	0	\N	\N	\N	CAWorld	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-13 10:59:00	2017-12-23 10:59:00	\N	#e7f298	\N	FALSE	1	0	M	Develop	14	Color Coded	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-22 10:59:00	2017-12-20 10:59:00	\N	#e7f298	\N	FALSE	3	14	M	Develop	15	Color Coded	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2017-10-29 10:59:00	2017-12-20 10:59:00	\N	#e7f298	\N	FALSE	4	0	L	Develop	16	Color Coded	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	#c6b893	\N	FALSE	5	1	L	Propose	22	Color Coded	\N	\N	\N
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-10-29 06:00:00	2017-12-03 06:59:00	\N	#4a1d7e	\N	FALSE	2	0	S	Develop	\N	CAWorld	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21	Standard	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-28 10:59:00	2017-12-16 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#ee6c19	\N	FALSE	1	8	S	Discover	42	Color Coded	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	L	Discover	38	Color Coded	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-07 10:59:00	2017-11-23 10:59:00	\N	#105cab	\N	FALSE	3	5	M	Develop	8	Color Coded	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-13 10:59:00	2017-12-08 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	3	8	M	Develop	1	Standard	\N	\N	\N
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2017-11-04 10:59:00	2017-12-08 10:59:00	\N	#df1a7b	\N	FALSE	4	7	M	Develop	12	Standard	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	#c6b893	\N	FALSE	5	1	L	Propose	22	Standard	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-27 10:59:00	2017-10-10 10:59:00	\N	#4286f4	\N	FALSE	0	5	M	Open Beta	49	Color Coded	\N	\N	\N
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-10-29 10:59:00	2017-12-17 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	#4286f4	\N	FALSE	8	8	L	Discover	10	Standard	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#4286f4	\N	FALSE	5	6	\N	Propose	36	Standard	\N	\N	\N
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-04 10:59:00	2017-11-23 10:59:00	\N	#e7f298	\N	FALSE	2	0	M	Develop	4	Standard	\N	\N	\N
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-01 10:59:00	2017-12-11 10:59:00	\N	#df1a7b	\N	FALSE	5	3	M	Develop	5	Standard	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-29 10:59:00	2017-12-23 10:59:00	\N	#105cab	\N	FALSE	1	9	M	Develop	7	Standard	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-16 10:59:00	2017-12-17 10:59:00	\N	#df1a7b	\N	FALSE	4	5	S	Discover	13	Standard	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#4286f4	\N	\N	\N	\N	L	Discover	38	Standard	\N	\N	\N
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-16 10:59:00	2017-12-17 10:59:00	\N	#df1a7b	\N	FALSE	4	5	S	Discover	13	Color Coded	\N	\N	\N
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-04 10:59:00	2017-12-11 10:59:00	\N	#105cab	\N	FALSE	12	4	M	Develop	3	Color Coded	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	Standard	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2017-10-29 10:59:00	2017-12-20 10:59:00	\N	#e7f298	\N	FALSE	4	0	L	Develop	16	Standard	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-23 10:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	#efab00	\N	FALSE	3	3	L	Discover	30	Standard	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-23 10:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	#efab00	\N	FALSE	6	20	L	Develop	6	Standard	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-02 10:59:00	2017-12-16 10:59:00	\N	#efab00	\N	FALSE	6	3	M	Propose	33	Standard	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-04 06:00:00	2017-12-21 06:59:00	\N	#848689	\N	FALSE	5	0	L	Develop	\N	CAWorld	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-09 06:00:00	2017-11-26 06:59:00	\N	#848689	\N	FALSE	2	4	L	Discover	\N	CAWorld	\N	\N	\N
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-12 06:00:00	2017-12-21 06:59:00	see business case attached	#21a2e0	\N	FALSE	5	6	XL	Discover	\N	CAWorld	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	#848689	\N	FALSE	5	6	\N	Propose	\N	CAWorld	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-10-26 06:00:00	2017-12-21 06:59:00	\N	#848689	\N	FALSE	0	0	M	\N	\N	CAWorld	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	#848689	\N	FALSE	0	0	L	Discover	\N	CAWorld	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-25 07:00:00	2017-12-14 06:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	#105cab	\N	FALSE	1	8	S	Discover	\N	CAWorld	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-08-31 06:00:00	2017-10-11 05:59:00	\N	#848689	\N	FALSE	13	10	M	Open Beta	\N	CAWorld	\N	\N	\N
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	L	Discover	\N	Summer	\N	\N	\N
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-11-06 09:48:00	2017-12-10 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	2	8	L	Discover	\N	Summer	1	1	1
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-06 09:48:00	2017-12-24 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	L	Discover	\N	Summer	\N	\N	\N
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-20 09:48:00	2017-12-17 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	M	Discover	\N	Summer	\N	\N	\N
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-12-06 09:48:00	2017-12-24 09:48:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	\N	8	S	Discover	\N	Summer	\N	\N	\N
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-11 09:48:00	2017-10-21 09:48:00	\N	\N	\N	FALSE	\N	10	M	Open Beta	\N	Summer	\N	\N	\N
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-20 09:48:00	2017-10-18 09:48:00	\N	\N	\N	FALSE	1	1	L	Done	\N	Summer	2	2	5
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-10-11 09:48:00	2017-11-05 09:48:00	\N	\N	\N	FALSE	\N	7	L	Internal Release	\N	Summer	\N	\N	\N
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-17 09:48:00	2017-10-27 09:48:00	\N	\N	\N	FALSE	\N	3	XL	Done	\N	Summer	\N	\N	\N
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-17 09:48:00	2017-10-27 09:48:00	\N	\N	\N	\N	\N	\N	\N	Develop	\N	Summer	\N	\N	\N
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-10-05 09:48:00	2017-10-18 09:48:00	\N	\N	\N	FALSE	\N	5	M	Open Beta	\N	Summer	\N	\N	\N
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2017-09-17 09:48:00	2017-10-27 09:48:00	\N	\N	\N	FALSE	\N	4	M	Done	\N	Summer	\N	\N	\N
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-21 09:48:00	2017-12-16 09:48:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	5	8	M	Develop	\N	Summer	13	3	3
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-09 09:48:00	2017-12-13 09:48:00	\N	\N	\N	FALSE	0	0	S	Develop	\N	Summer	3	8	1
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-12 09:48:00	2017-12-19 09:48:00	\N	\N	\N	FALSE	0	4	M	Develop	\N	Summer	13	13	2
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-12 09:48:00	2017-12-01 09:48:00	\N	\N	\N	FALSE	0	0	M	Develop	\N	Summer	1	3	1
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-09 09:48:00	2017-12-19 09:48:00	\N	\N	\N	FALSE	\N	3	M	Develop	\N	Summer	\N	\N	\N
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-12-10 09:48:00	2017-12-31 09:48:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	\N	\N	FALSE	\N	20	L	Develop	\N	Summer	\N	\N	\N
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-06 09:48:00	2017-12-31 09:48:00	\N	\N	\N	FALSE	\N	9	M	Develop	\N	Summer	\N	\N	\N
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-11-15 09:48:00	2017-12-01 09:48:00	\N	\N	\N	FALSE	3	5	M	Develop	\N	Summer	1	1	1
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-15 09:48:00	2017-12-22 09:48:00	see business case attached	\N	\N	FALSE	3	6	L	Validate	\N	Summer	5	5	3
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-06 09:48:00	2017-12-25 09:48:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	\N	8	L	Discover	\N	Summer	\N	\N	\N
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-21 09:48:00	2017-12-19 09:48:00	\N	\N	\N	FALSE	2	5	L	Develop	\N	Summer	5	2	3
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2017-11-12 09:48:00	2017-12-16 09:48:00	\N	\N	\N	FALSE	5	7	M	Develop	\N	Summer	18	5	3
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-24 09:48:00	2017-12-25 09:48:00	\N	\N	\N	FALSE	\N	5	S	Discover	\N	Summer	\N	\N	\N
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-21 09:48:00	2017-12-31 09:48:00	\N	\N	\N	FALSE	\N	0	M	Develop	\N	Summer	\N	\N	\N
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-30 09:48:00	2017-12-28 09:48:00	\N	\N	\N	FALSE	\N	14	M	Develop	\N	Summer	\N	\N	\N
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2017-11-06 09:48:00	2017-12-28 09:48:00	\N	\N	\N	FALSE	\N	0	L	Develop	\N	Summer	\N	\N	\N
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-06 09:48:00	2017-12-16 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-15 09:48:00	2017-12-16 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-11-18 09:48:00	2017-12-31 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-15 09:48:00	2017-12-16 09:48:00	see business case attached	\N	\N	FALSE	\N	6	M	Develop	\N	Summer	\N	\N	\N
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	\N	\N	FALSE	\N	1	L	Propose	\N	Summer	\N	\N	\N
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-01 09:48:00	2018-01-26 09:48:00	\N	\N	\N	FALSE	0	7	M	Discover	\N	Summer	1	8	3
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	\N	\N	FALSE	\N	5	S	Propose	\N	Summer	\N	\N	\N
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-31 09:48:00	2018-02-25 09:48:00	\N	\N	\N	FALSE	0	10	M	Propose	\N	Summer	3	8	1
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2018-01-04 09:48:00	2018-02-13 09:48:00	\N	\N	\N	FALSE	\N	5	S	Discover	\N	Summer	\N	\N	\N
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-15 09:48:00	2017-12-31 09:48:00	\N	\N	\N	FALSE	\N	0	L	Develop	\N	Summer	\N	\N	\N
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2018-01-13 09:48:00	2018-02-19 09:48:00	see business case attached	\N	\N	FALSE	\N	6	XL	Develop	\N	Summer	\N	\N	\N
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer	\N	\N	\N
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-10 09:48:00	2017-12-31 09:48:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	\N	\N	FALSE	\N	3	L	Discover	\N	Summer	\N	\N	\N
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-13 09:48:00	2017-12-06 09:48:00	\N	\N	\N	FALSE	\N	3	M	Discover	\N	Summer	\N	\N	\N
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-17 09:48:00	2017-12-31 09:48:00	\N	\N	\N	FALSE	\N	5	XL	Discover	\N	Summer	\N	\N	\N
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-12-10 09:48:00	2017-12-24 09:48:00	\N	\N	\N	FALSE	\N	3	M	Propose	\N	Summer	\N	\N	\N
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-20 09:48:00	2017-12-06 09:48:00	\N	\N	\N	FALSE	0	4	L	Discover	\N	Summer	1	1	1
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	\N	6	XL	Discover	\N	Summer	\N	\N	\N
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	\N	6	\N	Propose	\N	Summer	\N	\N	\N
\.


--
-- Data for Name: fundingincrement; Type: TABLE DATA; Schema: public; Owner: thomas
--

COPY fundingincrement (name, amount, dataset, listing_order) FROM stdin;
\.


--
-- Data for Name: initiative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY initiative (name, plannedstartdate, plannedenddate, parent, description, displaycolor, investmentcategory, notes, ready, riskscore, valuescore, project, state, owner, listing_order, dataset, rroevalue, jobsize, timecriticality) FROM stdin;
Minimal online shopping site	2017-10-03 10:59:00	2018-02-02 10:59:00	Revamp online presence	\N	#4286f4	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1	Standard	\N	\N	\N
Build read-write API for handling orders	2017-09-28 10:59:00	2017-12-12 10:59:00	Create best in class platform	\N	#ee6c19	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	2	Standard	\N	\N	\N
Personalized online shopping experience	2017-09-03 10:59:00	2018-02-17 10:59:00	Revamp online presence	\N	#e7f298	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3	Standard	\N	\N	\N
Modernize customer service portal	2017-09-03 10:59:00	2018-01-18 10:59:00	Revamp online presence	\N	#df1a7b	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	4	Standard	\N	\N	\N
Maintain legacy purchasing system	2017-11-02 10:59:00	2018-01-12 10:59:00	Revamp online presence	\N	#105cab	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5	Standard	\N	\N	\N
Re-build primary web app to use API	2017-10-19 10:59:00	2018-01-11 10:59:00	Create best in class platform	\N	#107c1e	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6	Standard	\N	\N	\N
Modernize customer service portal	2017-09-03 10:59:00	2018-01-18 10:59:00	Revamp online presence	\N	#df1a7b	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	4	Color Coded	\N	\N	\N
Maintain legacy purchasing system	2017-11-02 10:59:00	2018-01-12 10:59:00	Revamp online presence	\N	#105cab	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5	Color Coded	\N	\N	\N
Re-build primary web app to use API	2017-10-19 10:59:00	2018-01-11 10:59:00	Create best in class platform	\N	#107c1e	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6	Color Coded	\N	\N	\N
Integrate in-store and online experience	2017-10-28 10:59:00	2018-03-19 10:59:00	Revamp online presence	\N	#def2ee	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7	Color Coded	\N	\N	\N
Integrate into Facebook	2017-10-13 10:59:00	2018-01-11 10:59:00	Revamp online presence	\N	#a77fdb	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8	Color Coded	\N	\N	\N
Integrate social into shopping experience	2017-10-19 10:59:00	2018-02-10 10:59:00	Revamp online presence	\N	#efab00	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9	Color Coded	\N	\N	\N
Create a read-only API	2017-10-28 10:59:00	2018-01-11 10:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#c6b893	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10	Color Coded	\N	\N	\N
Consolidate databases	2017-11-06 10:59:00	2018-03-12 10:59:00	Create best in class platform	\N	#3a2659	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11	Color Coded	\N	\N	\N
Minimal online shopping site	2017-09-30 06:00:00	2018-01-31 06:59:00	Revamp online presence	\N	#848689	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	\N	CAWorld	\N	\N	\N
Build read-write API for handling orders	2017-09-25 06:00:00	2017-12-10 06:59:00	Create best in class platform	\N	#848689	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	\N	CAWorld	\N	\N	\N
Personalized online shopping experience	2017-08-31 06:00:00	2018-02-15 06:59:00	Revamp online presence	\N	#848689	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	\N	CAWorld	\N	\N	\N
Modernize customer service portal	2017-08-31 06:00:00	2018-01-16 06:59:00	Revamp online presence	\N	#848689	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	\N	CAWorld	\N	\N	\N
Maintain legacy purchasing system	2017-10-30 06:00:00	2018-01-10 06:59:00	Revamp online presence	\N	#848689	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	\N	CAWorld	\N	\N	\N
Re-build primary web app to use API	2017-10-16 06:00:00	2018-01-09 06:59:00	Create best in class platform	\N	#848689	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	\N	CAWorld	\N	\N	\N
Integrate in-store and online experience	2017-10-25 06:00:00	2018-03-17 06:59:00	Revamp online presence	\N	#848689	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	\N	CAWorld	\N	\N	\N
Integrate into Facebook	2017-10-10 06:00:00	2018-01-09 06:59:00	Revamp online presence	\N	#848689	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	\N	CAWorld	\N	\N	\N
Integrate social into shopping experience	2017-10-16 06:00:00	2018-02-08 06:59:00	Revamp online presence	\N	#848689	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	\N	CAWorld	\N	\N	\N
Consolidate databases	2017-11-03 06:00:00	2018-03-10 06:59:00	Create best in class platform	\N	#848689	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	\N	CAWorld	\N	\N	\N
Integrate social into shopping experience	2017-10-19 10:59:00	2018-02-10 10:59:00	Revamp online presence	\N	#efab00	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9	Standard	\N	\N	\N
Create a read-only API	2017-10-28 10:59:00	2018-01-11 10:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#c6b893	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10	Standard	\N	\N	\N
Consolidate databases	2017-11-06 10:59:00	2018-03-12 10:59:00	Create best in class platform	\N	#3a2659	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11	Standard	\N	\N	\N
Minimal online shopping site	2017-10-03 10:59:00	2018-02-02 10:59:00	Revamp online presence	\N	#4286f4	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1	Color Coded	\N	\N	\N
Build read-write API for handling orders	2017-09-28 10:59:00	2017-12-12 10:59:00	Create best in class platform	\N	#ee6c19	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	2	Color Coded	\N	\N	\N
Personalized online shopping experience	2017-09-03 10:59:00	2018-02-17 10:59:00	Revamp online presence	\N	#e7f298	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3	Color Coded	\N	\N	\N
Create a read-only API	2017-10-25 06:00:00	2018-01-09 06:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	#848689	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	\N	CAWorld	\N	\N	\N
Integrate in-store and online experience	2017-10-28 10:59:00	2018-03-19 10:59:00	Revamp online presence	\N	#def2ee	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7	Standard	\N	\N	\N
Integrate into Facebook	2017-10-13 10:59:00	2018-01-11 10:59:00	Revamp online presence	\N	#a77fdb	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8	Standard	\N	\N	\N
Minimal online shopping site	2017-10-11 09:48:00	2018-02-10 09:48:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	5	8	Consumer Site	Build	rachel@acme.com	\N	Summer	3	3	13
Build read-write API for handling orders	2017-10-06 09:48:00	2017-12-20 09:48:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	0	8	Platform	Build	aaron@acme.com	\N	Summer	8	1	3
Personalized online shopping experience	2017-09-11 09:48:00	2018-02-25 09:48:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	0	3	Consumer Site	Build	rachel@acme.com	\N	Summer	13	2	13
Modernize customer service portal	2017-09-11 09:48:00	2018-01-26 09:48:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	0	3	Consumer Site	Build	rachel@acme.com	\N	Summer	3	1	1
Maintain legacy purchasing system	2017-11-10 09:48:00	2018-01-20 09:48:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	\N	1	Consumer Site	Build	rachel@acme.com	\N	Summer	\N	\N	\N
Re-build primary web app to use API	2017-10-27 09:48:00	2018-01-19 09:48:00	Create best in class platform	\N	\N	Cost Savings	\N	FALSE	\N	3	Platform	Prioritize	aaron@acme.com	\N	Summer	\N	\N	\N
Integrate in-store and online experience	2017-11-05 09:48:00	2018-03-27 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	3	13	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	1	1	1
Integrate into Facebook	2017-10-21 09:48:00	2018-01-19 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	3	3	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	5	3	5
Integrate social into shopping experience	2017-10-27 09:48:00	2018-02-18 09:48:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	\N	5	Consumer Site	Prioritize	rachel@acme.com	\N	Summer	\N	\N	\N
Create a read-only API	2017-11-05 09:48:00	2018-01-19 09:48:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	\N	Short Term Growth	\N	FALSE	5	8	Platform	Business Case	aaron@acme.com	\N	Summer	5	3	10
Consolidate databases	2017-11-14 09:48:00	2018-03-20 09:48:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	\N	1	Platform	Prioritize	aaron@acme.com	\N	Summer	\N	\N	\N
\.


--
-- Data for Name: iteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY iteration (project, name, startdate, enddate, plannedvelocity, state, theme, notes, listing_order, dataset) FROM stdin;
Reseller Portal Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7	Standard
Fulfillment Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Online Store	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	18	Standard
API Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	57	Color Coded
Fulfillment Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	99	Color Coded
Payment Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	61	Standard
Platform	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	62	Standard
Platform	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	92	Color Coded
API Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Online Store	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Platform	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
API Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	96	Color Coded
Platform	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
API Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	61	Color Coded
Reseller Portal Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	53	Color Coded
Fulfillment Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	22	Color Coded
Online Store	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	14	Color Coded
Reseller Portal Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	15	Color Coded
Payment Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	33	Standard
Fulfillment Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Fulfillment Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Reseller Site	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Shopping Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Online Store	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	110	Standard
Payment Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	111	Standard
Platform	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	112	Standard
Reseller Portal Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	113	Standard
Reseller Site	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	114	Standard
Shopping Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	115	Standard
Medical Records App	Iteration 4 - New Patients	2017-11-12 11:23:00	2017-11-25 11:23:00	8	Committed	New patients	\N	116	Standard
Medical Records App	Iteration 5 - User Administration	2017-11-26 11:23:00	2017-12-09 11:23:00	8	Planning	User administration	\N	117	Standard
Consumer Site	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	30	Standard
Reseller Site	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	74	Standard
Shopping Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	75	Standard
Fulfillment Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4	Standard
Platform	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	102	Standard
Analytics Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	76	Standard
Online Store	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	50	Standard
Online Store	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5	Standard
Platform	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6	Standard
Shopping Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9	Standard
Analytics Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	10	Standard
Payment Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	24	Standard
Reseller Site	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	84	Standard
Reseller Portal Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	73	Standard
Analytics Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	96	Standard
API Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	97	Standard
API Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	87	Color Coded
Analytics Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	86	Standard
API Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	87	Standard
Online Store	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	70	Color Coded
Payment Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6	Color Coded
Shopping Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	85	Color Coded
Analytics Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	28	Standard
Consumer Site	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	98	Standard
API Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	67	Standard
Analytics Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1	Standard
API Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2	Standard
Fulfillment Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	79	Standard
Online Store	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	80	Standard
API Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	57	Standard
Fulfillment Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	99	Standard
Online Store	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	100	Standard
Payment Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	101	Standard
Reseller Portal Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	63	Standard
API Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	47	Standard
Fulfillment Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	49	Standard
Payment Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	51	Standard
Platform	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	52	Standard
Reseller Portal Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	113	Color Coded
Consumer Site	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Fulfillment Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Online Store	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Payment Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Online Store	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	42	Standard
Payment Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Platform	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
API Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Online Store	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
API Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	19	Standard
API Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	20	Standard
API Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	29	Standard
Reseller Portal Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	53	Standard
Reseller Site	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	54	Standard
Shopping Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	55	Standard
Consumer Site	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	58	Standard
Payment Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Online Store	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	32	Standard
Payment Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	33	Color Coded
Reseller Site	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	35	Standard
Fulfillment Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	31	Standard
Reseller Portal Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	34	Standard
Shopping Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	36	Standard
Analytics Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	37	Standard
Analytics Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
API Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
API Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	38	Standard
Consumer Site	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	39	Standard
Consumer Site	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	68	Color Coded
API Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	77	Color Coded
Reseller Site	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	64	Color Coded
Shopping Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	65	Color Coded
Fulfillment Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	69	Color Coded
Reseller Site	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	44	Color Coded
Reseller Site	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	26	Color Coded
Consumer Site	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	78	Color Coded
Medical Records App	Iteration 4 - New Patients	2017-11-12 11:23:00	2017-11-25 11:23:00	8	Committed	New patients	\N	116	Color Coded
Online Store	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	100	Color Coded
Shopping Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	45	Standard
Fulfillment Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	22	Standard
Consumer Site	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	12	Standard
Fulfillment Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	13	Standard
Online Store	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	14	Standard
Reseller Portal Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	43	Standard
Consumer Site	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	88	Standard
Fulfillment Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	89	Standard
Online Store	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	90	Standard
Reseller Portal Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	16	Color Coded
Analytics Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	19	Color Coded
API Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	20	Color Coded
Consumer Site	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	21	Color Coded
Reseller Portal Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	25	Color Coded
API Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	11	Color Coded
Shopping Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	27	Color Coded
Consumer Site	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	48	Color Coded
Consumer Site	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3	Color Coded
Payment Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	81	Color Coded
Platform	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	82	Color Coded
Reseller Portal Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	83	Color Coded
Payment Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	71	Color Coded
Online Store	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	23	Color Coded
Payment Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	91	Color Coded
Reseller Portal Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	93	Color Coded
Reseller Site	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	94	Color Coded
Shopping Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	95	Color Coded
Reseller Portal Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	103	Color Coded
Reseller Site	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	104	Color Coded
Shopping Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	105	Color Coded
Analytics Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	106	Color Coded
API Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	107	Color Coded
Consumer Site	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	108	Color Coded
Shopping Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	115	Color Coded
Medical Records App	Iteration 5 - User Administration	2017-11-26 11:23:00	2017-12-09 11:23:00	8	Planning	User administration	\N	117	Color Coded
Consumer Site	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	30	Color Coded
Reseller Site	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	74	Color Coded
Shopping Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	75	Color Coded
Fulfillment Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4	Color Coded
Platform	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	102	Color Coded
Analytics Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	76	Color Coded
Online Store	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	50	Color Coded
Online Store	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5	Color Coded
Shopping Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9	Color Coded
Analytics Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	10	Color Coded
Payment Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	24	Color Coded
Reseller Site	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	84	Color Coded
Reseller Portal Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	73	Color Coded
API Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	97	Color Coded
Analytics Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	28	Color Coded
Analytics Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	46	Standard
Analytics Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	56	Standard
Analytics Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	66	Standard
Reseller Portal Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7	Color Coded
Consumer Site	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	98	Color Coded
API Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	67	Color Coded
Analytics Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1	Color Coded
API Team	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2	Color Coded
Fulfillment Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	79	Color Coded
Online Store	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	80	Color Coded
API Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	47	Color Coded
Fulfillment Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	49	Color Coded
Payment Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	51	Color Coded
Platform	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	52	Color Coded
API Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	29	Color Coded
Reseller Site	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	54	Color Coded
Shopping Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	55	Color Coded
Consumer Site	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	58	Color Coded
Online Store	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	32	Color Coded
Reseller Site	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8	Color Coded
Analytics Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	86	Color Coded
Reseller Site	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	35	Color Coded
Online Store	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	31	Color Coded
Reseller Portal Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	34	Color Coded
Shopping Team	Iteration 4	2017-10-15 11:23:00	2017-10-28 11:23:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	36	Color Coded
Analytics Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	37	Color Coded
API Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	38	Color Coded
Consumer Site	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	39	Color Coded
Shopping Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	45	Color Coded
Consumer Site	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Reseller Portal Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	43	Color Coded
Consumer Site	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	88	Color Coded
Fulfillment Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	89	Color Coded
Fulfillment Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	59	Standard
Online Store	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	60	Standard
Online Store	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	90	Color Coded
Analytics Team	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	46	Color Coded
Analytics Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	56	Color Coded
Analytics Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	66	Color Coded
Fulfillment Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	59	Color Coded
Online Store	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	60	Color Coded
Online Store	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	41	Color Coded
Fulfillment Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	40	Standard
Fulfillment Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	40	Color Coded
Analytics Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
API Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 2	2017-09-14 06:00:00	2017-09-28 05:59:59	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
API Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Shopping Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Online Store	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Payment Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Reseller Portal Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Reseller Site	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Reseller Portal Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Reseller Site	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Shopping Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Online Store	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
API Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
API Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Payment Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Platform	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	16	Standard
Reseller Site	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	114	Color Coded
Platform	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Reseller Portal Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
API Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
API Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Consumer Site	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Online Store	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Payment Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Reseller Site	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Shopping Team	Iteration 1	2017-09-11 09:35:00	2017-09-24 09:35:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	Summer
Analytics Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
API Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Consumer Site	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Online Store	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Payment Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Reseller Site	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Shopping Team	Iteration 2	2017-09-25 09:35:00	2017-10-08 09:35:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	\N	Summer
Analytics Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
API Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Consumer Site	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Fulfillment Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Online Store	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Payment Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Reseller Portal Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Reseller Site	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Shopping Team	Iteration 3	2017-10-09 09:35:00	2017-10-22 09:35:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	Summer
Analytics Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
API Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Consumer Site	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Fulfillment Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Online Store	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Payment Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Reseller Portal Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Reseller Site	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Shopping Team	Iteration 4	2017-10-23 09:35:00	2017-11-05 09:35:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	Summer
Analytics Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
API Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Consumer Site	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Consumer Site	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Online Store	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	17	Standard
Fulfillment Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Online Store	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Payment Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Reseller Portal Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Reseller Site	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Shopping Team	Iteration 5	2017-11-06 09:35:00	2017-11-19 09:35:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	Summer
Analytics Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Shopping Team	Iteration 3	2017-09-28 06:00:00	2017-10-12 05:59:59	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	\N	CAWorld
Analytics Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Consumer Site	Iteration 6	2017-11-09 06:00:00	2017-11-23 06:59:59	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	106	Standard
API Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Consumer Site	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Online Store	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Payment Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Platform	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Reseller Site	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Shopping Team	Iteration 6	2017-11-20 09:35:00	2017-12-03 09:35:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	\N	Summer
Analytics Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
API Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Consumer Site	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Online Store	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Payment Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Platform	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Reseller Site	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Shopping Team	Iteration 7	2017-12-04 09:35:00	2017-12-17 09:35:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	Summer
Analytics Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
API Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Consumer Site	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Online Store	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Payment Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Platform	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Reseller Site	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Shopping Team	Iteration 8	2017-12-18 09:35:00	2017-12-31 09:35:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	Summer
Analytics Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
API Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Consumer Site	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Fulfillment Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Online Store	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Payment Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Platform	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Reseller Portal Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Reseller Site	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Shopping Team	Iteration 9	2018-01-01 09:35:00	2018-01-14 09:35:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	Summer
Platform	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	62	Color Coded
Consumer Site	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Platform	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
API Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	11	Standard
Reseller Site	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	17	Color Coded
Analytics Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Fulfillment Team	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	44	Standard
Reseller Site	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Analytics Team	Iteration 8	2017-12-07 07:00:00	2017-12-21 06:59:59	22	Planning	<ul><li>Similar Products</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	18	Color Coded
Online Store	Iteration 9	2017-12-21 07:00:00	2018-01-04 06:59:59	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	\N	CAWorld
Platform	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	82	Standard
Reseller Site	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8	Standard
Shopping Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	85	Standard
Payment Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	15	Standard
Platform	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	72	Color Coded
Consumer Site	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	21	Standard
Payment Team	Iteration 7	2017-11-23 07:00:00	2017-12-07 06:59:59	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	\N	CAWorld
Consumer Site	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	68	Standard
API Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	77	Standard
Reseller Site	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	64	Standard
Shopping Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	65	Standard
Fulfillment Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	69	Standard
Online Store	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	70	Standard
Fulfillment Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	109	Color Coded
Online Store	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	110	Color Coded
Payment Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	111	Color Coded
Platform	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	112	Color Coded
Reseller Portal Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	25	Standard
Payment Team	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	42	Color Coded
Online Store	Iteration 5	2017-10-29 11:23:00	2017-11-11 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	41	Standard
API Team	Iteration 4	2017-10-12 06:00:00	2017-10-26 05:59:59	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	\N	CAWorld
Payment Team	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	71	Standard
Consumer Site	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	108	Standard
Fulfillment Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	109	Standard
Online Store	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	23	Standard
Payment Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	91	Standard
Platform	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	92	Standard
Reseller Portal Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	93	Standard
Reseller Site	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	94	Standard
Shopping Team	Iteration 10	2018-01-07 11:23:00	2018-01-20 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	95	Standard
Reseller Portal Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	103	Standard
Reseller Site	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	104	Standard
Shopping Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	105	Standard
API Team	Iteration 12	2018-02-04 11:23:00	2018-02-17 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	107	Standard
Shopping Team	Iteration 10	2018-01-04 07:00:00	2018-01-18 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Platform	Iteration 8	2017-12-10 11:23:00	2017-12-23 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	72	Standard
Consumer Site	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	78	Standard
Online Store	Iteration 1	2017-08-31 06:00:00	2017-09-14 05:59:59	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	\N	CAWorld
Payment Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Reseller Site	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	26	Standard
Reseller Portal Team	Iteration 12	2018-02-01 07:00:00	2018-02-15 06:59:59	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	\N	CAWorld
Shopping Team	Iteration 3	2017-10-01 11:23:00	2017-10-14 11:23:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	27	Standard
Consumer Site	Iteration 6	2017-11-12 11:23:00	2017-11-25 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	48	Standard
Consumer Site	Iteration 1	2017-09-03 11:23:00	2017-09-16 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3	Standard
Payment Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	81	Standard
Reseller Portal Team	Iteration 9	2017-12-24 11:23:00	2018-01-06 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	83	Standard
Payment Team	Iteration 11	2018-01-21 11:23:00	2018-02-03 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	101	Color Coded
Reseller Portal Team	Iteration 7	2017-11-26 11:23:00	2017-12-09 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	63	Color Coded
Consumer Site	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	12	Color Coded
Fulfillment Team	Iteration 2	2017-09-17 11:23:00	2017-09-30 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	13	Color Coded
Analytics Team	Iteration 11	2018-01-18 07:00:00	2018-02-01 06:59:59	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	\N	CAWorld
Online Store	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Payment Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
Reseller Portal Team	Iteration 5	2017-10-26 06:00:00	2017-11-09 05:59:59	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	\N	CAWorld
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY release (project, name, plannedvelocity, releasedate, releasestartdate, state, theme, grossestimateconversionratio, listing_order, dataset) FROM stdin;
Online Store	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	21	Color Coded
API Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	35	Color Coded
Fulfillment Team	R4	25	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	36	Color Coded
Reseller Site	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	37	Color Coded
Payment Team	R4	20	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	38	Color Coded
Reseller Portal Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	39	Color Coded
Reseller Site	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	7	Standard
Payment Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	8	Standard
Reseller Portal Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	9	Standard
Online Store	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	11	Standard
Shopping Team	R2	32	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	12	Standard
Consumer Site	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	13	Standard
Analytics Team	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	14	Standard
API Team	R2	35	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	15	Standard
Fulfillment Team	R2	25	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	16	Standard
Platform	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Online Store	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	31	Color Coded
Fulfillment Team	R3	25	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	26	Color Coded
Reseller Site	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	27	Color Coded
Payment Team	R3	20	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	28	Color Coded
Consumer Site	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	3	Standard
Online Store	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	21	Standard
Reseller Portal Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	29	Standard
Platform	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	20	Standard
Analytics Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	24	Standard
Medical Records App	2.9	8	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	Mobile Access MVF 1.0	1	44	Color Coded
Analytics Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	4	Color Coded
API Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	5	Color Coded
Fulfillment Team	R1	10	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	6	Color Coded
API Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	25	Color Coded
Shopping Team	R3	36	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	22	Standard
Platform	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	30	Standard
Online Store	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	31	Standard
Shopping Team	R4	36	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	32	Standard
Consumer Site	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	33	Standard
Online Store	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	1	Color Coded
Shopping Team	R1	40	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	2	Color Coded
Consumer Site	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	3	Color Coded
Reseller Portal Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	29	Color Coded
Shopping Team	R4	36	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
API Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	25	Standard
Online Store	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Shopping Team	R2	32	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Consumer Site	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Analytics Team	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Shopping Team	R3	36	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Payment Team	R3	20	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	28	Standard
Reseller Site	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	7	Color Coded
Payment Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	8	Color Coded
Reseller Portal Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	9	Color Coded
Online Store	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	11	Color Coded
API Team	R2	35	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Fulfillment Team	R2	25	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Reseller Site	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Payment Team	R2	25	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Reseller Portal Team	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Platform	R2	\N	2017-12-21 06:59:00	2017-10-26 06:00:00	Active	Second Release - Advanced Purchasing and Shipping<br /><br />* Expand purchase functionality<br />* Add shipping<br />* Add search engine<br />* Enhance security	1	\N	CAWorld
Consumer Site	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Analytics Team	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
API Team	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Fulfillment Team	R3	25	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Consumer Site	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Platform	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	40	Color Coded
Medical Records App	2.3	10	2017-10-28 10:59:00	2017-09-03 10:59:00	Accepted	Client Profile Setup	1	41	Color Coded
Medical Records App	2.5	8	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	New Patient Administration	1	42	Color Coded
Medical Records App	2.7	8	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Patient Notifications	1	43	Color Coded
Platform	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	10	Color Coded
Fulfillment Team	R3	25	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	26	Standard
Reseller Site	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	27	Standard
Online Store	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Online Store	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Online Store	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Online Store	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Shopping Team	R1	40	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Consumer Site	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Analytics Team	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
API Team	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Fulfillment Team	R1	10	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Reseller Site	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Payment Team	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Reseller Portal Team	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Platform	R1	\N	2017-11-05 09:35:00	2017-09-11 09:35:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	\N	Summer
Online Store	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Site	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	17	Color Coded
Consumer Site	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	23	Color Coded
Reseller Site	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Payment Team	R2	25	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	18	Color Coded
Reseller Portal Team	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	19	Color Coded
Online Store	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	1	Standard
Shopping Team	R1	40	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	2	Standard
Platform	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	20	Color Coded
Analytics Team	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	24	Color Coded
Medical Records App	2.9	8	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	Mobile Access MVF 1.0	1	44	Standard
Analytics Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	4	Standard
Shopping Team	R2	32	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Consumer Site	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Analytics Team	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
API Team	R2	35	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Fulfillment Team	R2	25	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Site	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Payment Team	R2	25	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Reseller Portal Team	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Platform	R2	\N	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	\N	Summer
Online Store	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Shopping Team	R3	36	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Consumer Site	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Analytics Team	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
API Team	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Fulfillment Team	R3	25	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Reseller Site	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Payment Team	R3	20	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Reseller Portal Team	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Platform	R3	\N	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Personalization and Customization	1	\N	Summer
Online Store	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Shopping Team	R4	36	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Consumer Site	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Analytics Team	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
API Team	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Fulfillment Team	R4	25	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Reseller Site	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Payment Team	R4	20	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Reseller Portal Team	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Platform	R4	\N	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	MVF 2.0 Launch	1	\N	Summer
Medical Records App	2.3	10	2017-11-05 09:35:00	2017-09-11 09:35:00	Accepted	Client Profile Setup	1	\N	Summer
Medical Records App	2.5	8	2017-12-31 09:35:00	2017-11-06 09:35:00	Active	New Patient Administration	1	\N	Summer
Medical Records App	2.7	8	2018-02-25 09:35:00	2018-01-01 09:35:00	Planning	Patient Notifications	1	\N	Summer
Medical Records App	2.9	8	2018-04-22 09:35:00	2018-02-26 09:35:00	Planning	Mobile Access MVF 1.0	1	\N	Summer
Analytics Team	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
API Team	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Fulfillment Team	R1	10	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Reseller Site	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Payment Team	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Reseller Portal Team	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Platform	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Payment Team	R3	20	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Reseller Portal Team	R3	\N	2018-02-15 06:59:00	2017-12-21 07:00:00	Planning	Personalization and Customization	1	\N	CAWorld
Analytics Team	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
API Team	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Fulfillment Team	R4	25	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Reseller Site	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Payment Team	R4	20	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Reseller Portal Team	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Platform	R4	\N	2018-04-12 05:59:00	2018-02-15 07:00:00	Planning	MVF 2.0 Launch	1	\N	CAWorld
Medical Records App	2.3	10	2017-10-28 10:59:00	2017-09-03 10:59:00	Accepted	Client Profile Setup	1	41	Standard
Medical Records App	2.5	8	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	New Patient Administration	1	42	Standard
Medical Records App	2.7	8	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Patient Notifications	1	43	Standard
Platform	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	10	Standard
Shopping Team	R4	36	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	32	Color Coded
Analytics Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	34	Standard
API Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	35	Standard
Fulfillment Team	R4	25	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	36	Standard
Reseller Site	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	37	Standard
Payment Team	R4	20	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	38	Standard
Reseller Portal Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	39	Standard
Platform	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	40	Standard
API Team	R1	\N	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	5	Standard
Fulfillment Team	R1	10	2017-10-28 10:59:00	2017-09-03 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	6	Standard
Reseller Site	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	17	Standard
Consumer Site	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	23	Standard
API Team	R2	35	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	15	Color Coded
Payment Team	R2	25	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	18	Standard
Reseller Portal Team	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	19	Standard
Shopping Team	R1	40	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Consumer Site	R1	\N	2017-10-26 05:59:00	2017-08-31 06:00:00	Active	Initial Release - On-line catalog<br /><br />* Allow login<br />* Apply security<br />* Product viewing functionality<br />* Purchasing<br />* Credit cards	1	\N	CAWorld
Shopping Team	R2	32	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	12	Color Coded
Consumer Site	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	13	Color Coded
Analytics Team	R2	\N	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	14	Color Coded
Fulfillment Team	R2	25	2017-12-23 10:59:00	2017-10-29 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	16	Color Coded
Shopping Team	R3	36	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	22	Color Coded
Platform	R3	\N	2018-02-17 10:59:00	2017-12-24 10:59:00	Planning	Personalization and Customization	1	30	Color Coded
Consumer Site	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	33	Color Coded
Analytics Team	R4	\N	2018-04-14 10:59:00	2018-02-18 10:59:00	Planning	MVF 2.0 Launch	1	34	Color Coded
\.


--
-- Data for Name: story; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY story (name, schedulestate, kanbanstate, portfolioitem, project, iteration, owner, planestimate, release, description, ready, blocked, blockedreason, displaycolor, notes, listing_order, dataset) FROM stdin;
Add support for Discover card	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	11	Standard
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	27	Standard
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	28	Standard
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	29	Standard
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	31	Standard
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	32	Standard
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	33	Standard
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	34	Standard
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	35	Standard
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	36	Standard
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	37	Standard
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	38	Standard
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	39	Standard
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	40	Standard
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	41	Standard
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	43	Standard
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	44	Standard
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	7	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	45	Standard
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	46	Standard
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	47	Standard
Provide failover connection to G5 verification service.	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	48	Standard
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	49	Standard
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	50	Standard
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	51	Standard
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	52	Standard
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	53	Standard
Song Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	dudley@acme.com	7	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	54	Standard
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	55	Standard
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	56	Standard
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	57	Standard
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	20	\N	\N	FALSE	FALSE	\N	\N	\N	58	Standard
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	59	Standard
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	60	Standard
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	61	Standard
Add support for Discover card	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	11	Color Coded
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	89	Standard
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	7	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	62	Standard
Data fields for Shipping information	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	63	Standard
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	65	Standard
Ship Single-Site Order	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	66	Standard
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	67	Standard
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	68	Standard
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	70	Standard
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	71	Standard
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	\N	\N	72	Standard
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	73	Standard
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	75	Standard
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	92	Standard
Move Server Room	In-Progress	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	77	Standard
Move to Oracle	Accepted	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	78	Standard
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	79	Standard
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	80	Standard
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	81	Standard
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	82	Standard
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	5	Standard
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	83	Standard
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	84	Standard
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	85	Standard
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	87	Standard
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	88	Standard
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	\N	\N	90	Standard
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	\N	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	91	Standard
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	94	Standard
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	27	Color Coded
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	28	Color Coded
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	12	Standard
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	96	Standard
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	7	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	97	Standard
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	100	Standard
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	101	Standard
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	102	Standard
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	103	Standard
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	104	Standard
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	105	Standard
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	2	Standard
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	4	Standard
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	106	Standard
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	107	Standard
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	\N	R2	\N	FALSE	FALSE	\N	\N	\N	109	Standard
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	110	Standard
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	111	Standard
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	112	Standard
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	113	Standard
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	114	Standard
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	115	Standard
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	6	Standard
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	7	Standard
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	8	Standard
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	9	Standard
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	116	Standard
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	117	Standard
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	118	Standard
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	29	Color Coded
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	31	Color Coded
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	7	R2	\N	FALSE	FALSE	\N	\N	\N	13	Standard
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	14	Standard
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	15	Standard
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	16	Standard
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	17	Standard
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	18	Standard
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	19	Standard
Handle out of limit errors on credit card charges	Defined	\N	Credit card payments	Payment Team	Iteration 7	\N	13	R2	\N	FALSE	FALSE	\N	\N	\N	20	Standard
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	21	Standard
Log unsuccessful payment attempts	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	22	Standard
Pay with Points	Defined	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	23	Standard
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	24	Standard
align email 'importance field to case 'priority' field	Defined	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	25	Standard
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	\N	\N	26	Standard
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	119	Standard
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	121	Standard
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	93	Standard
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	32	Color Coded
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	33	Color Coded
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	34	Color Coded
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	35	Color Coded
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	36	Color Coded
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	37	Color Coded
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	38	Color Coded
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	39	Color Coded
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	40	Color Coded
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	41	Color Coded
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	43	Color Coded
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	44	Color Coded
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	7	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	45	Color Coded
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	46	Color Coded
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	47	Color Coded
Provide failover connection to G5 verification service.	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	48	Color Coded
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	30	Standard
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	49	Color Coded
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	50	Color Coded
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	51	Color Coded
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	52	Color Coded
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	53	Color Coded
Song Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	dudley@acme.com	7	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	54	Color Coded
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	55	Color Coded
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	56	Color Coded
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	57	Color Coded
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	20	\N	\N	FALSE	FALSE	\N	\N	\N	58	Color Coded
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	59	Color Coded
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	60	Color Coded
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	61	Color Coded
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	7	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	62	Color Coded
Data fields for Shipping information	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	63	Color Coded
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	65	Color Coded
Ship Single-Site Order	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	66	Color Coded
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	67	Color Coded
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	68	Color Coded
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	70	Color Coded
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	71	Color Coded
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	\N	\N	72	Color Coded
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	73	Color Coded
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	75	Color Coded
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	92	Color Coded
Move Server Room	In-Progress	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	77	Color Coded
Move to Oracle	Accepted	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	78	Color Coded
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	107	Color Coded
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	79	Color Coded
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	80	Color Coded
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	81	Color Coded
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	82	Color Coded
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	5	Color Coded
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	83	Color Coded
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	84	Color Coded
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	85	Color Coded
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	87	Color Coded
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	88	Color Coded
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	\N	\N	90	Color Coded
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	\N	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	91	Color Coded
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	94	Color Coded
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	12	Color Coded
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	89	Color Coded
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	96	Color Coded
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	7	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	97	Color Coded
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	100	Color Coded
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	101	Color Coded
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	102	Color Coded
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	103	Color Coded
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	104	Color Coded
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	105	Color Coded
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	2	Color Coded
Overnight Shipping	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	64	Standard
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	4	Color Coded
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	106	Color Coded
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	\N	R2	\N	FALSE	FALSE	\N	\N	\N	109	Color Coded
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	110	Color Coded
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	111	Color Coded
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	112	Color Coded
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	113	Color Coded
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	114	Color Coded
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	115	Color Coded
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	6	Color Coded
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	7	Color Coded
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	8	Color Coded
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	9	Color Coded
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	116	Color Coded
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	117	Color Coded
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	118	Color Coded
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	7	R2	\N	FALSE	FALSE	\N	\N	\N	13	Color Coded
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	14	Color Coded
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	15	Color Coded
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	16	Color Coded
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	17	Color Coded
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	18	Color Coded
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	19	Color Coded
Handle out of limit errors on credit card charges	Defined	\N	Credit card payments	Payment Team	Iteration 7	\N	13	R2	\N	FALSE	FALSE	\N	\N	\N	20	Color Coded
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	21	Color Coded
Log unsuccessful payment attempts	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	22	Color Coded
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	99	Standard
Pay with Points	Defined	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	23	Color Coded
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	24	Color Coded
align email 'importance field to case 'priority' field	Defined	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	25	Color Coded
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	\N	\N	26	Color Coded
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	119	Color Coded
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	121	Color Coded
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	93	Color Coded
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	30	Color Coded
Overnight Shipping	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	64	Color Coded
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	99	Color Coded
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	123	Color Coded
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143	Color Coded
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	124	Color Coded
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	123	Standard
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	124	Standard
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	125	Standard
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	126	Standard
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	127	Standard
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	128	Standard
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	129	Standard
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	130	Standard
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	131	Standard
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	132	Standard
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	\N	\N	\N	\N	133	Standard
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	\N	\N	\N	\N	134	Standard
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	\N	\N	\N	\N	135	Standard
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	136	Standard
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	108	Standard
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	10	Standard
API for Basic Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	1	Standard
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	3	Standard
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	125	Color Coded
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	126	Color Coded
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	127	Color Coded
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	128	Color Coded
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	129	Color Coded
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	130	Color Coded
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	131	Color Coded
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	132	Color Coded
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	\N	\N	\N	\N	133	Color Coded
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	\N	\N	\N	\N	134	Color Coded
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	\N	\N	\N	\N	135	Color Coded
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	136	Color Coded
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	108	Color Coded
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	10	Color Coded
API for Basic Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	1	Color Coded
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	3	Color Coded
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	137	Color Coded
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	138	Color Coded
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	139	Color Coded
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	140	Color Coded
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	141	Color Coded
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	142	Color Coded
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	137	Standard
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	138	Standard
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	139	Standard
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	140	Standard
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	141	Standard
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	142	Standard
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143	Standard
Choose a secure ecommerce platform	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 4	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Implement secure connection for online checkout	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 4	paul@acme.com	13	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Ensure PCI compliance	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 4	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Do not store sensitive data	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 4	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Implement an address and card verification system	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 5	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Implement strong password requirementys	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 5	paul@acme.com	13	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Set up system alerts for suspicious activity	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 5	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Layer security features	Accepted	\N	Implement Fraud Detection	Payment Team	Iteration 6	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Provide security training to employees	In-Progress	\N	Implement Fraud Detection	Payment Team	Iteration 6	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Implement process for regular PCI scans	Defined	\N	Implement Fraud Detection	Payment Team	Iteration 7	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Implement process for regular system scans	Defined	\N	Implement Fraud Detection	Payment Team	Iteration 8	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#df1a7b	\N	\N	CAWorld
Integrate with Amex Gateway - 1	Accepted	\N	Integrate with Amex Gateway	Payment Team	Iteration 6	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Integrate with Amex Gateway - 2	Accepted	\N	Integrate with Amex Gateway	Payment Team	Iteration 6	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Integrate with Amex Gateway - 3	Accepted	\N	Integrate with Amex Gateway	Payment Team	Iteration 6	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Integrate with Amex Gateway - 4	Accepted	\N	Integrate with Amex Gateway	Payment Team	Iteration 6	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Realtime notifications - 1	Defined	\N	Realtime notifications	API Team	Iteration 7	paul@acme.com	2	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Realtime notifications - 2	Defined	\N	Realtime notifications	API Team	Iteration 7	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Realtime notifications - 3	Defined	\N	Realtime notifications	API Team	Iteration 8	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Outbound SMS messages for support case updates - 1	Accepted	\N	Outbound SMS messages for support case updates	API Team	Iteration 5	paul@acme.com	2	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Outbound SMS messages for support case updates - 2	Accepted	\N	Outbound SMS messages for support case updates	API Team	Iteration 5	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Outbound SMS messages for support case updates - 3	Accepted	\N	Outbound SMS messages for support case updates	API Team	Iteration 5	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Outbound SMS messages for support case updates - 4	Accepted	\N	Outbound SMS messages for support case updates	API Team	Iteration 6	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Outbound SMS messages for support case updates - 5	Accepted	\N	Outbound SMS messages for support case updates	API Team	Iteration 6	paul@acme.com	8	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Provide public API to support 3rd party integrations - 1	Defined	\N	Provide public API to support 3rd party integrations	API Team	\N	paul@acme.com	3	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Provide public API to support 3rd party integrations - 2	Defined	\N	Provide public API to support 3rd party integrations	API Team	\N	paul@acme.com	5	\N	\N	FALSE	FALSE	\N	#107c1e	\N	\N	CAWorld
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	42	Standard
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	69	Standard
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	74	Standard
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	76	Standard
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	86	Standard
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	95	Standard
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	86	Color Coded
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to Color Coded First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	95	Color Coded
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	98	Standard
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	120	Standard
Validate Customer Contact/Shipping info	Accepted	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	122	Standard
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	42	Color Coded
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	69	Color Coded
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	74	Color Coded
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	76	Color Coded
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	98	Color Coded
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	120	Color Coded
Validate Customer Contact/Shipping info	Accepted	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	122	Color Coded
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	#21a2e0	\N	\N	CAWorld
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Validate Customer Contact/Shipping info	Completed	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	20	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Data fields for Shipping information	Completed	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Ship Single-Site Order	Completed	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Move Server Room	Completed	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	\N	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	\N	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to post tickets	Accepted	\N	Support write API	Consumer Site	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	#4a1d7e	\N	\N	CAWorld
As a user I would like to update data	In-Progress	\N	Support write API	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	#4a1d7e	\N	\N	CAWorld
As a user I would like to update tickets	Defined	\N	Support write API	API Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	#4a1d7e	\N	\N	CAWorld
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Pay with Points	Accepted	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	8	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	dave@acme.com	8	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	#21a2e0	\N	\N	CAWorld
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	5	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	2	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Provide failover connection to G5 verification service.	Completed	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Move to Oracle	Completed	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Overnight Shipping	In-Progress	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Song Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	dudley@acme.com	7	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	7	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
align email 'importance field to case 'priority' field	In-Progress	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	#4a1d7e	\N	\N	CAWorld
As a user I would like to post attributes	Accepted	Accepted	Support write API	Fulfillment Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	#4a1d7e	\N	\N	CAWorld
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	8	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	7	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
API for Basic Shipping	Defined	\N	API for Shipping	API Team	\N	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	\N	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Purchase Multiple Items	Accepted	\N	Credit card payments	Payment Team	Iteration 5	\N	2	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	Iteration 8	\N	3	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Add support for Discover card	Accepted	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Change Billing Address	Accepted	\N	Credit card payments	Payment Team	Iteration 5	\N	1	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	Iteration 8	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Cross check purchases with fraud credit card list	Accepted	\N	Credit card payments	Payment Team	Iteration 6	\N	2	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Demo Support	In-Progress	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Generate audit report tempate for annual per-user purchase history.	Accepted	\N	Credit card payments	Payment Team	Iteration 6	\N	5	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Handle out of limit errors on credit card charges	Accepted	\N	Credit card payments	Payment Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
Log unsuccessful payment attempts	Accepted	\N	Credit card payments	Payment Team	Iteration 6	\N	5	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
support case updates by matching subject line in reply emails	Accepted	\N	Email-to-case integration	API Team	Iteration 6	\N	7	\N	\N	FALSE	FALSE	\N	#fce205	\N	\N	CAWorld
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	7	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	#21a2e0	\N	\N	CAWorld
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Handle out of limit errors on credit card charges	Defined	\N	Credit card payments	Payment Team	Iteration 7	peter@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Log unsuccessful payment attempts	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Pay with Points	Defined	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	\N	Summer
align email 'importance field to case 'priority' field	Defined	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	aaron@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	\N	Summer
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	\N	Summer
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	7	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	\N	Summer
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	\N	Summer
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	aaron@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Provide failover connection to G5 verification service.	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	\N	Summer
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	\N	Summer
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	aaron@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	aaron@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Song Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	dudley@acme.com	7	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
API for Basic Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	\N	Summer
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	\N	Summer
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add support for Discover card	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	deb@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	\N	Summer
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	\N	Summer
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	dave@acme.com	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	\N	Summer
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	dudley@acme.com	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	\N	Summer
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	\N	Summer
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	20	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	\N	Summer
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	7	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	\N	Summer
Data fields for Shipping information	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	\N	Summer
Overnight Shipping	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	\N	Summer
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	\N	Summer
Ship Single-Site Order	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	\N	Summer
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	\N	Summer
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	\N	Summer
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	\N	Summer
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Move Server Room	In-Progress	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	\N	Summer
Move to Oracle	Accepted	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	\N	Summer
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	\N	Summer
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	dudley@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	dudley@acme.com	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	\N	Summer
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	\N	Summer
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	\N	Summer
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	7	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	\N	Summer
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	\N	Summer
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	deb@acme.com	4	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	dudley@acme.com	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	\N	Summer
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	\N	Summer
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	\N	Summer
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Validate Customer Contact/Shipping info	Accepted	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	\N	Summer
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	dave@acme.com	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	\N	Summer
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	dave@acme.com	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	\N	Summer
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	\N	Summer
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	\N	\N	\N	\N	\N	Summer
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	\N	\N	\N	\N	\N	Summer
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	\N	\N	\N	\N	\N	Summer
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	\N	Summer
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	\N	Summer
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	\N	Summer
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	\N	Summer
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	\N	Summer
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	\N	Summer
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	\N	Summer
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Summer
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (name, workproduct, state, owner, estimate, todo, actuals, blocked, blockedreason, description, displaycolor, ready, taskindex, project, listing_order, dataset, notes) FROM stdin;
Link to shipping backend	2-3 Day Shipping	Defined	\N	8	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	1	Color Coded	\N
GUI for shipping options	2-3 Day Shipping	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	2	Color Coded	\N
Run Functional Tests	2-3 Day Shipping	Defined	\N	8	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	3	Color Coded	\N
Write Code	API for Basic Shipping	Defined	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	4	Color Coded	\N
API Test Harnesses	API for Basic Shipping	Defined	\N	8	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	5	Color Coded	\N
Automated Tests	API for Basic Shipping	Defined	\N	6	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	6	Color Coded	\N
Run Functional Tests	API for Basic Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	7	Color Coded	\N
Write Code	API for Multi-Site Shipping	Defined	\N	7	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	8	Color Coded	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	\N	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	9	Color Coded	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	10	Color Coded	\N
Create automated Tests	API for Multi-Site Shipping	Defined	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	11	Color Coded	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	12	Color Coded	\N
Filter only company supported shipping options	Calculate Split Shipping	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	13	Color Coded	\N
Automated Tests for Web Services API	Calculate Split Shipping	Completed	\N	7	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	14	Color Coded	\N
Code	Find My Orders	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	15	Color Coded	\N
Create Automated Tests	Find My Orders	Defined	\N	8	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	16	Color Coded	\N
Code	Data fields for Shipping information	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	17	Color Coded	\N
Create Automated Tests	Data fields for Shipping information	Completed	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	18	Color Coded	\N
Doc	Data fields for Shipping information	Completed	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	19	Color Coded	\N
adjust stylesheet properties	latest Promo Code is invalid.	Completed	diane@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	20	Color Coded	\N
fix screenshots in online help	latest Promo Code is invalid.	Completed	diane@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	21	Color Coded	\N
Code	Provide failover connection to G5 verification service.	Completed	diane@acme.com	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	22	Color Coded	\N
Regression Testing	Provide failover connection to G5 verification service.	Completed	diane@acme.com	6	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	23	Color Coded	\N
Setup new Servers	Move Server Room	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	24	Color Coded	\N
Move Code to new Servers	Move Server Room	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	25	Color Coded	\N
Update SQL	Move to Oracle	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	26	Color Coded	\N
Setup Oracle	Move to Oracle	Completed	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	27	Color Coded	\N
Link to shipping backend	Overnight Shipping	In-Progress	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	28	Color Coded	\N
GUI for shipping options	Overnight Shipping	Defined	\N	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	29	Color Coded	\N
Run Functional Tests	Overnight Shipping	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	30	Color Coded	\N
Database tables for order codes	View By Order	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	31	Color Coded	\N
GUI for order pages	View By Order	Defined	\N	6	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	32	Color Coded	\N
Run Functional Tests	View By Order	Defined	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	33	Color Coded	\N
Create automated Tests	View By Order	Defined	\N	2	0	\N	FALSE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	34	Color Coded	\N
GUI for Purchase Your Items	Purchase Your Items	Completed	dudley@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	35	Color Coded	\N
Create Automated Tests	Purchase Your Items	Completed	tara@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	36	Color Coded	\N
Implement Service Layer	Purchase Your Items	In-Progress	daniel@acme.com	5	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	37	Color Coded	\N
Implement Credit Card Payment Service	Purchase Your Items	In-Progress	diane@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	4	\N	38	Color Coded	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	5	\N	39	Color Coded	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	6	1	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	40	Color Coded	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	41	Color Coded	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	42	Color Coded	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	4	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	43	Color Coded	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	7	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	44	Color Coded	\N
UI for splitting order	Ship Multi-Site Orders	In-Progress	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	45	Color Coded	\N
Create automated Tests	Ship Multi-Site Orders	In-Progress	\N	7	7	\N	TRUE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	46	Color Coded	\N
Document Functionality	Ship Multi-Site Orders	In-Progress	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	47	Color Coded	\N
Code	Ship Single-Site Order	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	48	Color Coded	\N
Create Automated Tests	Ship Single-Site Order	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	49	Color Coded	\N
Doc	Ship Single-Site Order	Completed	\N	7	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	50	Color Coded	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	51	Color Coded	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	5	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52	Color Coded	\N
use new api version call	State drop down doesn't contain any items	Completed	dudley@acme.com	4	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	53	Color Coded	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Completed	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	54	Color Coded	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	55	Color Coded	\N
Update Logic	Update Shipping System for Each Order	Completed	\N	8	7	\N	FALSE	\N	\N	\N	FALSE	1	\N	56	Color Coded	\N
Automated Tests	Update Shipping System for Each Order	Completed	\N	6	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	57	Color Coded	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	58	Color Coded	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Completed	dudley@acme.com	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	59	Color Coded	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	60	Color Coded	\N
Code	Website must be available 24x7	Completed	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	61	Color Coded	\N
Create Automated Tests	Website must be available 24x7	Completed	\N	7	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	62	Color Coded	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	63	Color Coded	\N
Link to shipping backend	2-3 Day Shipping	Defined	\N	8	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	1	Standard	\N
GUI for shipping options	2-3 Day Shipping	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	2	Standard	\N
Run Functional Tests	2-3 Day Shipping	Defined	\N	8	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	3	Standard	\N
Write Code	API for Basic Shipping	Defined	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	4	Standard	\N
API Test Harnesses	API for Basic Shipping	Defined	\N	8	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	5	Standard	\N
Automated Tests	API for Basic Shipping	Defined	\N	6	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	6	Standard	\N
Run Functional Tests	API for Basic Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	7	Standard	\N
Write Code	API for Multi-Site Shipping	Defined	\N	7	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	8	Standard	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	\N	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	9	Standard	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	10	Standard	\N
Create automated Tests	API for Multi-Site Shipping	Defined	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	11	Standard	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	12	Standard	\N
Filter only company supported shipping options	Calculate Split Shipping	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	13	Standard	\N
Automated Tests for Web Services API	Calculate Split Shipping	Completed	\N	7	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	14	Standard	\N
Code	Find My Orders	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	15	Standard	\N
Create Automated Tests	Find My Orders	Defined	\N	8	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	16	Standard	\N
Code	Data fields for Shipping information	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	17	Standard	\N
Create Automated Tests	Data fields for Shipping information	Completed	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	18	Standard	\N
Doc	Data fields for Shipping information	Completed	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	19	Standard	\N
adjust stylesheet properties	latest Promo Code is invalid.	Completed	diane@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	20	Standard	\N
fix screenshots in online help	latest Promo Code is invalid.	Completed	diane@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	21	Standard	\N
Code	Provide failover connection to G5 verification service.	Completed	diane@acme.com	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	22	Standard	\N
Regression Testing	Provide failover connection to G5 verification service.	Completed	diane@acme.com	6	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	23	Standard	\N
Setup new Servers	Move Server Room	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	24	Standard	\N
Move Code to new Servers	Move Server Room	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	25	Standard	\N
Update SQL	Move to Oracle	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	26	Standard	\N
Setup Oracle	Move to Oracle	Completed	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	27	Standard	\N
Link to shipping backend	Overnight Shipping	In-Progress	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	28	Standard	\N
GUI for shipping options	Overnight Shipping	Defined	\N	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	29	Standard	\N
Run Functional Tests	Overnight Shipping	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	30	Standard	\N
Database tables for order codes	View By Order	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	31	Standard	\N
GUI for order pages	View By Order	Defined	\N	6	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	32	Standard	\N
Run Functional Tests	View By Order	Defined	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	33	Standard	\N
Create automated Tests	View By Order	Defined	\N	2	0	\N	FALSE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	34	Standard	\N
GUI for Purchase Your Items	Purchase Your Items	Completed	dudley@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	35	Standard	\N
Create Automated Tests	Purchase Your Items	Completed	tara@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	36	Standard	\N
Implement Service Layer	Purchase Your Items	In-Progress	daniel@acme.com	5	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	37	Standard	\N
Implement Credit Card Payment Service	Purchase Your Items	In-Progress	diane@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	4	\N	38	Standard	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	5	\N	39	Standard	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	6	1	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	40	Standard	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	41	Standard	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	42	Standard	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	4	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	43	Standard	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	7	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	44	Standard	\N
UI for splitting order	Ship Multi-Site Orders	In-Progress	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	45	Standard	\N
Create automated Tests	Ship Multi-Site Orders	In-Progress	\N	7	7	\N	TRUE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	46	Standard	\N
Document Functionality	Ship Multi-Site Orders	In-Progress	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	47	Standard	\N
Code	Ship Single-Site Order	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	48	Standard	\N
Create Automated Tests	Ship Single-Site Order	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	49	Standard	\N
Doc	Ship Single-Site Order	Completed	\N	7	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	50	Standard	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	51	Standard	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	5	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52	Standard	\N
use new api version call	State drop down doesn't contain any items	Completed	dudley@acme.com	4	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	53	Standard	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Completed	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	54	Standard	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	55	Standard	\N
Update Logic	Update Shipping System for Each Order	Completed	\N	8	7	\N	FALSE	\N	\N	\N	FALSE	1	\N	56	Standard	\N
Automated Tests	Update Shipping System for Each Order	Completed	\N	6	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	57	Standard	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	58	Standard	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Completed	dudley@acme.com	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	59	Standard	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	60	Standard	\N
Code	Website must be available 24x7	Completed	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	61	Standard	\N
Create Automated Tests	Website must be available 24x7	Completed	\N	7	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	62	Standard	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	63	Standard	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	64	Standard	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	3	\N	\N	\N	\N	\N	\N	0	\N	65	Standard	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	4	0	\N	\N	\N	\N	\N	\N	1	\N	66	Standard	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	6	2	\N	\N	\N	\N	\N	\N	0	\N	67	Standard	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	2	1	\N	\N	\N	\N	\N	\N	1	\N	68	Standard	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	64	Color Coded	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	3	\N	\N	\N	\N	\N	\N	0	\N	65	Color Coded	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	4	0	\N	\N	\N	\N	\N	\N	1	\N	66	Color Coded	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	6	2	\N	\N	\N	\N	\N	\N	0	\N	67	Color Coded	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	2	1	\N	\N	\N	\N	\N	\N	1	\N	68	Color Coded	\N
Link to shipping backend	2-3 Day Shipping	Defined	\N	8	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	1	CAWorld	\N
GUI for shipping options	2-3 Day Shipping	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	2	CAWorld	\N
Run Functional Tests	2-3 Day Shipping	Defined	\N	8	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	3	CAWorld	\N
Write Code	API for Basic Shipping	Defined	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	4	CAWorld	\N
API Test Harnesses	API for Basic Shipping	Defined	\N	8	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	5	CAWorld	\N
Automated Tests	API for Basic Shipping	Defined	\N	6	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	6	CAWorld	\N
Run Functional Tests	API for Basic Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	7	CAWorld	\N
Write Code	API for Multi-Site Shipping	Defined	\N	7	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	8	CAWorld	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	\N	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	9	CAWorld	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	10	CAWorld	\N
Create automated Tests	API for Multi-Site Shipping	Defined	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	11	CAWorld	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	12	CAWorld	\N
Filter only company supported shipping options	Calculate Split Shipping	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	13	CAWorld	\N
Automated Tests for Web Services API	Calculate Split Shipping	Completed	\N	7	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	14	CAWorld	\N
Code	Find My Orders	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	0	\N	15	CAWorld	\N
Create Automated Tests	Find My Orders	Defined	\N	8	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	16	CAWorld	\N
Code	Data fields for Shipping information	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	17	CAWorld	\N
Create Automated Tests	Data fields for Shipping information	Completed	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	18	CAWorld	\N
Doc	Data fields for Shipping information	Completed	\N	6	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	19	CAWorld	\N
adjust stylesheet properties	latest Promo Code is invalid.	Completed	diane@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	20	CAWorld	\N
fix screenshots in online help	latest Promo Code is invalid.	Completed	diane@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	21	CAWorld	\N
Code	Provide failover connection to G5 verification service.	Completed	diane@acme.com	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	22	CAWorld	\N
Regression Testing	Provide failover connection to G5 verification service.	Completed	diane@acme.com	6	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	23	CAWorld	\N
Setup new Servers	Move Server Room	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	24	CAWorld	\N
Move Code to new Servers	Move Server Room	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	25	CAWorld	\N
Update SQL	Move to Oracle	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	26	CAWorld	\N
Setup Oracle	Move to Oracle	Completed	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	27	CAWorld	\N
Link to shipping backend	Overnight Shipping	In-Progress	\N	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	28	CAWorld	\N
GUI for shipping options	Overnight Shipping	Defined	\N	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	29	CAWorld	\N
Run Functional Tests	Overnight Shipping	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	30	CAWorld	\N
Database tables for order codes	View By Order	Defined	\N	5	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	31	CAWorld	\N
GUI for order pages	View By Order	Defined	\N	6	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	32	CAWorld	\N
Run Functional Tests	View By Order	Defined	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	33	CAWorld	\N
Create automated Tests	View By Order	Defined	\N	2	0	\N	FALSE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	34	CAWorld	\N
GUI for Purchase Your Items	Purchase Your Items	Completed	dudley@acme.com	7	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	35	CAWorld	\N
Create Automated Tests	Purchase Your Items	Completed	tara@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	36	CAWorld	\N
Implement Service Layer	Purchase Your Items	In-Progress	daniel@acme.com	5	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	37	CAWorld	\N
Implement Credit Card Payment Service	Purchase Your Items	In-Progress	diane@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	4	\N	38	CAWorld	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	5	\N	39	CAWorld	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	6	1	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	40	CAWorld	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	41	CAWorld	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	2	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	42	CAWorld	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	4	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	43	CAWorld	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	7	5	\N	FALSE	\N	\N	\N	FALSE	3	\N	44	CAWorld	\N
UI for splitting order	Ship Multi-Site Orders	In-Progress	\N	2	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	45	CAWorld	\N
Create automated Tests	Ship Multi-Site Orders	In-Progress	\N	7	7	\N	TRUE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	46	CAWorld	\N
Document Functionality	Ship Multi-Site Orders	In-Progress	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	47	CAWorld	\N
Code	Ship Single-Site Order	Completed	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	48	CAWorld	\N
Create Automated Tests	Ship Single-Site Order	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	49	CAWorld	\N
Doc	Ship Single-Site Order	Completed	\N	7	3	\N	FALSE	\N	\N	\N	FALSE	2	\N	50	CAWorld	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	51	CAWorld	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	5	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52	CAWorld	\N
use new api version call	State drop down doesn't contain any items	Completed	dudley@acme.com	4	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	53	CAWorld	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Completed	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	54	CAWorld	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Completed	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	0	\N	55	CAWorld	\N
Update Logic	Update Shipping System for Each Order	Completed	\N	8	7	\N	FALSE	\N	\N	\N	FALSE	1	\N	56	CAWorld	\N
Automated Tests	Update Shipping System for Each Order	Completed	\N	6	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	57	CAWorld	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	5	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	58	CAWorld	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Completed	dudley@acme.com	4	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	59	CAWorld	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	1	1	\N	FALSE	\N	\N	\N	FALSE	2	\N	60	CAWorld	\N
Code	Website must be available 24x7	Completed	\N	2	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	61	CAWorld	\N
Create Automated Tests	Website must be available 24x7	Completed	\N	7	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	62	CAWorld	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	7	1	\N	FALSE	\N	\N	\N	FALSE	1	\N	63	CAWorld	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	3	2	\N	FALSE	\N	\N	\N	FALSE	1	\N	64	CAWorld	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	3	\N	\N	\N	\N	\N	\N	0	\N	65	CAWorld	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	4	0	\N	\N	\N	\N	\N	\N	1	\N	66	CAWorld	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	6	2	\N	\N	\N	\N	\N	\N	0	\N	67	CAWorld	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	2	1	\N	\N	\N	\N	\N	\N	1	\N	68	CAWorld	\N
Link to shipping backend	2-3 Day Shipping	Defined	\N	6	6	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
GUI for shipping options	2-3 Day Shipping	Defined	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Run Functional Tests	2-3 Day Shipping	Defined	\N	15	15	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Write Code	API for Basic Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
API Test Harnesses	API for Basic Shipping	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Automated Tests	API for Basic Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Run Functional Tests	API for Basic Shipping	Defined	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	\N	Summer	\N
Write Code	API for Multi-Site Shipping	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
API Test Harnesses	API for Multi-Site Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Run Functional Tests	API for Multi-Site Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Create automated Tests	API for Multi-Site Shipping	Defined	\N	13	13	\N	FALSE	\N	\N	\N	FALSE	3	\N	\N	Summer	\N
Use Shipping Web Service for Calculation	Calculate Split Shipping	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Filter only company supported shipping options	Calculate Split Shipping	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Automated Tests for Web Services API	Calculate Split Shipping	Completed	\N	13	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Code	Find My Orders	Defined	\N	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Create Automated Tests	Find My Orders	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Code	Data fields for Shipping information	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Create Automated Tests	Data fields for Shipping information	Completed	\N	11	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Doc	Data fields for Shipping information	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
adjust stylesheet properties	latest Promo Code is invalid.	Completed	diane@acme.com	8	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
fix screenshots in online help	latest Promo Code is invalid.	Completed	diane@acme.com	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Code	Provide failover connection to G5 verification service.	Completed	diane@acme.com	10	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Regression Testing	Provide failover connection to G5 verification service.	Completed	diane@acme.com	15	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Setup new Servers	Move Server Room	Completed	\N	14	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Move Code to new Servers	Move Server Room	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Update SQL	Move to Oracle	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Setup Oracle	Move to Oracle	Completed	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Link to shipping backend	Overnight Shipping	In-Progress	\N	7	7	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
GUI for shipping options	Overnight Shipping	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Run Functional Tests	Overnight Shipping	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Database tables for order codes	View By Order	Defined	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
GUI for order pages	View By Order	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Run Functional Tests	View By Order	Defined	\N	11	11	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Create automated Tests	View By Order	Defined	\N	2	2	\N	FALSE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	\N	Summer	\N
GUI for Purchase Your Items	Purchase Your Items	Completed	dudley@acme.com	11	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Create Automated Tests	Purchase Your Items	Completed	tara@acme.com	13	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Implement Service Layer	Purchase Your Items	In-Progress	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	\N	Summer	\N
Implement Credit Card Payment Service	Purchase Your Items	In-Progress	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	\N	Summer	\N
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	\N	Summer	\N
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	\N	Summer	\N
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	3	\N	\N	Summer	\N
UI for splitting order	Ship Multi-Site Orders	In-Progress	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Create automated Tests	Ship Multi-Site Orders	In-Progress	\N	6	6	\N	TRUE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	\N	Summer	\N
Document Functionality	Ship Multi-Site Orders	In-Progress	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Code	Ship Single-Site Order	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Create Automated Tests	Ship Single-Site Order	Completed	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Doc	Ship Single-Site Order	Completed	\N	7	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Review error conditions from payment gateway	Cancel the Order	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
use new api version call	State drop down doesn't contain any items	Completed	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Completed	dudley@acme.com	13	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Backend Link to Shipping System	Update Shipping System for Each Order	Completed	\N	9	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Update Logic	Update Shipping System for Each Order	Completed	\N	14	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Automated Tests	Update Shipping System for Each Order	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Write front-end validation code	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	12	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Completed	dudley@acme.com	8	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Document Validation Functionality	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	10	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	\N	Summer	\N
Code	Website must be available 24x7	Completed	\N	11	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	\N	Summer	\N
Create Automated Tests	Website must be available 24x7	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	\N	Summer	\N
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	20	20	\N	\N	\N	\N	\N	\N	0	\N	\N	Summer	\N
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	\N	\N	\N	\N	\N	1	\N	\N	Summer	\N
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	20	20	\N	\N	\N	\N	\N	\N	0	\N	\N	Summer	\N
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	\N	\N	\N	\N	\N	1	\N	\N	Summer	\N
\.


--
-- Data for Name: testcase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcase (name, owner, project, testfolder, workproduct, method, description, objective, postconditions, preconditions, priority, ready, risk, type, validationexpectedresult, validationinput, listing_order, dataset) FROM stdin;
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1	Color Coded
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2	Color Coded
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3	Color Coded
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4	Color Coded
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5	Color Coded
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6	Color Coded
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9	Color Coded
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7	Color Coded
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8	Color Coded
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10	Color Coded
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11	Color Coded
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12	Color Coded
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13	Color Coded
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14	Color Coded
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15	Color Coded
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16	Color Coded
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17	Color Coded
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18	Color Coded
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19	Color Coded
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20	Color Coded
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21	Color Coded
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24	Color Coded
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26	Color Coded
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27	Color Coded
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22	Color Coded
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29	Color Coded
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23	Color Coded
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24	Standard
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26	Standard
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25	Color Coded
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28	Color Coded
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30	Color Coded
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31	Color Coded
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32	Color Coded
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33	Color Coded
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34	Color Coded
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35	Color Coded
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36	Color Coded
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37	Color Coded
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38	Color Coded
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1	Standard
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2	Standard
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3	Standard
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4	Standard
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5	Standard
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6	Standard
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9	Standard
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7	Standard
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8	Standard
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10	Standard
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11	Standard
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12	Standard
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13	Standard
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14	Standard
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15	Standard
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16	Standard
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17	Standard
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18	Standard
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19	Standard
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20	Standard
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21	Standard
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27	Standard
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22	Standard
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29	Standard
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23	Standard
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25	Standard
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28	Standard
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30	Standard
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31	Standard
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32	Standard
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33	Standard
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34	Standard
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35	Standard
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36	Standard
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37	Standard
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38	Standard
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Check the Status of Your Orders	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	\N	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
GUI - Checkout Button	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Log-in to Secured Website	tara@acme.com	Shopping Team	\N	\N	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Log-off Website	tara@acme.com	Shopping Team	\N	\N	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
No Address Entered	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
One Promo Code per order	tina@acme.com	Payment Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Order Verification	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Priority Shipping GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Purchase MAX Items	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	CAWorld
Purchase Multiple Items	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	CAWorld
Purchase One Item	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	\N	CAWorld
Search for Items	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Select MAX+1 Items	tara@acme.com	Shopping Team	\N	\N	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	CAWorld
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Tracking Information	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Updated Totals	tony@acme.com	Fulfillment Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Validate Email Address - Permissions	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	CAWorld
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	\N	Summer
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	\N	Summer
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	\N	Summer
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	\N	Summer
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	\N	Summer
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	\N	Summer
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	\N	Summer
\.


--
-- Data for Name: testcaseresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcaseresult (build, date, duration, notes, verdict, testcase, testset, tester, listing_order, dataset) FROM stdin;
115	2016-05-02 02:40:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	CAWorld
114	2017-11-12 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	1	Color Coded
1.2.24	2017-11-12 10:59:00	1	\N	Pass	Log-off Website	\N	\N	23	Color Coded
1.2.24	2017-11-12 10:59:00	1	\N	Pass	Log-off Website	\N	\N	23	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Order Verification	\N	\N	35	Standard
113	2017-11-09 16:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	CAWorld
113	2017-11-12 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74	Standard
114	2017-11-12 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75	Standard
115	2016-05-04 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	76	Standard
200	2017-11-12 10:59:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77	Standard
119	2016-05-03 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	9	Standard
113	2017-11-12 10:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10	Standard
114	2016-05-03 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11	Standard
115	2016-05-04 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12	Standard
113	2017-11-12 10:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13	Standard
114	2016-05-03 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14	Standard
115	2016-05-04 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	16	Standard
114	2016-05-03 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	17	Standard
115	2016-05-04 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	18	Standard
1.2.24	2017-11-12 10:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19	Standard
112	2017-11-12 10:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21	Standard
114	2017-11-12 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22	Standard
114	2017-11-12 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	2	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	1	Standard
1.2.24	2017-11-12 10:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3	Color Coded
112	2017-11-12 10:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4	Color Coded
115	2016-05-04 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	5	Color Coded
117	2016-05-03 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	6	Color Coded
118	2016-05-04 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	7	Color Coded
118	2016-05-02 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	8	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26	Color Coded
114	2016-05-03 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27	Color Coded
115	2016-05-04 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	No Address Entered	\N	\N	29	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	No Address Entered	\N	\N	30	Color Coded
115	2016-05-04 20:40:07	0	\N	Pass	No Address Entered	\N	\N	31	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	One Promo Code per order	\N	\N	32	Color Coded
114	2016-05-03 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	33	Color Coded
115	2016-05-04 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	34	Color Coded
114	2016-05-03 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	42	Color Coded
115	2016-05-04 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	43	Color Coded
117	2016-05-04 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44	Color Coded
118	2016-05-04 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45	Color Coded
114	2016-05-03 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	47	Color Coded
115	2016-05-04 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	48	Color Coded
117	2016-05-03 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49	Color Coded
118	2016-05-04 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50	Color Coded
113	2017-11-12 10:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51	Color Coded
114	2016-05-03 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52	Color Coded
113	2017-11-12 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37	Color Coded
114	2016-05-03 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54	Color Coded
113	2017-11-12 10:59:00	0	\N	Fail	Search for Items	\N	\N	55	Color Coded
114	2016-05-03 20:40:09	0	\N	Pass	Search for Items	\N	\N	56	Color Coded
117	2016-05-03 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57	Color Coded
118	2016-05-04 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60	Color Coded
115	2016-05-04 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63	Color Coded
115	2016-05-04 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64	Color Coded
1.2.24	2017-11-12 10:59:00	1	\N	Pass	Tracking Information	\N	\N	65	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Tracking Information	\N	\N	66	Color Coded
119	2016-05-01 02:40:00	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	\N	CAWorld
114	2017-11-12 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	2	Standard
1.2.24	2017-11-12 10:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3	Standard
112	2017-11-12 10:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4	Standard
115	2016-05-04 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	5	Standard
117	2016-05-03 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	6	Standard
118	2016-05-04 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	7	Standard
118	2016-05-02 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	8	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26	Standard
114	2016-05-03 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27	Standard
115	2016-05-04 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28	Standard
113	2017-11-12 10:59:00	0	\N	Pass	No Address Entered	\N	\N	29	Standard
114	2017-11-12 10:59:00	0	\N	Pass	No Address Entered	\N	\N	30	Standard
115	2016-05-04 20:40:07	0	\N	Pass	No Address Entered	\N	\N	31	Standard
113	2017-11-12 10:59:00	0	\N	Pass	One Promo Code per order	\N	\N	32	Standard
114	2016-05-03 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	33	Standard
115	2016-05-04 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	34	Standard
114	2016-05-03 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	42	Standard
115	2016-05-04 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	43	Standard
114	2016-05-01 02:40:00	0	\N	Pass	Invalid Promo Code	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	Invalid Promo Code	\N	\N	\N	CAWorld
1.2.24	2017-11-09 16:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	\N	CAWorld
112	2017-11-09 16:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	CAWorld
201	2017-11-12 10:59:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78	Standard
1.2.24	2017-11-09 16:59:00	1	\N	Pass	Tracking Information	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Tracking Information	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Fail	Tracking Information	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	\N	CAWorld
114	2016-05-01 10:14:00	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	\N	CAWorld
114	2016-05-02 02:40:00	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	Validate Email Address - Permissions	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	Validate website must be available 24x7	\N	\N	\N	CAWorld
117	2016-05-01 02:40:00	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	CAWorld
118	2016-05-02 02:40:00	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	CAWorld
118	2016-04-30 02:40:00	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	CAWorld
200	2017-11-12 10:59:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77	Color Coded
201	2017-11-12 10:59:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78	Color Coded
202	2017-11-12 10:59:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79	Color Coded
119	2016-05-03 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	9	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10	Color Coded
114	2016-05-03 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11	Color Coded
115	2016-05-04 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	16	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	Order Verification	\N	\N	36	Standard
113	2017-11-12 10:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53	Standard
114	2017-11-12 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39	Standard
114	2017-11-12 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41	Standard
112	2017-11-12 10:59:00	0	\N	Fail	Log-off Website	\N	\N	24	Standard
115	2016-05-04 20:40:02	0	\N	Pass	Log-off Website	\N	\N	25	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Order Verification	\N	\N	35	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	Order Verification	\N	\N	36	Color Coded
113	2017-11-12 10:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53	Color Coded
114	2017-11-12 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38	Color Coded
113	2017-11-12 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39	Color Coded
114	2017-11-12 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41	Color Coded
112	2017-11-12 10:59:00	0	\N	Fail	Log-off Website	\N	\N	24	Color Coded
115	2016-05-04 20:40:02	0	\N	Pass	Log-off Website	\N	\N	25	Color Coded
114	2017-11-09 16:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	CAWorld
1.2.24	2017-11-09 16:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	\N	CAWorld
112	2017-11-09 16:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	CAWorld
1.2.24	2017-11-09 16:59:00	1	\N	Pass	Log-off Website	\N	\N	\N	CAWorld
117	2016-05-04 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44	Standard
115	2016-05-04 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	18	Color Coded
1.2.24	2017-11-12 10:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19	Color Coded
112	2017-11-12 10:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20	Color Coded
118	2016-05-04 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Promo Code GUI	\N	\N	46	Standard
114	2016-05-03 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	47	Standard
115	2016-05-04 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	48	Standard
117	2016-05-03 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49	Standard
118	2016-05-04 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50	Standard
113	2017-11-12 10:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51	Standard
114	2016-05-03 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37	Standard
114	2016-05-03 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Search for Items	\N	\N	55	Standard
114	2016-05-03 20:40:09	0	\N	Pass	Search for Items	\N	\N	56	Standard
117	2016-05-03 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57	Standard
118	2016-05-04 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59	Standard
114	2017-11-12 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60	Standard
115	2016-05-04 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61	Standard
113	2017-11-12 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62	Standard
114	2017-11-12 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63	Standard
115	2016-05-04 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64	Standard
1.2.24	2017-11-12 10:59:00	1	\N	Pass	Tracking Information	\N	\N	65	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Tracking Information	\N	\N	66	Standard
114	2017-11-12 10:59:00	0	\N	Fail	Tracking Information	\N	\N	67	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68	Standard
114	2016-05-04 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70	Standard
202	2017-11-12 10:59:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79	Standard
114	2017-11-12 10:59:00	0	\N	Fail	Tracking Information	\N	\N	67	Color Coded
114	2016-05-03 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73	Standard
113	2017-11-12 10:59:00	0	\N	Pass	Promo Code GUI	\N	\N	46	Color Coded
114	2016-05-03 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14	Color Coded
115	2016-05-04 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15	Color Coded
114	2016-05-03 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	17	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21	Color Coded
114	2016-05-04 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71	Standard
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72	Standard
113	2017-11-20 09:35:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	Check Invoice Creation	\N	\N	\N	Summer
1.2.24	2017-11-20 09:35:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	\N	Summer
112	2017-11-20 09:35:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	Summer
115	2016-01-31 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	Summer
117	2016-01-30 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	Summer
118	2016-01-31 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	\N	Summer
118	2016-01-29 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	Summer
119	2016-01-30 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68	Color Coded
114	2016-05-04 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69	Color Coded
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70	Color Coded
114	2016-05-04 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71	Color Coded
113	2017-11-12 10:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72	Color Coded
114	2016-05-03 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73	Color Coded
113	2017-11-12 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74	Color Coded
114	2017-11-12 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75	Color Coded
115	2016-05-04 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	76	Color Coded
115	2016-05-02 02:40:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	\N	CAWorld
114	2016-01-30 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
115	2016-01-31 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
114	2016-01-30 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
115	2016-01-31 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Invalid Promo Code	\N	\N	\N	Summer
114	2016-01-30 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	\N	Summer
115	2016-01-31 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	\N	Summer
1.2.24	2017-11-20 09:35:00	2	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
112	2017-11-20 09:35:00	0	\N	Fail	Log-in to Secured Website	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	Summer
1.2.24	2017-11-20 09:35:00	1	\N	Pass	Log-off Website	\N	\N	\N	Summer
112	2017-11-20 09:35:00	0	\N	Fail	Log-off Website	\N	\N	\N	Summer
115	2016-01-31 20:40:02	0	\N	Pass	Log-off Website	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	Summer
114	2016-01-30 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	Summer
115	2016-01-31 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
115	2016-01-31 20:40:07	0	\N	Pass	No Address Entered	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	One Promo Code per order	\N	\N	\N	Summer
114	2016-01-30 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	\N	Summer
115	2016-01-31 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Order Verification	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	Order Verification	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
114	2016-01-30 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
115	2016-01-31 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	Summer
117	2016-01-31 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	Summer
118	2016-01-31 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Promo Code GUI	\N	\N	\N	Summer
114	2016-01-30 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	\N	Summer
115	2016-01-31 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	\N	Summer
117	2016-01-30 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	\N	Summer
118	2016-01-31 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	\N	Summer
113	2017-11-20 09:35:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	\N	Summer
114	2016-01-30 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	\N	Summer
114	2016-01-30 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Search for Items	\N	\N	\N	Summer
114	2016-01-30 20:40:09	0	\N	Pass	Search for Items	\N	\N	\N	Summer
117	2016-01-30 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	Summer
118	2016-01-31 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
115	2016-01-31 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
115	2016-01-31 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	Summer
1.2.24	2017-11-20 09:35:00	1	\N	Pass	Tracking Information	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Tracking Information	\N	\N	\N	Summer
114	2016-05-01 02:40:00	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Pass	Priority Shipping GUI	\N	\N	\N	CAWorld
114	2017-11-20 09:35:00	0	\N	Fail	Tracking Information	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	\N	Summer
114	2016-01-31 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	\N	Summer
114	2016-01-31 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	\N	Summer
114	2016-01-30 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	\N	Summer
113	2017-11-20 09:35:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	Summer
114	2017-11-20 09:35:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	\N	Summer
115	2016-01-31 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	\N	Summer
200	2017-11-20 09:35:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	\N	Summer
201	2017-11-20 09:35:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	\N	Summer
202	2017-11-20 09:35:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	\N	Summer
114	2017-11-09 16:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	\N	CAWorld
112	2017-11-09 16:59:00	0	\N	Fail	Log-off Website	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Pass	Log-off Website	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	No Address Entered	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Pass	No Address Entered	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Pass	No Address Entered	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	One Promo Code per order	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	One Promo Code per order	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	One Promo Code per order	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Order Verification	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Pass	Order Verification	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	\N	CAWorld
117	2016-05-02 02:40:00	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	CAWorld
118	2016-05-01 10:14:00	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Promo Code GUI	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	Promo Code GUI	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Fail	Promo Code GUI	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Fail	Search for Items	\N	\N	\N	CAWorld
117	2016-05-01 02:40:00	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	\N	CAWorld
118	2016-05-02 02:40:00	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	\N	CAWorld
114	2016-05-01 02:40:00	0	\N	Pass	Search for Items	\N	\N	\N	CAWorld
117	2016-05-01 02:40:00	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	CAWorld
118	2016-05-02 02:40:00	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	CAWorld
115	2016-05-02 02:40:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	\N	CAWorld
113	2017-11-09 16:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	CAWorld
114	2017-11-09 16:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	\N	CAWorld
\.


--
-- Data for Name: testcasestep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcasestep (expectedresult, input, stepindex, testcase, listing_order, dataset) FROM stdin;
My account home page	Login to Shopping Site	0	Purchase One Item	1	Standard
Displayed Search results	Search for items	1	Purchase One Item	2	Standard
Checked Item	Select one item for purchase	2	Purchase One Item	3	Standard
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4	Standard
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5	Standard
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6	Standard
Displayed Search results	Search for items	1	Purchase Multiple Items	7	Standard
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8	Standard
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9	Standard
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10	Standard
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11	Standard
Displayed Search results	Search for items	1	Purchase MAX Items	12	Standard
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13	Standard
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14	Standard
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15	Standard
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16	Standard
Displayed Search results	Search for items	1	Select MAX+1 Items	17	Standard
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18	Standard
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19	Standard
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20	Standard
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21	Standard
Displayed Search results	Search for items	1	GUI - Checkout Button	22	Standard
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23	Standard
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24	Standard
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25	Standard
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26	Standard
My account home page	Login to Shopping Site	0	Purchase One Item	1	Color Coded
Displayed Search results	Search for items	1	Purchase One Item	2	Color Coded
Checked Item	Select one item for purchase	2	Purchase One Item	3	Color Coded
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4	Color Coded
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5	Color Coded
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6	Color Coded
Displayed Search results	Search for items	1	Purchase Multiple Items	7	Color Coded
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8	Color Coded
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9	Color Coded
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10	Color Coded
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11	Color Coded
Displayed Search results	Search for items	1	Purchase MAX Items	12	Color Coded
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13	Color Coded
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14	Color Coded
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15	Color Coded
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16	Color Coded
Displayed Search results	Search for items	1	Select MAX+1 Items	17	Color Coded
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18	Color Coded
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19	Color Coded
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20	Color Coded
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21	Color Coded
Displayed Search results	Search for items	1	GUI - Checkout Button	22	Color Coded
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23	Color Coded
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24	Color Coded
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25	Color Coded
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26	Color Coded
My account home page	Login to Shopping Site	0	Purchase One Item	\N	CAWorld
Displayed Search results	Search for items	1	Purchase One Item	\N	CAWorld
Checked Item	Select one item for purchase	2	Purchase One Item	\N	CAWorld
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	\N	CAWorld
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	\N	CAWorld
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	\N	CAWorld
Displayed Search results	Search for items	1	Purchase Multiple Items	\N	CAWorld
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	\N	CAWorld
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	\N	CAWorld
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	\N	CAWorld
My Home Page	Login to Shopping Site	0	Purchase MAX Items	\N	CAWorld
Displayed Search results	Search for items	1	Purchase MAX Items	\N	CAWorld
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	\N	CAWorld
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	\N	CAWorld
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	\N	CAWorld
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	\N	CAWorld
Displayed Search results	Search for items	1	Select MAX+1 Items	\N	CAWorld
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	\N	CAWorld
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	\N	CAWorld
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	\N	CAWorld
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	\N	CAWorld
Displayed Search results	Search for items	1	GUI - Checkout Button	\N	CAWorld
Checked Item	Select one item for purchase	2	GUI - Checkout Button	\N	CAWorld
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	\N	CAWorld
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	\N	CAWorld
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	\N	CAWorld
My account home page	Login to Shopping Site	0	Purchase One Item	\N	Summer
Displayed Search results	Search for items	1	Purchase One Item	\N	Summer
Checked Item	Select one item for purchase	2	Purchase One Item	\N	Summer
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	\N	Summer
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	\N	Summer
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	\N	Summer
Displayed Search results	Search for items	1	Purchase Multiple Items	\N	Summer
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	\N	Summer
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	\N	Summer
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	\N	Summer
My Home Page	Login to Shopping Site	0	Purchase MAX Items	\N	Summer
Displayed Search results	Search for items	1	Purchase MAX Items	\N	Summer
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	\N	Summer
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	\N	Summer
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	\N	Summer
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	\N	Summer
Displayed Search results	Search for items	1	Select MAX+1 Items	\N	Summer
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	\N	Summer
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	\N	Summer
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	\N	Summer
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	\N	Summer
Displayed Search results	Search for items	1	GUI - Checkout Button	\N	Summer
Checked Item	Select one item for purchase	2	GUI - Checkout Button	\N	Summer
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	\N	Summer
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	\N	Summer
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	\N	Summer
\.


--
-- Data for Name: testfolder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testfolder (name, project, listing_order, dataset) FROM stdin;
Checkout	Shopping Team	1	Standard
Fulfillment	Shopping Team	2	Standard
Login/Authentication	Shopping Team	3	Standard
Order Status	Shopping Team	4	Standard
Shopping	Shopping Team	5	Standard
Checkout	Shopping Team	1	Color Coded
Fulfillment	Shopping Team	2	Color Coded
Login/Authentication	Shopping Team	3	Color Coded
Order Status	Shopping Team	4	Color Coded
Shopping	Shopping Team	5	Color Coded
Checkout	Shopping Team	\N	CAWorld
Fulfillment	Shopping Team	\N	CAWorld
Login/Authentication	Shopping Team	\N	CAWorld
Order Status	Shopping Team	\N	CAWorld
Shopping	Shopping Team	\N	CAWorld
Checkout	Shopping Team	\N	Summer
Fulfillment	Shopping Team	\N	Summer
Login/Authentication	Shopping Team	\N	Summer
Order Status	Shopping Team	\N	Summer
Shopping	Shopping Team	\N	Summer
\.


--
-- Data for Name: testset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testset (description, name, planestimate, ready, schedulestate, project, iteration, release, owner, listing_order, dataset) FROM stdin;
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	1	Standard
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	2	Standard
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	1	Color Coded
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	2	Color Coded
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	\N	CAWorld
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	\N	CAWorld
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Chrome browser
Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	Summer	\N	Test routine for checkout path using Firefox browser
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theme (name, owner, plannedstartdate, plannedenddate, description, displaycolor, investmentcategory, ready, riskscore, valuescore, project, preliminaryestimate, state, listing_order, dataset) FROM stdin;
Revamp online presence	paul@acme.com	2017-10-03 10:59:00	2018-04-03 10:59:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1	Color Coded
Create best in class platform	aaron@acme.com	2017-09-12 10:59:00	2018-05-18 10:59:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	2	Color Coded
Revamp online presence	paul@acme.com	2017-10-03 10:59:00	2018-04-03 10:59:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1	Standard
Create best in class platform	aaron@acme.com	2017-09-12 10:59:00	2018-05-18 10:59:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	2	Standard
Create best in class platform	aaron@acme.com	2017-09-09 06:00:00	2018-05-16 05:59:00	\N	#848689	Strategic Growth	FALSE	5	8	\N	XL	Discovering	\N	CAWorld
Revamp online presence	paul@acme.com	2017-09-30 06:00:00	2018-04-01 05:59:00	\N	#848689	Strategic Growth	FALSE	3	6	\N	L	Developing	\N	CAWorld
Revamp online presence	paul@acme.com	2017-10-11 09:35:00	2018-04-11 09:35:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	\N	Summer
Create best in class platform	aaron@acme.com	2017-09-20 09:35:00	2018-05-26 09:35:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	\N	Summer
\.


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

