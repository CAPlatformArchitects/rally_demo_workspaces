--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: defect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.defect OWNER TO postgres;

--
-- Name: feature; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.feature OWNER TO postgres;

--
-- Name: initiative; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.initiative OWNER TO postgres;

--
-- Name: iteration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.iteration OWNER TO postgres;

--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.release OWNER TO postgres;

--
-- Name: story; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.story OWNER TO postgres;

--
-- Name: task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.task OWNER TO postgres;

--
-- Name: testcase; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.testcase OWNER TO postgres;

--
-- Name: testcaseresult; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.testcaseresult OWNER TO postgres;

--
-- Name: testcasestep; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testcasestep (
    expectedresult text,
    input text,
    stepindex text,
    testcase text,
    listing_order integer
);


ALTER TABLE public.testcasestep OWNER TO postgres;

--
-- Name: testfolder; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE testfolder (
    name text,
    project text,
    listing_order integer
);


ALTER TABLE public.testfolder OWNER TO postgres;

--
-- Name: testset; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.testset OWNER TO postgres;

--
-- Name: theme; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    listing_order integer
);


ALTER TABLE public.theme OWNER TO postgres;

--
-- Data for Name: defect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY defect (name, kanbanstate, schedulestate, owner, requirement, project, iteration, release, planestimate, severity, state, environment, priority, ready, resolution, blocked, blockedreason, description, notes, displaycolor, listing_order) FROM stdin;
Logoff: No warning when user clicks Logout link	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	When the Logout link is clicked, the application should display a message asking whether the user is sure he/she wants to continue logging out.	\N	\N	1
System Performance suffers for constant loads of only 1,000 users	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	The system experiences noticeable degradation in performance for loads of only 1,000 concurrent users.	\N	\N	2
Language Support:  Special Characters	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	3	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Special characters in both Japanese and French are not being displayed properly.	\N	\N	3
Customer is not able to choose Japanese as their display language	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Development	High Attention	FALSE	None	FALSE	\N	Japanese is not appearing in the 'Select Language' drop down.	\N	\N	4
Login 404 Issue	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Closed	Development	Resolve Immediately	FALSE	None	FALSE	\N	Received an Error 404 warning on entrance to the application.	\N	\N	5
Authentication Hyperlink is broken	Accepted	Accepted	\N	\N	Shopping Team	\N	\N	1	Major Problem	Closed	Production	High Attention	FALSE	None	FALSE	\N	Currently, the authentication hyperlink provided to the customer via email is broken.&nbsp; Following the link brings the customer to the homepage, but the customer has not been validated.<br /><br />Steps:<br /> <ul><li>Created a new customer account</li><li>Received an email that contained a hyperlink to complete authentication</li><li>Clicking the link brought me to the homepage of the app</li><li>On login, I had yet to be authenticated so shopping could proceed<br /></li></ul>	\N	\N	6
404 on address page	Accepted	Accepted	\N	\N	Shopping Team	Iteration 3	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	7
Unable to check status of archived orders	Accepted	Accepted	dudley@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	8
Unable to open an order from history	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 2	R1	2	Major Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	9
Found an error when I tried to access my shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	I was taken to the checkout screen prematurely	\N	\N	10
Problem with User Authentication	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Major Problem	Open	Production	Resolve Immediately	FALSE	None	FALSE	\N	More than one customer is reporting that they are being logged off of the system	\N	\N	11
BZ: Could not login to app	Prioritized	Defined	\N	\N	Shopping Team	Iteration 7	R2	5	Major Problem	Open	Staging	High Attention	FALSE	None	FALSE	\N	Customer could not login.	\N	\N	12
Application displays individual shipping costs but total is unchanged	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	The individual estimated shipping costs for each package/destination are displayed, but the Total field only displays the shipping cost for the first destination in the list.&nbsp; Also, once a customer checks out, the total for the entire order only reflects shipping for one destination.	\N	\N	13
Tax totals for split shipping not calculated properly	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	1	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	14
UI for split - need more separation on order sections	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	15
Click on split shipping - nothing displays	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Major Problem	Closed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	16
Priority shipping options not appearing for multiple destinations	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Having a shopping cart that contained 2 items, I chose to ship the items to two different destinations.&nbsp; The individual destination buckets appeared appropriately, however there were no visible priority shipping options for either destination.	\N	\N	17
No warning when MAX destinations has been reached	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Once a customer has elected to ship items to the maximum number of different destinations, the add destination button is disabled, but no warning is displayed explaining why.	\N	\N	18
Too many digits appearing for updated shipping cost	Prioritized	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Total shipping cost should be displayed as '$XXX.XX', but currently the total has 5 digits after the decimal ($23.78352).	\N	\N	19
Package Tracking Notifications are broken	Accepted	Accepted	\N	\N	Fulfillment Team	\N	\N	3	Minor Problem	Closed	Production	Normal	FALSE	None	FALSE	\N	Only one tracking notification is being sent to the customer when they have packages being shipped to multiple destinations.&nbsp; The system should send an email for packages being sent to each destination.	\N	\N	20
Default selection is Express	\N	Defined	\N	\N	Fulfillment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	The default selection for priority shipping is currently Express, it should instead be Ground.	\N	\N	21
Payment by e-Check failing on submit	\N	Defined	\N	\N	Payment Team	\N	\N	1	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Error message indicating 'Gateway 502' problem.	\N	\N	22
No warning when 18digits given for credit card	Prioritized	Defined	\N	\N	Payment Team	\N	\N	5	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Able to add 1 extra digit to credit card input box	\N	\N	23
Browser shows non-validated security key on payment form page	Prioritized	Defined	\N	\N	Payment Team	\N	\N	2	Minor Problem	Open	Production	Normal	FALSE	None	FALSE	\N	Browser prompts to confirm security exception.	\N	\N	24
Only one selected item is being added to the cart	Ready for Acceptance	Completed	daniel@acme.com	Purchase Your Items	Shopping Team	Iteration 6	R2	3	Minor Problem	Fixed	Development	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Logged in as a customer</li><li>Selected multiple items to add to cart at once</li><li>Clicked 'Add to Cart'</li><li>Clicked 'View My Cart'</li><li>Only the first item chosen was actually added to the cart<br /></li></ul>	\N	\N	25
Recurring 'No Address' Warning	Ready for Acceptance	Completed	\N	\N	Shopping Team	\N	\N	3	Minor Problem	Fixed	Staging	Normal	FALSE	None	FALSE	\N	Steps:<br /> <ul><li>Created a new account, but didn't enter an address</li><li>Logged in as the new user, system displayed a message asking for address information</li><li>Enter a valid address and click save</li><li>For every following action within the same shopping session, the system warned that no address information had been entered, even though it was still saved and visible<br /></li></ul>	\N	\N	26
Production Defect in accessing shopping cart	\N	Defined	\N	\N	Shopping Team	\N	\N	2	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	Error 404 - Not Found when trying to navigate to the shopping cart.	\N	\N	27
State drop down doesn't contain any items	Ready for Acceptance	Completed	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Fixed	Development	High Attention	FALSE	None	FALSE	\N	The customer should enter the following shipping information:<br /><br /> <ul><li>Name</li><li>Address</li><li>City</li><li>State (drop down)</li><li>Country (drop down)</li><li>Zip/Country Code</li></ul>	\N	\N	28
Code verification completely broken!	\N	Defined	\N	\N	Shopping Team	\N	\N	3	Crash/Data Loss	Open	Development	Resolve Immediately	FALSE	None	FALSE	\N	The application accepts any 6 character long string as a valid promotional code and applies the maximum discount to the order!<br /><br />Steps:<br /> <ul><li>Logged in as a customer, choose a few items to purchase</li><li>Enter an invalid promotional code (of correct length) in the editable field</li><li>Click update</li><li>Maximum discount is applied to the order</li></ul>This occurs for any codes entered that contain 6 characters.	\N	\N	29
(Auto) Fitnesse Test Failed for GUI - Checkout Button	\N	Defined	daniel@acme.com	Purchase Your Items	Shopping Team	\N	\N	1	Major Problem	Open	Development	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	30
latest Promo Code is invalid.	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 6	R2	\N	Cosmetic	Closed	Development	Low	FALSE	None	FALSE	\N	On the payment screen, the Promo Code field label formatting is incorrect.&nbsp; Currently it is bold and italic, thought it should just be bold to match the rest of the field labels.<br /><br /><i><b>Promo Code</b></i> -&gt; <b>Promo Code</b>	\N	\N	31
(Auto) Fitnesse Test Failed for Calculations	Ready for Dev	Defined	\N	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	Please see Fitnesse Result Logs for more information.	\N	\N	32
Weird formatting -> Totals GUI	\N	Defined	\N	\N	Shopping Team	\N	\N	\N	Cosmetic	Submitted	Staging	Low	FALSE	None	FALSE	\N	The formatting for the totals/costs GUI is distorted.&nbsp; The total cost field is appearing on the very left side of the browser, when it should be beneath all of the other calculation fields on the right side of the browser.	\N	\N	33
Unable to login after entering reset password	Ready for Dev	Defined	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	34
User's password shown in plain text in recovery email	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 5	R2	3	Major Problem	Fixed	Production	Resolve Immediately	FALSE	None	FALSE	\N	\N	\N	\N	35
Button color on checkout page does not match blue hue per design specs	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Cosmetic	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	36
Old font found on contact us page	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 5	R2	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	37
Unable to login after entering invalid password	In Test	In-Progress	dudley@acme.com	\N	Shopping Team	Iteration 6	R2	3	Crash/Data Loss	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	38
"Remember me" cookie not working	Accepted	Accepted	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	2	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	39
Monthly product re-order is duplicating items	In Dev	In-Progress	daniel@acme.com	\N	Shopping Team	Iteration 3	R1	1	Crash/Data Loss	Fixed	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	40
Unable to check status of past orders	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	41
Unable to undelete an order from history	Accepted	Accepted	diane@acme.com	\N	Shopping Team	Iteration 2	R1	2	Minor Problem	Fixed	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	42
302 response code on /api page	Accepted	Accepted	dora@acme.com	\N	API Team	Iteration 6	R2	5	Major Problem	Open	Production	Normal	FALSE	None	FALSE	\N	\N	\N	\N	43
Unable to connect to staging server with 'v2.0' string	Prioritized	Defined	dora@acme.com	\N	API Team	Iteration 6	R2	3	Minor Problem	Open	Staging	Normal	FALSE	None	FALSE	\N	\N	\N	\N	44
CCV codes not being verified on checkout path	Prioritized	Defined	dave@acme.com	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	45
Mastercard not showing in valid CC dropdown list on checkout path	\N	Defined	\N	\N	Payment Team	Iteration 6	R2	3	Major Problem	Open	Production	High Attention	FALSE	None	FALSE	\N	\N	\N	\N	46
\.


