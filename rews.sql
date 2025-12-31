DROP TABLE IF EXISTS rew_um1;

CREATE TABLE rew_um1 (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	ep INTEGER,
	rew FLOAT,
	agent TEXT,
	agent_ugly_name TEXT
);

DROP TABLE IF EXISTS rew_um2;

CREATE TABLE rew_um2 (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	ep INTEGER,
	rew FLOAT,
	agent TEXT,
	agent_ugly_name TEXT
);

DROP TABLE IF EXISTS rew_um3;

CREATE TABLE rew_um3 (
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	ep INTEGER,
	rew FLOAT,
	agent TEXT,
	agent_ugly_name TEXT
);

\copy rew_um1(ep,rew,agent,agent_ugly_name) FROM '/Users/felipe/Desktop/Coding-Misc/SQL/sql4fisheries/data/UM1_rew.csv' DELIMITER ',' CSV HEADER;

\copy rew_um2(ep,rew,agent,agent_ugly_name) FROM '/Users/felipe/Desktop/Coding-Misc/SQL/sql4fisheries/data/UM2_rew.csv' DELIMITER ',' CSV HEADER;

\copy rew_um3(ep,rew,agent,agent_ugly_name) FROM '/Users/felipe/Desktop/Coding-Misc/SQL/sql4fisheries/data/UM3_rew.csv' DELIMITER ',' CSV HEADER;