create database rally_data;
\c rally_data

drop table release;

create table release(
Project		TEXT,
Name			TEXT,
PlannedVelocity	INT,
ReleaseDate		timestamp,
ReleaseStartDate	timestamp, 
State			TEXT,
Theme		TEXT,
GrossEstimateConversionRatio INT,
listing_order			int
);

drop table iteration;

create table iteration(
Project	TEXT,
Name		TEXT,
StartDate	TIMESTAMP,
EndDate	TIMESTAMP,
PlannedVelocity INT,
State		TEXT,
Theme	TEXT,
Notes		TEXT,
listing_order			int
);

drop table theme;

create table theme(
Name		TEXT,
Owner		TEXT,
PlannedStartDate TIMESTAMP,
PlannedEndDate	TIMESTAMP,
Description	TEXT,
DisplayColor	TEXT,
InvestmentCategory		TEXT,
Ready		TEXT,
RiskScore	INT,
ValueScore	INT,
Project	TEXT,
PreliminaryEstimate TEXT,
State		TEXT,
listing_order			int
);

drop table initative;

create table initiative(
Name			TEXT,
PlannedStartDate	TIMESTAMP,
PlannedEndDate	TIMESTAMP,
Parent			TEXT,	
Description		TEXT,
DisplayColor		TEXT,
InvestmentCategory	 TEXT,
Notes			TEXT,
Ready			TEXT,
RiskScore		INT,
ValueScore		INT,
Project		TEXT,
State			TEXT,
Owner			TEXT,
listing_order			int
);

drop table story;

create table story (
Name			TEXT,	
ScheduleState	TEXT,
KanbanState		TEXT,
PortfolioItem		TEXT,
Project		TEXT,
Iteration		TEXT,
Owner			TEXT,
PlanEstimate		INT,
Release		TEXT,
Description		TEXT,
Ready			TEXT,
Blocked		TEXT,
BlockedReason	TEXT,
DisplayColor		TEXT,
Notes			TEXT,
listing_order			int
);

drop table defect;

create table defect (
Name			TEXT,	
KanbanState		TEXT,	
ScheduleState	TEXT,	
Owner			TEXT,	
Requirement		TEXT,	
Project		TEXT,	
Iteration		TEXT,	
Release		TEXT,	
PlanEstimate		TEXT,	
Severity		TEXT,	
State			TEXT,	
Environment		TEXT,	
Priority		TEXT,	
Ready			TEXT,	
Resolution		TEXT,	
Blocked		TEXT,	
BlockedReason	TEXT,	
Description		TEXT,	
Notes			TEXT,	
DisplayColor		TEXT,
listing_order			int
);

drop table testfolder;

create table testfolder (
Name		TEXT,
Project	TEXT,
listing_order			int
);

drop table testset;

CREATE TABLE TESTSET(
Description		TEXT,	
Name			TEXT,
PlanEstimate		TEXT,
Ready			TEXT,
ScheduleState	TEXT,
Project		TEXT,
Iteration		TEXT,
Release		TEXT,
Owner			TEXT,
listing_order			int
);

drop table testcase;

CREATE TABLE TESTCASE( Name TEXT,
Owner 			TEXT,
Project 			TEXT,
TestFolder 			TEXT,
WorkProduct 		TEXT,
Method 			TEXT,
Description 			TEXT,
Objective 			TEXT,
PostConditions 		TEXT,
PreConditions 		TEXT,
Priority 			TEXT,
Ready 			TEXT,
Risk 				TEXT,
Type 				TEXT,
ValidationExpectedResult 	TEXT,
ValidationInput 		TEXT,
listing_order 			int);

drop table testcasestep;

create table testcasestep (
ExpectedResult	TEXT,
Input			TEXT,
StepIndex		TEXT,
TestCase		TEXT,
listing_order			int
);

drop table testcaseresult;

CREATE TABLE testcaseresult (
Build		TEXT,
Date		timestamp,
Duration	TEXT,
Notes		TEXT,
Verdict	TEXT,
TestCase	TEXT,
TestSet	TEXT,
Tester		TEXT,
listing_order			int
);

drop table task;

CREATE TABLE TASK(
Name			TEXT,
WorkProduct		TEXT,
State			TEXT,
Owner			TEXT,
Estimate		TEXT,
ToDo			TEXT,
Actuals		TEXT,
Blocked		TEXT,
BlockedReason	TEXT,
Description		TEXT,
DisplayColor		TEXT,
Ready			TEXT,
TaskIndex		TEXT,
Project		TEXT,
listing_order			int
);

drop table feature;

create table feature(
Name				TEXT,
InvestmentCategory		TEXT,
Project			TEXT,
Owner				TEXT,
Parent				TEXT,
Release			TEXT,
PlannedStartDate		timestamp,
PlannedEndDate		timestamp,
Description			TEXT,
DisplayColor			TEXT,
Notes				TEXT,
Ready				TEXT,
RiskScore			TEXT,
ValueScore			TEXT,
PreliminaryEstimate		TEXT,
State				TEXT,
listing_order			int
);


GRANT CONNECT ON DATABASE testing to thomas;
GRANT USAGE ON SCHEMA public TO thomas;
GRANT SELECT ON ALL TABLES IN SCHEMA public To thomas;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO thomas;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO thomas;


### Copy database command CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER dbuser;
###		create database newtest template rally_data owner postgres;
### Update Dates by one day for each table.

## Update dates 
#update feature set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
#update Initiative set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
#update theme set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
#update iteration set StartDate = StartDate + interval '1' day, EndDate = EndDate + interval '1' day;
#update release set ReleaseDate = ReleaseDate + interval '1' day, ReleaseStartDate = ReleaseStartDate + interval '1' day;
#update testcaseresult set Date = Date + interval '1' day;