--
-- Data for Name: feature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feature (name, investmentcategory, project, owner, parent, release, plannedstartdate, plannedenddate, description, displaycolor, notes, ready, riskscore, valuescore, preliminaryestimate, state, listing_order) FROM stdin;
Support write API	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-10-21 10:59:00	2017-11-24 10:59:00	\N	\N	\N	FALSE	2	0	S	Develop	2
 ========^^^^ R2 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21
Online refunds	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-18 10:59:00	2017-11-27 10:59:00	see business case attached	\N	\N	FALSE	6	6	M	Develop	17
Integrate with Paypal	Short Term Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-27 10:59:00	2017-11-27 10:59:00	see business case attached	\N	\N	FALSE	3	6	M	Develop	18
Integrate with WePay	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-30 10:59:00	2017-12-12 10:59:00	see business case attached	\N	\N	FALSE	6	6	M	Develop	19
Refund management	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-10-27 10:59:00	2017-11-27 10:59:00	see business case attached	\N	\N	FALSE	3	6	M	Develop	20
User Profile	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2017-12-13 10:59:00	2018-01-07 10:59:00	\N	\N	\N	FALSE	2	7	M	Discover	23
Credit card error messaging	None	Payment Team	patricia@acme.com	Minimal online shopping site	R3	\N	\N	\N	\N	\N	FALSE	5	5	S	Propose	24
Product Listings	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R3	2018-01-12 10:59:00	2018-02-06 10:59:00	\N	\N	\N	FALSE	7	10	M	Propose	25
Realtime chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R3	2017-12-16 10:59:00	2018-01-25 10:59:00	\N	\N	\N	FALSE	3	5	S	Discover	26
Shopping preferences	Strategic Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-10-27 10:59:00	2017-12-12 10:59:00	\N	\N	\N	FALSE	5	0	L	Develop	27
Implement Fraud Detection	Strategic Growth	Payment Team	patricia@acme.com	Minimal online shopping site	R3	2017-12-25 10:59:00	2018-01-31 10:59:00	see business case attached	\N	\N	FALSE	5	6	XL	Develop	28
 ========^^^^ R3 ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29
Order purchase API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-10-18 10:59:00	2017-12-05 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	1	8	L	Discover	40
 ========^^^^ UNSCHED ^^^^========	None	Consumer Site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43
Security layer for read-write API	None	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-17 10:59:00	2017-12-05 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	1	8	S	Discover	42
Knowledgebase	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-09-01 10:59:00	2017-09-29 10:59:00	\N	\N	\N	FALSE	6	1	L	Done	45
Cross sell related products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-21 10:59:00	2017-12-05 10:59:00	\N	\N	\N	FALSE	6	3	M	Propose	33
Homepage	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-22 10:59:00	2017-10-17 10:59:00	\N	\N	\N	FALSE	5	7	L	Internal Release	46
Product purchase confirmation	Strategic Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-08-29 10:59:00	2017-10-08 10:59:00	\N	\N	\N	FALSE	4	3	XL	Done	47
Returned shipments	Strategic Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R1	2017-08-29 10:59:00	2017-10-08 10:59:00	\N	\N	\N	\N	\N	\N	\N	Develop	48
Search for products	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-09-16 10:59:00	2017-09-29 10:59:00	\N	\N	\N	FALSE	0	5	M	Open Beta	49
Purchase path	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-10-18 10:59:00	2017-12-06 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	8	8	L	Discover	10
Allow user to vote on products	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-01 10:59:00	2017-11-17 10:59:00	\N	\N	\N	FALSE	2	4	L	Discover	34
Integrate with Amex Gateway	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	5	6	XL	Discover	35
Support cash/check by mail	None	Payment Team	patricia@acme.com	Minimal online shopping site	\N	\N	\N	see business case attached	\N	\N	FALSE	5	6	\N	Propose	36
Duplcate order fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	L	Discover	38
Saving profile	Maintenance	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-10-24 10:59:00	2017-11-12 10:59:00	\N	\N	\N	FALSE	2	0	M	Develop	4
Online chat support	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-10-21 10:59:00	2017-11-30 10:59:00	\N	\N	\N	FALSE	5	3	M	Develop	5
Backorder fulfillment	None	Fulfillment Team	pam@acme.com	Minimal online shopping site	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37
Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-18 10:59:00	2017-12-12 10:59:00	\N	\N	\N	FALSE	1	9	M	Develop	7
Shopping Cart	Cost Savings	Shopping Team	peter@acme.com	Minimal online shopping site	R2	2017-11-02 10:59:00	2017-11-27 10:59:00	<p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f">Build a shopping cart module to select items for eventual purchase. Provide basic navigation and shopping cart capabilities to mark items for purchase. Upon checkout, the Online Store will calculate a total for the order, including shipping and handling charges and the associated taxes, as applicable.&nbsp; The following payment options should be provided:</span></p><p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0b1c8cea2"><img src="https://lh5.googleusercontent.com/R-2ZX8gA5GTrG8A2OzIRpBjUFx6_RNRSVoZQxOvo7gSmeP4Wjp6eIkWdOcv0s05-zf6Hm_L4OEfJLpvmjqiEUdC_b-bW-Xo9JkCqTFdYywCJvEueazAj3EfDrTxXUdGCpcAQeHM" width="500px;" height="138px;" class="CToWUd rally-rte-class-047830fe9" /></span></p><p class="rally-rte-class-03cb47fb2">High-level functionality is expected to include:</p><ul><li>Intake items from the Online Store Search &amp; Browse functions</li><li>Viewing Recent Purchases to encourage repeat purchases</li><li>Persisting the Shopping Cart content between sessions</li><li>Clear calls to action for Purchasing Items</li><li>Reasonable scalability for initial roll-out and early growth (TBD)</li></ul>	\N	\N	FALSE	3	8	M	Develop	1
Credit card payments	Cost Savings	Payment Team	patricia@acme.com	Minimal online shopping site	R2	2017-10-27 10:59:00	2017-12-03 10:59:00	see business case attached	\N	\N	FALSE	3	6	L	Validate	9
Priority shipping	Short Term Growth	Fulfillment Team	pam@acme.com	Minimal online shopping site	R2	2017-11-02 10:59:00	2017-11-30 10:59:00	\N	\N	\N	FALSE	7	5	L	Develop	11
Order Status 2.0	Strategic Growth	Shopping Team	peter@acme.com	Modernize customer service portal	R2	2017-10-24 10:59:00	2017-11-27 10:59:00	\N	\N	\N	FALSE	4	7	M	Develop	12
Rearchitect User Management	Strategic Growth	API Team	aaron@acme.com	Modernize customer service portal	R2	2017-11-05 10:59:00	2017-12-06 10:59:00	\N	\N	\N	FALSE	4	5	S	Discover	13
Creation of cart	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-02 10:59:00	2017-12-12 10:59:00	\N	\N	\N	FALSE	1	0	M	Develop	14
Special Offers	Short Term Growth	Shopping Team	peter@acme.com	Personalized online shopping experience	R2	2017-11-11 10:59:00	2017-12-09 10:59:00	\N	\N	\N	FALSE	3	14	M	Develop	15
Shopping history	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R2	2017-10-18 10:59:00	2017-12-09 10:59:00	\N	\N	\N	FALSE	4	0	L	Develop	16
API for Shipping	Strategic Growth	API Team	aaron@acme.com	Create a read-only API	R3	\N	\N	\N	\N	\N	FALSE	5	1	L	Propose	22
Provide public API to support 3rd party integrations	Strategic Growth	API Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-21 10:59:00	2017-12-12 10:59:00	<span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Allow 3rd party integrators to access our data.</span>	\N	\N	FALSE	3	3	L	Discover	30
Realtime notifications	Strategic Growth	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-11-21 10:59:00	2017-12-12 10:59:00	All users should be able to easily login, logout, and safely store their relevant information with us<br /><br />Acceptance Criteria <ul> <li>Login requires username in email format and password</li> <li>One-click logout</li> <li>Logout provides link to login again</li> <li><b>Non-functional: https data transfer</b></li> <li><b>Non-functional: passwords stored encrypted in database</b></li> </ul>	\N	\N	FALSE	6	20	L	Develop	6
Outbound SMS messages for support case updates	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-27 10:59:00	2017-11-12 10:59:00	\N	\N	\N	FALSE	3	5	M	Develop	8
Integrate with coupon.com site to match *popular* items in shopping cart	Cost Savings	API Team	aaron@acme.com	Integrate social into shopping experience	R2	2017-10-18 10:59:00	2017-11-21 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	1	8	L	Discover	39
Order history API	Strategic Growth	API Team	aaron@acme.com	Build read-write API for handling orders	R2	2017-11-01 10:59:00	2017-11-28 10:59:00	<span class="rally-rte-class-0fdfe95d069988">Coupons.com is a premier supplier of coupons.</span>  <div class="rally-rte-class-0355e3c0ca0a138"><br class="rally-rte-class-0655ac2f5dd0ba8" /></div> <div class="rally-rte-class-0355e3c0ca0a138">Match popular coupons with features in the users' cart.</div>	\N	\N	FALSE	1	8	M	Discover	41
Purchase single product	Short Term Growth	Shopping Team	peter@acme.com	Minimal online shopping site	R1	2017-08-23 10:59:00	2017-10-02 10:59:00	\N	\N	\N	FALSE	13	10	M	Open Beta	44
Provide link to twitter so users can tweet about products they are researching.	Short Term Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-10-25 10:59:00	2017-11-17 10:59:00	\N	\N	\N	FALSE	3	3	M	Discover	31
Suggest products purchased by friends	Strategic Growth	Shopping Team	peter@acme.com	Integrate social into shopping experience	R2	2017-11-28 10:59:00	2017-12-12 10:59:00	\N	\N	\N	FALSE	1	5	XL	Discover	32
Archive packing slips	Strategic Growth	Fulfillment Team	pam@acme.com	Personalized online shopping experience	R1	2017-08-29 10:59:00	2017-10-08 10:59:00	\N	\N	\N	FALSE	3	4	M	Done	50
Extended Email-to-case integration	Cost Savings	API Team	aaron@acme.com	Maintain legacy purchasing system	R2	2017-10-24 10:59:00	2017-11-30 10:59:00	\N	\N	\N	FALSE	12	4	M	Develop	3
\.


