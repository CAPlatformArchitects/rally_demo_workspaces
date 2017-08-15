\c rally_data
update feature set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
update Initiative set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
update theme set PlannedStartDate = PlannedStartDate + interval '1' day, PlannedEndDate = PlannedEndDate + interval '1' day;
update iteration set StartDate = StartDate + interval '1' day, EndDate = EndDate + interval '1' day;
update release set ReleaseDate = ReleaseDate + interval '1' day, ReleaseStartDate = ReleaseStartDate + interval '1' day;
update testcaseresult set Date = Date + interval '1' day;

