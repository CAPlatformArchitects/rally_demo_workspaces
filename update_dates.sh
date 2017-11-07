# This file updates the dates in the dataset so they will be current.  It assumes the password is stored on the filesystem.
psql -d rally_data -f /home/thomas/rally_python_tests/database_files/update_dates.sql > /home/thomas/dates.log