--
-- Data for Name: initiative; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY initiative (name, plannedstartdate, plannedenddate, parent, description, displaycolor, investmentcategory, notes, ready, riskscore, valuescore, project, state, owner, listing_order) FROM stdin;
Minimal online shopping site	2017-09-22 10:59:00	2018-01-22 10:59:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	3	8	Consumer Site	Build	rachel@acme.com	1
Build read-write API for handling orders	2017-09-17 10:59:00	2017-12-01 10:59:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	8	8	Platform	Build	aaron@acme.com	2
Personalized online shopping experience	2017-08-23 10:59:00	2018-02-06 10:59:00	Revamp online presence	\N	\N	Short Term Growth	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	3
Modernize customer service portal	2017-08-23 10:59:00	2018-01-07 10:59:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	1	3	Consumer Site	Build	rachel@acme.com	4
Maintain legacy purchasing system	2017-10-22 10:59:00	2018-01-01 10:59:00	Revamp online presence	\N	\N	Cost Savings	\N	FALSE	8	1	Consumer Site	Build	rachel@acme.com	5
Re-build primary web app to use API	2017-10-08 10:59:00	2017-12-31 10:59:00	Create best in class platform	\N	\N	Cost Savings	\N	FALSE	13	3	Platform	Prioritize	aaron@acme.com	6
Integrate in-store and online experience	2017-10-17 10:59:00	2018-03-08 10:59:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	8	13	Consumer Site	Prioritize	rachel@acme.com	7
Integrate into Facebook	2017-10-02 10:59:00	2017-12-31 10:59:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	2	3	Consumer Site	Prioritize	rachel@acme.com	8
Integrate social into shopping experience	2017-10-08 10:59:00	2018-01-30 10:59:00	Revamp online presence	\N	\N	Strategic Growth	\N	FALSE	3	5	Consumer Site	Prioritize	rachel@acme.com	9
Create a read-only API	2017-10-17 10:59:00	2017-12-31 10:59:00	Create best in class platform	Business Case <div><br /></div> <div><br /></div> <div>Read-only API enables integrations with Google....</div>	\N	Short Term Growth	\N	FALSE	3	8	Platform	Business Case	aaron@acme.com	10
Consolidate databases	2017-10-26 10:59:00	2018-03-01 10:59:00	Create best in class platform	\N	\N	Strategic Growth	\N	FALSE	1	1	Platform	Prioritize	aaron@acme.com	11
\.


