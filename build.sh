# download data
python download.py

# default postgres db to create sql4fisheries db:
psql -U postgres -d postgres -f db.sql
# now run against sql4fisheries
psql -U postgres -d sql4fisheries -f envs.sql
psql -U postgres -d sql4fisheries -f pols.sql
psql -U postgres -d sql4fisheries -f rews.sql

psql -U postgres -d sql4fisheries