--
-- Data for Name: iteration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY iteration (project, name, startdate, enddate, plannedvelocity, state, theme, notes, listing_order) FROM stdin;
Shopping Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	40	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	45
Fulfillment Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	22
Consumer Site	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	12
Fulfillment Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	13
Online Store	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	14
Payment Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	15
Reseller Portal Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	43
Payment Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	33
Reseller Site	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	44
Reseller Portal Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	16
Reseller Site	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	17
Shopping Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	12	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	18
Analytics Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	19
API Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	20
Consumer Site	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	21
Consumer Site	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	68
API Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	77
Reseller Site	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	64
Shopping Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	40	Planning	<ul><li>Hardening for OM</li></ul>	\N	65
Fulfillment Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	69
Online Store	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	70
Payment Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	71
Online Store	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	23
Reseller Portal Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	25
Platform	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	72
Consumer Site	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	78
Reseller Site	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	26
Shopping Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	25	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	27
Consumer Site	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	48
Consumer Site	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	3
Payment Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	81
Platform	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	82
Reseller Portal Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	83
Reseller Site	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	84
Shopping Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	85
Analytics Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	86
API Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	87
Consumer Site	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	88
Fulfillment Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	89
Online Store	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	90
Payment Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	91
Platform	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	92
Reseller Portal Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	93
Reseller Site	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Custom Ordering</li></ul>	\N	94
Shopping Team	Iteration 10	2017-12-27 11:23:00	2018-01-09 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	95
Reseller Portal Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	103
Reseller Site	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	104
Shopping Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	105
Analytics Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	106
API Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	107
Consumer Site	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	108
Fulfillment Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	109
Online Store	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	110
Payment Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	111
Platform	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	112
Reseller Portal Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	113
Reseller Site	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	114
Shopping Team	Iteration 12	2018-01-24 11:23:00	2018-02-06 11:23:00	20	Planning	<ul><li>Order Experience 2.0</li></ul>	\N	115
Medical Records App	Iteration 4 - New Patients	2017-11-01 11:23:00	2017-11-14 11:23:00	8	Committed	New patients	\N	116
Medical Records App	Iteration 5 - User Administration	2017-11-15 11:23:00	2017-11-28 11:23:00	8	Planning	User administration	\N	117
Consumer Site	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	30
Reseller Portal Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	73
Reseller Site	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	74
Shopping Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	75
Fulfillment Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	4
Platform	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	102
Analytics Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	76
Online Store	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	50
Online Store	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	5
Payment Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	6
Shopping Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	12	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	9
Analytics Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	10
API Team	Iteration 2	2017-09-06 11:23:00	2017-09-19 11:23:00	10	Accepted	<ul><li>Shop for Items</li><li>Start Shipping functionality</li><li>Purchase your Items - Part 1</li></ul>	\N	11
Payment Team	Iteration 3	2017-09-20 11:23:00	2017-10-03 11:23:00	12	Accepted	<ul><li>Be able to Ship an Order</li><li>Provide Credit Card support</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Gigi, <b>Scribe:</b> Sara</i>)<br /><br /><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul><li>Align standup start time with Sara's bus schedule.</li><li>Improve test coverage from 8% to 12%</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><br /> <ul> <li><i>None.</i></li> </ul>	24
Analytics Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	96
API Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	97
Analytics Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	28
Reseller Portal Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	7
Consumer Site	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	98
Analytics Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	46
Analytics Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	56
Analytics Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	66
API Team	Iteration 8	2017-11-29 11:23:00	2017-12-12 11:23:00	22	Planning	<ul><li>Similar Products</li></ul>	\N	67
Analytics Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	1
API Team	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	2
Fulfillment Team	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	79
Online Store	Iteration 9	2017-12-13 11:23:00	2017-12-26 11:23:00	20	Planning	<ul><li>Personal Shopping Assistant</li></ul>	\N	80
API Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	57
Fulfillment Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	99
Online Store	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	100
Payment Team	Iteration 11	2018-01-10 11:23:00	2018-01-23 11:23:00	20	Planning	<ul><li>Enhanced notifications</li></ul>	\N	101
Reseller Portal Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	63
API Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	47
Fulfillment Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	49
Payment Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	51
Platform	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	52
API Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	29
Reseller Portal Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	53
Reseller Site	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	20	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	54
Shopping Team	Iteration 6	2017-11-01 11:23:00	2017-11-14 11:23:00	40	Committed	<ul><li>Be able to complete the purchase</li><li>Be able to search for an item</li><li>Spikes</li></ul>	\N	55
Consumer Site	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	58
Online Store	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	32
Reseller Site	Iteration 1	2017-08-23 11:23:00	2017-09-05 11:23:00	10	Accepted	<ul><li>Be able to Log-in and Log-off</li><li>Security implemented</li></ul>	\N	8
Reseller Site	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	35
Fulfillment Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	31
Reseller Portal Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	20	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	34
Fulfillment Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	59
Online Store	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	60
Payment Team	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	61
Platform	Iteration 7	2017-11-15 11:23:00	2017-11-28 11:23:00	22	Planning	<ul><li>Hardening for OM</li></ul>	\N	62
Shopping Team	Iteration 4	2017-10-04 11:23:00	2017-10-17 11:23:00	25	Accepted	<ul><li>Hardening for ML</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> Paul, <b>Scribe:</b> John</i>)<br /><br /> <b>Appreciations</b><ul><li>Sara appreciated Susan for pair programming.</li><li>David appreciated John for attending standsups on-time.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i><ul> <li>Improve test coverage from 12% to 20%</li> <li>Add standup question 'What new information have we learned?'</li> <li>Learn Ruby as primary scripting lang</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Work with QA to move a team member into the dev area</li> <li>Request Agile Coach for Agile tune up</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>None.</li> </ul>	36
Analytics Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	37
API Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	38
Consumer Site	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	39
Online Store	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	41
Payment Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	18	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b> <ul> <li>Paul appreciated John for helping with Ruby.</li> </ul> <b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i>  <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li> <li>Switch from cruise control to jenkins.</li> </ul> <b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i> <ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul> <b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i> <ul> <li>Not enough professional development offered to team</li> <li>Weather in California is too nice to work indoors.</li> </ul>	42
Fulfillment Team	Iteration 5	2017-10-18 11:23:00	2017-10-31 11:23:00	20	Accepted	<ul><li>Internationalize</li></ul>	<u>Retrospective Notes</u>&nbsp;&nbsp;(<i><b>Facilitator:</b> David, <b>Scribe:</b> Paul</i>)<br /><br /><b>Appreciations</b><ul><li>Paul appreciated John for helping with Ruby.</li></ul><b>Team Control</b>&nbsp;&nbsp;<i>(Create our own reality)</i> <ul> <li>Rule of 3: Three people (PO/Dev/QA) need to be involved in any conversation about requirements.</li><li>Switch from cruise control to jenkins.</li> </ul><b>Team Influence</b>&nbsp;&nbsp;<i>(ASK's of the organization)</i><ul> <li>Can we move off of clearcase?</li> <li>Request User Story writing workshop.</li> </ul><b>Soup</b>&nbsp;&nbsp;<i>(Everything else)</i><ul> <li>Not enough professional development offered to team</li><li>Weather in California is too nice to work indoors.</li> </ul>	40
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY release (project, name, plannedvelocity, releasedate, releasestartdate, state, theme, grossestimateconversionratio, listing_order) FROM stdin;
Online Store	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	1
Shopping Team	R1	40	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	2
Consumer Site	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	3
Online Store	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	21
Reseller Portal Team	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	29
Medical Records App	2.9	8	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	Mobile Access MVF 1.0	1	44
Analytics Team	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	4
API Team	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	5
Fulfillment Team	R1	10	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	6
Reseller Site	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	7
Payment Team	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	8
Reseller Portal Team	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	9
API Team	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	25
Online Store	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	11
Shopping Team	R2	32	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	12
Consumer Site	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	13
Analytics Team	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	14
API Team	R2	35	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	15
Fulfillment Team	R2	25	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	16
Shopping Team	R3	36	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	22
Platform	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	30
Online Store	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	31
Shopping Team	R4	36	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	32
Consumer Site	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	33
Analytics Team	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	34
API Team	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	35
Fulfillment Team	R4	25	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	36
Reseller Site	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	37
Payment Team	R4	20	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	38
Reseller Portal Team	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	39
Platform	R4	\N	2018-04-03 10:59:00	2018-02-07 10:59:00	Planning	MVF 2.0 Launch	1	40
Medical Records App	2.3	10	2017-10-17 10:59:00	2017-08-23 10:59:00	Accepted	Client Profile Setup	1	41
Medical Records App	2.5	8	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	New Patient Administration	1	42
Medical Records App	2.7	8	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Patient Notifications	1	43
Platform	R1	\N	2017-10-17 10:59:00	2017-08-23 10:59:00	Active	Initial Release - On-line catalog<br><br>* Allow login<br>* Apply security<br>* Product viewing functionality<br>* Purchasing<br>* Credit cards	1	10
Reseller Site	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	17
Consumer Site	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	23
Payment Team	R2	25	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	18
Reseller Portal Team	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	19
Platform	R2	\N	2017-12-12 10:59:00	2017-10-18 10:59:00	Active	Second Release - Advanced Purchasing and Shipping<br><br>* Expand purchase functionality<br>* Add shipping<br>* Add search engine<br>* Enhance security	1	20
Analytics Team	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	24
Fulfillment Team	R3	25	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	26
Reseller Site	R3	\N	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	27
Payment Team	R3	20	2018-02-06 10:59:00	2017-12-13 10:59:00	Planning	Personalization and Customization	1	28
\.


--
-- Data for Name: story; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY story (name, schedulestate, kanbanstate, portfolioitem, project, iteration, owner, planestimate, release, description, ready, blocked, blockedreason, displaycolor, notes, listing_order) FROM stdin;
API for Basic Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track a single package, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	1
API for Multi-Site Shipping	Defined	\N	API for Shipping	API Team	Iteration 8	\N	2	R3	For users who want to track multiple packages in a single order, add the ability to see their results from outside systems.	FALSE	FALSE	\N	\N	\N	2
Support USPS Shipping	Defined	\N	API for Shipping	API Team	\N	\N	\N	\N	\N	FALSE	FALSE	\N	\N	\N	3
Copy Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	4
Create Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	5
Delete Shopping Cart	Defined	\N	Creation of cart	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	6
Save Shopping Cart	Accepted	Accepted	Creation of cart	Shopping Team	Iteration 5	diane@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	7
Add error message if credit card number length is &lt; 16	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	tony@acme.com	1	R2	\N	FALSE	FALSE	\N	\N	\N	8
Purchase Multiple Items	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	9
Add order processing status on user profile page	Defined	\N	Credit card payments	Payment Team	\N	\N	13	\N	\N	FALSE	FALSE	\N	\N	\N	10
Add support for Discover card	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	11
Apple Pay	Accepted	Accepted	Credit card payments	Payment Team	Iteration 6	deb@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	12
Batch multiple payments for single transaction	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	7	R2	\N	FALSE	FALSE	\N	\N	\N	13
Change Billing Address	Defined	\N	Credit card payments	Payment Team	\N	\N	\N	\N	As a returning customer, I want to be able to change my billing address.	FALSE	FALSE	\N	\N	\N	14
Change Method of Payment	Defined	\N	Credit card payments	Payment Team	\N	\N	3	\N	A customer should be able to change their method of payment for an order.	FALSE	FALSE	\N	\N	\N	15
Cross check purchases with fraud credit card list	Defined	\N	Credit card payments	Payment Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	16
Demo Support	Defined	Prioritized	Credit card payments	Payment Team	Iteration 7	\N	\N	R2	The demonstration instance of the application should be updated to reflect recent changes.	FALSE	FALSE	\N	\N	\N	17
Design spike	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	18
Generate audit report tempate for annual per-user purchase history.	Defined	\N	Credit card payments	Payment Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	19
Handle out of limit errors on credit card charges	Defined	\N	Credit card payments	Payment Team	Iteration 7	\N	13	R2	\N	FALSE	FALSE	\N	\N	\N	20
Install new 2048bit encryption key	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	dave@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	21
Log unsuccessful payment attempts	Defined	\N	Credit card payments	Payment Team	Iteration 6	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	22
Pay with Points	Defined	\N	Credit card payments	Payment Team	Iteration 6	daphne@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	23
Payment - Supported Credit Cards	Accepted	Accepted	Credit card payments	Payment Team	Iteration 5	deb@acme.com	13	R2	Support a broad range of payment methods consistent with other e-commerce sites - including gift certificates	FALSE	FALSE	\N	\N	\N	24
align email 'importance field to case 'priority' field	Defined	\N	Email-to-case integration	API Team	Iteration 6	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	25
new case creation for case@domain.com	Defined	\N	Email-to-case integration	API Team	Iteration 8	peter@acme.com	5	R3	\N	FALSE	FALSE	\N	\N	\N	26
support case updates by matching subject line in reply emails	Defined	\N	Email-to-case integration	API Team	\N	\N	7	\N	\N	FALSE	FALSE	\N	\N	\N	27
new case creation for case@domain.com	Accepted	Accepted	Extended Email-to-case integration	API Team	Iteration 6	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	28
support case updates by matching subject line in reply emails	Defined	Prioritized	Extended Email-to-case integration	API Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	29
Upgrade to React v0.4	Accepted	Accepted	Homepage	Shopping Team	Iteration 4	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	30
Resolve Performance Issues	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	aaron@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	31
Promotion codes	Accepted	Accepted	Homepage	Shopping Team	Iteration 3	dudley@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	32
configure base drupal server	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	33
enable external api access	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	34
implement cms portal	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	35
Mauna Loa Hardening	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	4	R1	\N	FALSE	FALSE	\N	\N	\N	36
Patch #1 - Mauna Loa	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	2	R1	\N	FALSE	FALSE	\N	\N	\N	37
plugins for external feed management	Accepted	Accepted	Knowledgebase	API Team	Iteration 4	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	38
As a user I would like to create a chat	Accepted	Accepted	Online chat support	API Team	Iteration 4	dudley@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	39
As a user I would like to delete a chat	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	40
As a user I would like to search for chat history	Defined	\N	Online chat support	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	41
Check the Status of Your Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	daniel@acme.com	5	R2	As a customer, I want the status of my order to be presented to me in the form of a simple report that is easily accessed on entrance to the shopping cart.  The report should include details regarding shipping information (tracking numbers and estimated arrival dates), the number of items I purchased (quantity and unit price), as well as the total amount spent.	FALSE	FALSE	\N	\N	\N	42
Combine Orders	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	For multiple orders with the same destination and expected ship dates within 24 hours of each other, the shipping department should combine the orders and ship them as one.	FALSE	FALSE	\N	\N	\N	43
Create Deployment Scripts	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 4	tara@acme.com	3	R1	Create Deployment scripts for the first release	FALSE	FALSE	\N	\N	\N	44
Customizing Product List	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	7	\N	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	45
Order Modification	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	Within 24 hours of the expected shipping date, a customer should be able to modify his/her order with no repercussions.	FALSE	FALSE	\N	\N	\N	46
Provide connection to CSPAN verification service.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	47
Provide failover connection to G5 verification service.	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	diane@acme.com	\N	R2	\N	FALSE	FALSE	\N	\N	\N	48
Return Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	4	\N	A customer should be able to return unwanted or defective items.	FALSE	FALSE	\N	\N	\N	49
Search for Items	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	A user should able to search for items using a keyword.	FALSE	FALSE	\N	\N	\N	50
Send failure logs to CSPAN verification service nightly.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	51
Send success email notification after adding credit card to profile.	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	52
Send user notification upon request for shipment.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	53
Song Streaming	Defined	\N	Order Status 2.0	Shopping Team	Iteration 6	dudley@acme.com	7	R2	<p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">User attempts to stream a song<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Add song to download list<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi Capable?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to Wifi?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wifi connection fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 4g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">4g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Connected to 3g?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">3g connected fast enough?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wait for buffer<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Stream successful<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Music plays<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Return to home screen<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'no connection fast enough available'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Display error 'stream interrupted'<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017"><u></u>&nbsp;<u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Is the phone a Nokia?<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Phone is destroyed<u></u><u></u></span></p><p class="MsoNormal rally-rte-class-0216101cf"><span class="rally-rte-class-01340b017">Wall is destroyed</span></p>	FALSE	FALSE	\N	\N	\N	54
Cancel the Order	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	2	R2	Investigate architecture approaches to order cancellation process.<br /><br /><u>Acceptance Criteria</u>:<ul><li>Order must not be shipped</li><li>credit card refunded</li><li>Fulfillment process reversed</li><li>restocking fee applied</li><li>undo 'cancel' functionality</li></ul><u>Definition of Done</u>:<ul><li>2 POC approaches</li><li>Timebox approach to 8 hours each spike</li><li>Estimate for each approach at task level</li><li>demo simple scenario</li></ul>	FALSE	FALSE	\N	\N	\N	55
Spike: Tax table/calculations	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	\N	\N	The development team should research possible implementations and problems arising from integrating tax calculations into the purchasing system.	FALSE	FALSE	\N	\N	\N	56
Support backorder email notification	Defined	Prioritized	Order Status 2.0	Shopping Team	Iteration 7	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	57
Support out of stock email notification.	Defined	Ready for Dev	Order Status 2.0	Shopping Team	\N	\N	20	\N	\N	FALSE	FALSE	\N	\N	\N	58
Update user profile purchase history upon settlement.	Defined	\N	Order Status 2.0	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	59
Add a single item to an Order	Accepted	Accepted	Order Status 2.0	Shopping Team	Iteration 5	dudley@acme.com	2	R2	\N	FALSE	FALSE	\N	\N	\N	60
2-3 Day Shipping	Defined	Prioritized	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	3	R2	A user should be allowed to select 2-3 day shipping for their order.	FALSE	FALSE	\N	\N	\N	61
Calculate Split Shipping	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	tony@acme.com	7	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	FALSE	\N	\N	\N	62
Data fields for Shipping information	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	2	R2	The customer should enter basic shipping information	FALSE	FALSE	\N	\N	\N	63
Overnight Shipping	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 6	drew@acme.com	2	R2	A user should be allowed to select overnight shipping for their order.	FALSE	FALSE	\N	\N	\N	64
Ship Multi-Site Orders	In-Progress	In Dev	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	1	R2	For orders with multiple shipping destinations, adjust total shipping cost based on each destination and individual package size/weight.	FALSE	TRUE	\N	\N	\N	65
Ship Single-Site Order	Accepted	Accepted	Priority shipping	Fulfillment Team	Iteration 4	\N	5	R2	On completion of a transaction, the shipping department should ship the items to the appropriate destination	FALSE	FALSE	\N	\N	\N	66
Update Shipping System for Each Order	Completed	Ready for Acceptance	Priority shipping	Fulfillment Team	Iteration 6	dawn@acme.com	3	R2	In order to keep all of the shipping information consistent, implement link to our backend shipping system.	FALSE	FALSE	\N	\N	\N	67
Display confirmation code on checkout page	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 4	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	68
Send email receipt	Accepted	Accepted	Product purchase confirmation	Shopping Team	Iteration 3	daniel@acme.com	5	R1	\N	FALSE	FALSE	\N	\N	\N	69
Add CVVC to checkout path	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	dudley@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	70
Combine by amount	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	71
Combine by billing address	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 3	diane@acme.com	\N	R1	\N	FALSE	FALSE	\N	\N	\N	72
Payment - Promotional Codes	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	Once a user has entered a promotional code for an order, the discount should be reflected in the checkout total.	FALSE	FALSE	\N	\N	\N	73
Spike: Purchase Your Items	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	daniel@acme.com	3	R1	As a user I want to store things in my shopping cart and see them next time I am logged in, so I can save an order for payday.<br /><br />Once a user enters an item into their shopping cart, persist that information in their profile so that it is available next time they login.<br /><br /><u>Acceptance Criteria</u>: <ul> <li>User logged in adds to cart, these items stay associated with user until removed or purchased</li> <li>User logs in with items in shopping cart and items before login are added to 'stored' cart</li> <li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li> </ul> <u>Definition of Done</u>: <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	74
Support $50 certificates	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 4	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	75
Support increasing item count within cart	Accepted	Accepted	Purchase single product	Shopping Team	Iteration 2	daniel@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	76
Move Server Room	In-Progress	In Dev	Rearchitect User Management	API Team	Iteration 5	\N	5	R2	In order to provide redundant power and network connections, move to an offsite hosting provider	FALSE	FALSE	\N	\N	\N	77
Move to Oracle	Accepted	Accepted	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	To produce a stable and performant experience for our customers, move to an integrated Oracle database	FALSE	FALSE	\N	\N	\N	78
System should support 10,000 concurrent users	Accepted	Accepted	Rearchitect User Management	API Team	\N	dora@acme.com	3	\N	In order to prepare for company growth, the system should perform appropriately for loads of up to 10,000 concurrent users.	FALSE	FALSE	\N	\N	\N	79
Website must be available 24x7	Completed	Ready for Acceptance	Rearchitect User Management	API Team	Iteration 5	dora@acme.com	3	R2	In order for customers to be able to order any time they want, the website should be available 24 hours a day, 7 days a week.	FALSE	FALSE	\N	\N	\N	80
As a user I would like to clone a profile	Defined	Ready for Dev	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	81
Create a Profile	Accepted	Accepted	Saving profile	Shopping Team	Iteration 5	dudley@acme.com	7	R2	\N	FALSE	FALSE	\N	\N	\N	82
As a user I would like to delete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	83
As a user I would like to save a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	84
As a user I would like to undelete a profile	Defined	\N	Saving profile	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	85
Combine by date	Accepted	Accepted	Search for products	Shopping Team	Iteration 4	daniel@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	86
Combine by shipping address	Accepted	Accepted	Search for products	Shopping Team	Iteration 3	diane@acme.com	2	R1	\N	FALSE	FALSE	\N	\N	\N	87
Add Single Item	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	drew@acme.com	13	R2	\N	FALSE	FALSE	\N	\N	\N	88
Clone contents from previous cart	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	89
Combine Multiple Items	Defined	Prioritized	Shopping Cart	Shopping Team	Iteration 7	\N	1	R2	\N	FALSE	FALSE	\N	\N	\N	90
Customize product list	Defined	Prioritized	Shopping Cart	Fulfillment Team	Iteration 7	\N	\N	R2	The system should tailor product lists to each customer based on preferences and transaction history.	FALSE	FALSE	\N	\N	\N	91
Daily deals	Defined	\N	Shopping Cart	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	92
one-click checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	2	R2	\N	FALSE	FALSE	\N	\N	\N	93
Payment - Gift Certificates	Accepted	Accepted	Shopping Cart	Fulfillment Team	Iteration 5	dawn@acme.com	4	R2	A customer should be able to pay for selected items using a gift certificate.	FALSE	FALSE	\N	\N	\N	94
Recent Purchases View	Defined	Ready for Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	\N	R2	As a user I should be allowed to select overnight shipping for their order so I can pay to get my stuff as fast as possible.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li>User is defaulted to standard First Class USPS shipping</li> <li>User can change shipping options to Overnight (FEDEX)</li> <li>User see's estimated arrival date of order when changing options</li> <li>User sees a the calculated cost of Overnighting before moving to the payment screens</li>   </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Online help docs  updated</li> </ul>	FALSE	FALSE	\N	\N	\N	95
Save cart for future checkout	Defined	\N	Shopping Cart	Shopping Team	\N	\N	5	\N	\N	FALSE	FALSE	\N	\N	\N	96
Shop for Items	Completed	Ready for Acceptance	Shopping Cart	Shopping Team	Iteration 6	dudley@acme.com	7	R2	A customer should be able to browse the list of all available products to find the items they wish to purchase. The system should provide suggestions to the customer based on previous purchases and items currently in his/her shopping cart.	TRUE	FALSE	\N	\N	\N	97
Purchase Your Items	In-Progress	In Dev	Shopping Cart	Shopping Team	Iteration 6	daniel@acme.com	7	R2	<p class="rally-rte-class-03221dadb"><span class="rally-rte-class-0bb795425">As a customer, I want to be able to purchase items online and to be prompted to enter payment information as well as their preferred shipping method and destination, so that I can pay and have my stuff shipped to me.</span><span class="rally-rte-class-0b1c8cea2">&nbsp;&nbsp;</span></p><p class="rally-rte-class-03cb47fb2"><span class="rally-rte-class-04dd18d0f"><img src="https://lh3.googleusercontent.com/yHah82A1dxoT2DitB296WnXCCcUJDzz0QCAVQqBnVSul0QQyXBUoLVJLHGmS8DAzbYO_V8PuQXKPq1qZOggvVFY2u2_WYnQrUi_8_fLdimiqse3_aESN4pOVJzeIa_clOo10QOY" width="243px;" height="44px;" class="CToWUd rally-rte-class-0e6d61dd9" /></span></p><div><b><span class="rally-rte-class-0bd330b21">Acceptance Criteria</span><span class="rally-rte-class-0b1c8cea2">:</span></b></div><ul><li>User logged in adds to cart, these items stay associated with user until removed or purchased</li><li>User logs in with items in shopping cart and items selected before login are added to 'stored' cart</li><li>When user logins in after 7 days of inactivity they are prompted/notified about the items in their 'stored' cart</li></ul><p class="rally-rte-class-03221dadb"><b><span class="rally-rte-class-0bd330b21">Definition of Done</span><span class="rally-rte-class-0b1c8cea2">:</span></b></p><ul><li>Code Checked In</li><li>Unit Tested</li><li>Accept Test Passed</li><li>No Defects</li><li>Accept Tests added to automated framework</li><li>Online help docs updated</li></ul><ul> </ul>	FALSE	TRUE	Test server is down.  IT said it will be back up @ 4pm ET.	\N	\N	98
As a user I would like to delete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	99
As a user I would like to save history	Accepted	Accepted	Shopping history	Shopping Team	Iteration 5	dudley@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	100
As a user I would like to search for history	Defined	\N	Shopping history	Shopping Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	101
As a user I would like to send history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	102
As a user I would like to sort history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	103
As a user I would like to undelete history	Defined	\N	Shopping history	Shopping Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	104
As a user I would like to create preferences	Accepted	Accepted	Shopping preferences	Shopping Team	Iteration 5	diane@acme.com	3	R1	\N	FALSE	FALSE	\N	\N	\N	105
As a user I would like to save prefereneces	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	106
As a user I would like to search for preferences	Defined	\N	Shopping preferences	Shopping Team	\N	\N	5	R3	\N	FALSE	FALSE	\N	\N	\N	107
As a user I would like to reapply for offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	108
As a user I would like to receive offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	\N	R2	\N	FALSE	FALSE	\N	\N	\N	109
As a user I would like to remove offers	Defined	Prioritized	Special Offers	Shopping Team	Iteration 7	\N	4	R2	\N	FALSE	FALSE	\N	\N	\N	110
As a user I would like to subscribe to offers	Defined	Ready for Dev	Special Offers	Shopping Team	Iteration 7	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	111
As a user I would like to delete data	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	5	R2	\N	FALSE	FALSE	\N	\N	\N	112
As a user I would like to post attributes	Accepted	Accepted	Support write API	API Team	Iteration 5	peter@acme.com	3	R2	\N	FALSE	FALSE	\N	\N	\N	113
As a user I would like to post tickets	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	114
As a user I would like to update data	Defined	\N	Support write API	API Team	\N	\N	3	R2	\N	FALSE	FALSE	\N	\N	\N	115
As a user I would like to update tickets	Defined	\N	Support write API	API Team	\N	\N	5	R2	\N	FALSE	FALSE	\N	\N	\N	116
Spike: Basic profile form	Defined	\N	User Profile	Shopping Team	Iteration 8	\N	2	R3	\N	FALSE	FALSE	\N	\N	\N	117
Find My Orders	Defined	\N	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I would like to be emailed with daily updates that contain package tracking information.	FALSE	FALSE	\N	\N	\N	118
Log-in to Secured Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	dudley@acme.com	5	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	119
Log-off Website	Completed	Ready for Acceptance	User Profile	Shopping Team	Iteration 1	daniel@acme.com	4	R1	As a customer, I would like to be able to login to the shopping cart knowing that my personal information is private and secure	FALSE	FALSE	\N	\N	\N	120
Show history of account access.	Defined	\N	User Profile	Shopping Team	\N	\N	3	\N	\N	FALSE	FALSE	\N	\N	\N	121
Validate Customer Contact/Shipping info	Accepted	Accepted	User Profile	Shopping Team	Iteration 6	daniel@acme.com	5	R2	As a customer, I want my email and shipping addresses validated to make me known to the system, and to add another layer of protection against fraud.<br /><br /><u>Acceptance Criteria</u>:  <ul> <li> Email address validated  <ul> <li>validate format</li> <li>email them a message then have them confirm by clicking a link</li> </ul> </li> <li> Check Shipping  <ul> <li>Address must exist validate against USPS DFS2 Validation DB</li> </ul> </li> <li>Perform Validation upon creation/change of info and each order placed</li> </ul> <u>Definition of Done</u>:  <ul> <li>Code Checked In</li> <li>Unit Tested</li> <li>Accept Test Passed</li> <li>No Defects</li> <li>Accept Tests added to automated framework</li> <li>Oneline help docs updated</li> </ul>	FALSE	FALSE	\N	\N	\N	122
View By Order	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	3	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	123
View or Change your One-Click settings	Defined	Ready for Acceptance	User Profile	Shopping Team	Iteration 7	\N	\N	R2	As a customer, I want to be able to view and easily change my One-Click settings.	FALSE	FALSE	\N	\N	\N	124
Search for packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	125
Auto delete packing slips after 6 months	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 2	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	126
Reactivate packing slips	Accepted	Accepted	Archive packing slips	Fulfillment Team	Iteration 1	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	127
Return labels printing first/last name in wrong order.	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	1	R1	\N	FALSE	FALSE	\N	\N	\N	128
Implement barcode tracking for return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 2	\N	5	R1	\N	FALSE	FALSE	\N	\N	\N	129
Apply credits to account from valid return items	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	130
Update warehouse stock counts	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	131
Email notifications upon successful return processing	Accepted	Accepted	Returned shipments	Fulfillment Team	Iteration 1	\N	3	R1	\N	FALSE	FALSE	\N	\N	\N	132
Implement self printed return receipts	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	5	R1	\N	FALSE	\N	\N	\N	\N	133
Show return status on order history page	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	3	R1	\N	FALSE	\N	\N	\N	\N	134
Mobile notification of return status	Defined	\N	Returned shipments	Fulfillment Team	\N	\N	8	R1	\N	FALSE	\N	\N	\N	\N	135
Prescription Administration Updates	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a web site visitor, I want to browse through the inventory of available safaris so that I can pick one that fits my time, budget and interest.	\N	FALSE	\N	\N	\N	136
Physician Chat Environment	Completed	Ready for Acceptance	\N	Medical Records App	Iteration 4 - New Patients	\N	\N	2.5	As a web site visitor, I want to view upcoming safari availability so that I can choose an available date.	\N	FALSE	\N	\N	\N	137
Register for New Patient Service	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	As a safari-taker, I want to sign-up for a Frequent Adventurer Card so I can earn rewards.	\N	TRUE	Test Server Failure	\N	\N	138
Update Patient Records	Accepted	Accepted	\N	Medical Records App	Iteration 4 - New Patients	\N	8	2.5	As a safari-taker, I want to view any pictures taken and be able to order reprints so that I can remember my trip.	\N	FALSE	\N	\N	\N	139
Admin - Accept new patients	In-Progress	In Dev	\N	Medical Records App	Iteration 4 - New Patients	\N	4	2.5	Admin - Accept new patients	\N	FALSE	\N	\N	\N	140
Validate Patient Data for EU Patients	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	3	2.5	\N	\N	\N	\N	\N	\N	141
Support for UK National Insurance Number Format	Defined	Prioritized	\N	Medical Records App	Iteration 5 - User Administration	\N	\N	2.5	\N	\N	\N	\N	\N	\N	142
Physician Application - confirm prescription data	Defined	Prioritized	\N	Medical Records App	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY task (name, workproduct, state, owner, estimate, todo, actuals, blocked, blockedreason, description, displaycolor, ready, taskindex, project, listing_order) FROM stdin;
Link to shipping backend	2-3 Day Shipping	Defined	\N	6	6	\N	FALSE	\N	\N	\N	FALSE	0	\N	1
GUI for shipping options	2-3 Day Shipping	Defined	\N	5	5	\N	FALSE	\N	\N	\N	FALSE	1	\N	2
Run Functional Tests	2-3 Day Shipping	Defined	\N	15	15	\N	FALSE	\N	\N	\N	FALSE	2	\N	3
Write Code	API for Basic Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	0	\N	4
API Test Harnesses	API for Basic Shipping	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	5
Automated Tests	API for Basic Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	6
Run Functional Tests	API for Basic Shipping	Defined	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	3	\N	7
Write Code	API for Multi-Site Shipping	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	0	\N	8
API Test Harnesses	API for Multi-Site Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	9
Run Functional Tests	API for Multi-Site Shipping	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	2	\N	10
Create automated Tests	API for Multi-Site Shipping	Defined	\N	13	13	\N	FALSE	\N	\N	\N	FALSE	3	\N	11
Use Shipping Web Service for Calculation	Calculate Split Shipping	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	12
Filter only company supported shipping options	Calculate Split Shipping	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	13
Automated Tests for Web Services API	Calculate Split Shipping	Completed	\N	13	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	14
Code	Find My Orders	Defined	\N	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	15
Create Automated Tests	Find My Orders	Defined	\N	12	12	\N	FALSE	\N	\N	\N	FALSE	1	\N	16
Code	Data fields for Shipping information	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	17
Create Automated Tests	Data fields for Shipping information	Completed	\N	11	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	18
Doc	Data fields for Shipping information	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	19
adjust stylesheet properties	latest Promo Code is invalid.	Completed	diane@acme.com	8	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	20
fix screenshots in online help	latest Promo Code is invalid.	Completed	diane@acme.com	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	21
Code	Provide failover connection to G5 verification service.	Completed	diane@acme.com	10	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	22
Regression Testing	Provide failover connection to G5 verification service.	Completed	diane@acme.com	15	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	23
Setup new Servers	Move Server Room	Completed	\N	14	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	24
Move Code to new Servers	Move Server Room	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	25
Update SQL	Move to Oracle	Completed	\N	3	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	26
Setup Oracle	Move to Oracle	Completed	\N	1	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	27
Link to shipping backend	Overnight Shipping	In-Progress	\N	7	7	\N	FALSE	\N	\N	\N	FALSE	0	\N	28
GUI for shipping options	Overnight Shipping	Defined	\N	4	4	\N	FALSE	\N	\N	\N	FALSE	1	\N	29
Run Functional Tests	Overnight Shipping	Defined	\N	14	14	\N	FALSE	\N	\N	\N	FALSE	2	\N	30
Database tables for order codes	View By Order	Defined	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	0	\N	31
GUI for order pages	View By Order	Defined	\N	8	8	\N	FALSE	\N	\N	\N	FALSE	1	\N	32
Run Functional Tests	View By Order	Defined	\N	11	11	\N	FALSE	\N	\N	\N	FALSE	2	\N	33
Create automated Tests	View By Order	Defined	\N	2	2	\N	FALSE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	3	\N	34
GUI for Purchase Your Items	Purchase Your Items	Completed	dudley@acme.com	11	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	35
Create Automated Tests	Purchase Your Items	Completed	tara@acme.com	13	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	36
Implement Service Layer	Purchase Your Items	In-Progress	daniel@acme.com	8	8	\N	FALSE	\N	\N	\N	FALSE	3	\N	37
Implement Credit Card Payment Service	Purchase Your Items	In-Progress	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	4	\N	38
Validate GUI design	Purchase Your Items	Defined	diane@acme.com	9	9	\N	FALSE	\N	\N	\N	FALSE	5	\N	39
Run Manual Tests	Purchase Your Items	Defined	tara@acme.com	3	3	\N	TRUE	Test environment down.  IT says it'll be back up by 4pm ET.	<strong>Blocked:</strong> Test environment is down.	\N	FALSE	0	\N	40
Store Data for Recent Purchases	Recent Purchases View	Defined	dudley@acme.com	10	10	\N	FALSE	\N	\N	\N	FALSE	0	\N	41
Validate GUI styles	Recent Purchases View	Defined	dudley@acme.com	13	13	\N	FALSE	\N	\N	\N	FALSE	1	\N	42
GUI for recent items list	Recent Purchases View	Defined	diane@acme.com	5	5	\N	FALSE	\N	\N	\N	FALSE	2	\N	43
Run Functional Tests	Recent Purchases View	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	3	\N	44
UI for splitting order	Ship Multi-Site Orders	In-Progress	\N	9	9	\N	FALSE	\N	\N	\N	FALSE	0	\N	45
Create automated Tests	Ship Multi-Site Orders	In-Progress	\N	6	6	\N	TRUE	\N	<b>I am blocked on this task until dev2 has completed the UI changes I need in order to easily test.</b>	\N	FALSE	1	\N	46
Document Functionality	Ship Multi-Site Orders	In-Progress	\N	2	2	\N	FALSE	\N	\N	\N	FALSE	2	\N	47
Code	Ship Single-Site Order	Completed	\N	5	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	48
Create Automated Tests	Ship Single-Site Order	Completed	\N	0	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	49
Doc	Ship Single-Site Order	Completed	\N	7	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	50
Identify impact on removing order from server cache	Cancel the Order	Defined	\N	1	1	\N	FALSE	\N	\N	\N	FALSE	0	\N	51
Review error conditions from payment gateway	Cancel the Order	Defined	\N	3	3	\N	FALSE	\N	\N	\N	FALSE	1	\N	52
use new api version call	State drop down doesn't contain any items	Completed	dudley@acme.com	4	4	\N	FALSE	\N	\N	\N	FALSE	0	\N	53
replace renderer to show display value instead of internal value	State drop down doesn't contain any items	Completed	dudley@acme.com	13	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	54
Backend Link to Shipping System	Update Shipping System for Each Order	Completed	\N	9	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	55
Update Logic	Update Shipping System for Each Order	Completed	\N	14	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	56
Automated Tests	Update Shipping System for Each Order	Completed	\N	4	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	57
Write front-end validation code	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	12	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	58
Call Web Service for Address Verification	Validate Customer Contact/Shipping info	Completed	dudley@acme.com	8	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	59
Document Validation Functionality	Validate Customer Contact/Shipping info	Completed	daniel@acme.com	10	0	\N	FALSE	\N	\N	\N	FALSE	2	\N	60
Code	Website must be available 24x7	Completed	\N	11	0	\N	FALSE	\N	\N	\N	FALSE	0	\N	61
Create Automated Tests	Website must be available 24x7	Completed	\N	6	0	\N	FALSE	\N	\N	\N	FALSE	1	\N	62
Create Automated Tests	Unable to login after entering invalid password	Defined	tara@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	63
Fix exception handling routing after failed login	Unable to login after entering invalid password	Defined	dudley@acme.com	14	14	\N	FALSE	\N	\N	\N	FALSE	1	\N	64
Run manual FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	20	20	\N	\N	\N	\N	\N	\N	0	\N	65
Run automated FF browser test	Firefox Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	\N	\N	\N	\N	\N	1	\N	66
Run manual Chrome  browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	20	20	\N	\N	\N	\N	\N	\N	0	\N	67
Run automated Chrome browser test	Chrome Browser Tests: Checkout Path	Defined	tara@acme.com	5	5	\N	\N	\N	\N	\N	\N	1	\N	68
\.


--
-- Data for Name: testcase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcase (name, owner, project, testfolder, workproduct, method, description, objective, postconditions, preconditions, priority, ready, risk, type, validationexpectedresult, validationinput, listing_order) FROM stdin;
Calculate shipping costs for multiple destinations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	1
Check Invoice Creation	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	2
Check the Status of Your Orders	tara@acme.com	Shopping Team	Order Status	Check the Status of Your Order	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	3
Validate data fields for Shipping information	tara@acme.com	Shopping Team	\N	Data fields for Shipping information	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	4
Default Shipping - Ground	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	5
GUI - Checkout Button	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Critical	FALSE	Low	Acceptance	\N	\N	6
GUI - Checkout Button for Empty Cart	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Useful	FALSE	Low	Acceptance	\N	\N	7
GUI - Multi-Site Shipping Options	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	8
Invalid Promo Code	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	9
Log-in to Secured Website	tara@acme.com	Shopping Team	Login/Authentication	Log-in to Secured Website	Manual	Verify that entering a correct username/password combo on the login screen grants a user access to the application.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	10
Log-off Website	tara@acme.com	Shopping Team	Login/Authentication	Log-off Website	Manual	Verify that the customer is logged out of the system when they click the 'Logout' link at the top of the screen.	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	11
Max Number of Shipping Destinations	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	12
No Address Entered	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	13
One Promo Code per order	tina@acme.com	Payment Team	\N	Payment - Promotional Codes	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	14
Order Verification	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	15
Order Verification - Backordered Item Handling	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	16
Priority Shipping chosen on a per-package basis	tony@acme.com	Fulfillment Team	\N	Ship Multi-Site Orders	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	17
Priority Shipping GUI	tara@acme.com	Shopping Team	Fulfillment	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	18
Priority Shipping Options for each Destination	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	19
Promo Code GUI	tara@acme.com	Shopping Team	\N	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	20
Purchase MAX Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	21
Purchase Multiple Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	22
Purchase One Item	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test the functionality of the purchase options in the shopping site.	Logoff and clear the browser cache so that no lingering test data gets saved. &nbsp;Reset the account history details in the shopping application.	A browser connection to the shopping site is required. &nbsp;Please ensure that your browser is updated to the latest version for your platform. &nbsp;A registered User ID is also required.	Important	FALSE	Low	Acceptance	An email should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The purchase complete window should list your order details that were purchased.	23
Search for Items	tara@acme.com	Shopping Team	Shopping	Search for Items	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	24
Select MAX+1 Items	tara@acme.com	Shopping Team	Checkout	Purchase Your Items	Manual	\N	To test   the functionality of the purchase options in the shopping site.	Logoff and   clear the browser cache so that no lingering test data gets saved.   &nbsp;Reset the account history details in the shopping application.	A browser   connection to the shopping site is required. &nbsp;Please ensure that your   browser is updated to the latest version for your platform. &nbsp;A   registered User ID is also required.	Important	FALSE	Low	Acceptance	An email   should be sent to your user id&nbsp;summarizing&nbsp;your completed purchase.	The   purchase complete window should list your order details that were purchased.	25
Shipping Address and Billing Address must match	tara@acme.com	Shopping Team	\N	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	26
Shipping Calculations	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	27
System should support 10,000 concurrent users	tara@acme.com	Shopping Team	\N	System should support 10,000 concurrent users	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	28
Tracking Information	tara@acme.com	Shopping Team	Order Status	\N	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	29
Update Total Shipping Cost	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	30
Updated Totals	tony@acme.com	Fulfillment Team	\N	Calculate Split Shipping	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	31
Validate Email Address - Email Authentication	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	32
Validate Email Address - Invalid Address Handling	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Useful	FALSE	Low	Acceptance	\N	\N	33
Validate Email Address - Permissions	tara@acme.com	Shopping Team	Login/Authentication	Validate Customer Contact/Shipping info	Manual	\N	\N	\N	\N	Important	FALSE	Low	Acceptance	\N	\N	34
Validate website must be available 24x7	tara@acme.com	Shopping Team	\N	Website must be available 24x7	Manual	\N	\N	\N	\N	Critical	FALSE	Low	Acceptance	\N	\N	35
Failed Test Case for Demonstration	\N	Medical Records App	\N	Prescription Administration Updates	Automated	\N	\N	\N	\N	\N	FALSE	\N	Functional	\N	\N	36
CheckNewPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	37
CheckExistingPatient-QA	\N	Medical Records App	\N	Admin - Accept new patients	Manual	\N	\N	\N	\N	\N	FALSE	\N	Acceptance	\N	\N	38
\.


--
-- Data for Name: testcaseresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcaseresult (build, date, duration, notes, verdict, testcase, testset, tester, listing_order) FROM stdin;
113	2017-11-01 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	1
114	2017-11-01 10:59:00	0	\N	Pass	Check Invoice Creation	\N	\N	2
1.2.24	2017-11-01 10:59:00	1	Only showing 1 order, not 2.	Fail	Check the Status of Your Orders	\N	\N	3
112	2017-11-01 10:59:00	0	\N	Pass	Check the Status of Your Orders	\N	\N	4
115	2016-04-23 20:40:03	0	\N	Pass	Check the Status of Your Orders	\N	\N	5
117	2016-04-22 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	6
118	2016-04-23 20:40:14	0	\N	Fail	Default Shipping - Ground	\N	\N	7
118	2016-04-21 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	8
113	2017-11-01 10:59:00	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	26
114	2016-04-22 20:40:16	0	\N	Pass	Max Number of Shipping Destinations	\N	\N	27
115	2016-04-23 20:40:16	0	\N	Fail	Max Number of Shipping Destinations	\N	\N	28
113	2017-11-01 10:59:00	0	\N	Pass	No Address Entered	\N	\N	29
114	2017-11-01 10:59:00	0	\N	Pass	No Address Entered	\N	\N	30
115	2016-04-23 20:40:07	0	\N	Pass	No Address Entered	\N	\N	31
113	2017-11-01 10:59:00	0	\N	Pass	One Promo Code per order	\N	\N	32
114	2016-04-22 20:40:16	0	\N	Pass	One Promo Code per order	\N	\N	33
115	2016-04-23 20:40:16	0	\N	Fail	One Promo Code per order	\N	\N	34
114	2016-04-22 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	42
115	2016-04-23 20:40:14	0	\N	Pass	Priority Shipping GUI	\N	\N	43
117	2016-04-23 20:40:16	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	44
118	2016-04-23 04:14:51	0	\N	Pass	Priority Shipping Options for each Destination	\N	\N	45
113	2017-11-01 10:59:00	0	\N	Pass	Promo Code GUI	\N	\N	46
114	2016-04-22 20:40:15	0	\N	Pass	Promo Code GUI	\N	\N	47
115	2016-04-23 20:40:15	0	\N	Fail	Promo Code GUI	\N	\N	48
117	2016-04-22 20:40:11	2	!! FAILURE NOTE: Unable to purchase exactly MAX items. Error message indicates count exceeded.  Is this a < vs. <= condition?	Fail	Purchase MAX Items	\N	\N	49
118	2016-04-23 20:40:12	1.5	!! FAILURE NOTE: Set # of products to MAX but response email shows MAX minus 1.	Fail	Purchase MAX Items	\N	\N	50
113	2017-11-01 10:59:00	4	!! FAILURE NOTE: Error accessing purchase engine.	Fail	Purchase Multiple Items	\N	\N	51
114	2016-04-22 20:40:11	4.5	!! FAILURE NOTE: All items are showing duplicates.	Fail	Purchase Multiple Items	\N	\N	52
113	2017-11-01 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	37
114	2016-04-22 20:40:10	1.5	!! FAILURE NOTE: Entered one item and the cart showed duplicate entries.	Fail	Purchase One Item	\N	\N	54
113	2017-11-01 10:59:00	0	\N	Fail	Search for Items	\N	\N	55
114	2016-04-22 20:40:09	0	\N	Pass	Search for Items	\N	\N	56
117	2016-04-22 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	57
118	2016-04-23 20:40:12	1.5	!! FAILURE NOTE: Purchased MAX+1 without any error conditions.	Fail	Select MAX+1 Items	\N	\N	58
113	2017-11-01 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	59
114	2017-11-01 10:59:00	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	60
115	2016-04-23 20:40:07	0	\N	Pass	Shipping Address and Billing Address must match	\N	\N	61
113	2017-11-01 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	62
114	2017-11-01 10:59:00	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	63
115	2016-04-23 20:40:04	0	\N	Pass	System should support 10,000 concurrent users	\N	\N	64
1.2.24	2017-11-01 10:59:00	1	\N	Pass	Tracking Information	\N	\N	65
113	2017-11-01 10:59:00	0	\N	Pass	Tracking Information	\N	\N	66
114	2017-11-01 10:59:00	0	\N	Fail	Tracking Information	\N	\N	67
113	2017-11-01 10:59:00	0	\N	Fail	Validate Email Address - Email Authentication	\N	\N	68
114	2016-04-23 04:14:51	0	\N	Pass	Validate Email Address - Email Authentication	\N	\N	69
113	2017-11-01 10:59:00	0	\N	Fail	Validate Email Address - Invalid Address Handling	\N	\N	70
114	2016-04-23 20:40:08	0	\N	Pass	Validate Email Address - Invalid Address Handling	\N	\N	71
113	2017-11-01 10:59:00	0	\N	Fail	Validate Email Address - Permissions	\N	\N	72
114	2016-04-22 20:40:09	0	\N	Pass	Validate Email Address - Permissions	\N	\N	73
113	2017-11-01 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	74
114	2017-11-01 10:59:00	0	\N	Pass	Validate website must be available 24x7	\N	\N	75
115	2016-04-23 20:40:04	0	\N	Fail	Validate website must be available 24x7	\N	\N	76
200	2017-11-01 10:59:00	1	\N	Fail	Failed Test Case for Demonstration	\N	\N	77
201	2017-11-01 10:59:00	1	\N	Pass	CheckNewPatient-QA	\N	\N	78
202	2017-11-01 10:59:00	1	\N	Pass	CheckExistingPatient-QA	\N	\N	79
119	2016-04-22 20:40:13	0	\N	Pass	GUI - Checkout Button	\N	\N	9
113	2017-11-01 10:59:00	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	10
114	2016-04-22 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	11
115	2016-04-23 20:40:14	0	\N	Pass	GUI - Checkout Button for Empty Cart	\N	\N	12
113	2017-11-01 10:59:00	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	13
114	2016-04-22 20:40:16	0	\N	Pass	GUI - Multi-Site Shipping Options	\N	\N	14
115	2016-04-23 20:40:17	0	\N	Fail	GUI - Multi-Site Shipping Options	\N	\N	15
113	2017-11-01 10:59:00	0	\N	Pass	Invalid Promo Code	\N	\N	16
114	2016-04-22 20:40:15	0	\N	Pass	Invalid Promo Code	\N	\N	17
115	2016-04-23 20:40:15	0	\N	Fail	Invalid Promo Code	\N	\N	18
1.2.24	2017-11-01 10:59:00	2	\N	Pass	Log-in to Secured Website	\N	\N	19
112	2017-11-01 10:59:00	0	\N	Fail	Log-in to Secured Website	\N	\N	20
113	2017-11-01 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	21
114	2017-11-01 10:59:00	0	\N	Pass	Log-in to Secured Website	\N	\N	22
1.2.24	2017-11-01 10:59:00	1	\N	Pass	Log-off Website	\N	\N	23
113	2017-11-01 10:59:00	0	\N	Pass	Order Verification	\N	\N	35
114	2017-11-01 10:59:00	0	\N	Pass	Order Verification	\N	\N	36
113	2017-11-01 10:59:00	0.5	!! FAILURE NOTE: Entered one item but the cart was still empty.	Fail	Purchase One Item	\N	\N	53
114	2017-11-01 10:59:00	0	\N	Fail	Order Verification - Backordered Item Handling	\N	\N	38
113	2017-11-01 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	39
114	2017-11-01 10:59:00	0	\N	Fail	Priority Shipping chosen on a per-package basis	\N	\N	40
113	2017-11-01 10:59:00	0	\N	Pass	Priority Shipping GUI	\N	\N	41
112	2017-11-01 10:59:00	0	\N	Fail	Log-off Website	\N	\N	24
115	2016-04-23 20:40:02	0	\N	Pass	Log-off Website	\N	\N	25
\.


--
-- Data for Name: testcasestep; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testcasestep (expectedresult, input, stepindex, testcase, listing_order) FROM stdin;
My account home page	Login to Shopping Site	0	Purchase One Item	1
Displayed Search results	Search for items	1	Purchase One Item	2
Checked Item	Select one item for purchase	2	Purchase One Item	3
Populated Cart with one item	Choose to add one item to Cart	3	Purchase One Item	4
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase One Item	5
My Home Page	Login to Shopping Site	0	Purchase Multiple Items	6
Displayed Search results	Search for items	1	Purchase Multiple Items	7
Checked Items	Select multiple items for purchase (more than 1)	2	Purchase Multiple Items	8
Populated Cart with multiple items	Choose to add multiple items to the Cart (more than 1)	3	Purchase Multiple Items	9
Completed Purchase of multiple items	Purchase Items in Cart	4	Purchase Multiple Items	10
My Home Page	Login to Shopping Site	0	Purchase MAX Items	11
Displayed Search results	Search for items	1	Purchase MAX Items	12
Checked Item	Select 100 items for purchase (max)	2	Purchase MAX Items	13
Populated Cart with max items	Choose to add 100 items to Cart (max)	3	Purchase MAX Items	14
Completed Purchase of One Item	Purchase Items in Cart	4	Purchase MAX Items	15
My Home Page	Login to Shopping Site	0	Select MAX+1 Items	16
Displayed Search results	Search for items	1	Select MAX+1 Items	17
Checked Items	Select 101 items for purchase (max +1)	2	Select MAX+1 Items	18
Error message that max +1 reached.	Choose to add 101 items to Cart	3	Select MAX+1 Items	19
Error message purchasing over max not permitted.	Purchase Items in Cart	4	Select MAX+1 Items	20
My Home Page	Login to Shopping Site	0	GUI - Checkout Button	21
Displayed Search results	Search for items	1	GUI - Checkout Button	22
Checked Item	Select one item for purchase	2	GUI - Checkout Button	23
Show Cart	Click GUI Checkout Button	3	GUI - Checkout Button	24
My Home Page	Login to Shopping Site	0	GUI - Checkout Button for Empty Cart	25
Show Empty Cart	Click GUI Checkout Button	1	GUI - Checkout Button for Empty Cart	26
\.


--
-- Data for Name: testfolder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testfolder (name, project, listing_order) FROM stdin;
Checkout	Shopping Team	1
Fulfillment	Shopping Team	2
Login/Authentication	Shopping Team	3
Order Status	Shopping Team	4
Shopping	Shopping Team	5
\.


--
-- Data for Name: testset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY testset (description, name, planestimate, ready, schedulestate, project, iteration, release, owner, listing_order) FROM stdin;
Test routine for checkout path using Chrome browser	Chrome Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	1
Test routine for checkout path using Firefox browser	Firefox Browser Tests: Checkout Path	3	FALSE	Defined	Shopping Team	Iteration 6	R2	tara@acme.com	2
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY theme (name, owner, plannedstartdate, plannedenddate, description, displaycolor, investmentcategory, ready, riskscore, valuescore, project, preliminaryestimate, state, listing_order) FROM stdin;
Revamp online presence	paul@acme.com	2017-09-22 10:59:00	2018-03-23 10:59:00	\N	\N	Strategic Growth	FALSE	3	6	Online Store	L	Developing	1
Create best in class platform	aaron@acme.com	2017-09-01 10:59:00	2018-05-07 10:59:00	\N	\N	Strategic Growth	FALSE	5	8	Platform	XL	Discovering	2
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT USAGE ON SCHEMA public TO readonly;


--
-- Name: defect; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE defect FROM PUBLIC;
REVOKE ALL ON TABLE defect FROM postgres;
GRANT ALL ON TABLE defect TO postgres;
GRANT SELECT ON TABLE defect TO readonly;


--
-- Name: feature; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE feature FROM PUBLIC;
REVOKE ALL ON TABLE feature FROM postgres;
GRANT ALL ON TABLE feature TO postgres;
GRANT SELECT ON TABLE feature TO readonly;


--
-- Name: initiative; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE initiative FROM PUBLIC;
REVOKE ALL ON TABLE initiative FROM postgres;
GRANT ALL ON TABLE initiative TO postgres;
GRANT SELECT ON TABLE initiative TO readonly;


--
-- Name: iteration; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE iteration FROM PUBLIC;
REVOKE ALL ON TABLE iteration FROM postgres;
GRANT ALL ON TABLE iteration TO postgres;
GRANT SELECT ON TABLE iteration TO readonly;


--
-- Name: release; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE release FROM PUBLIC;
REVOKE ALL ON TABLE release FROM postgres;
GRANT ALL ON TABLE release TO postgres;
GRANT SELECT ON TABLE release TO readonly;


--
-- Name: story; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE story FROM PUBLIC;
REVOKE ALL ON TABLE story FROM postgres;
GRANT ALL ON TABLE story TO postgres;
GRANT SELECT ON TABLE story TO readonly;


--
-- Name: task; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE task FROM PUBLIC;
REVOKE ALL ON TABLE task FROM postgres;
GRANT ALL ON TABLE task TO postgres;
GRANT SELECT ON TABLE task TO readonly;


--
-- Name: testcase; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcase FROM PUBLIC;
REVOKE ALL ON TABLE testcase FROM postgres;
GRANT ALL ON TABLE testcase TO postgres;
GRANT SELECT ON TABLE testcase TO readonly;


--
-- Name: testcaseresult; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcaseresult FROM PUBLIC;
REVOKE ALL ON TABLE testcaseresult FROM postgres;
GRANT ALL ON TABLE testcaseresult TO postgres;
GRANT SELECT ON TABLE testcaseresult TO readonly;


--
-- Name: testcasestep; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testcasestep FROM PUBLIC;
REVOKE ALL ON TABLE testcasestep FROM postgres;
GRANT ALL ON TABLE testcasestep TO postgres;
GRANT SELECT ON TABLE testcasestep TO readonly;


--
-- Name: testfolder; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testfolder FROM PUBLIC;
REVOKE ALL ON TABLE testfolder FROM postgres;
GRANT ALL ON TABLE testfolder TO postgres;
GRANT SELECT ON TABLE testfolder TO readonly;


--
-- Name: testset; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE testset FROM PUBLIC;
REVOKE ALL ON TABLE testset FROM postgres;
GRANT ALL ON TABLE testset TO postgres;
GRANT SELECT ON TABLE testset TO readonly;


--
-- Name: theme; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE theme FROM PUBLIC;
REVOKE ALL ON TABLE theme FROM postgres;
GRANT ALL ON TABLE theme TO postgres;
GRANT SELECT ON TABLE theme TO readonly;


--
-- PostgreSQL database dump complete
--

