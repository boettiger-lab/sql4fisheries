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

--

ALTER TABLE rew_um1
	ADD COLUMN pol_id INTEGER,
	ADD COLUMN env_id INTEGER,
	ADD COLUMN episode INTEGER,
	ADD COLUMN reward FLOAT;

UPDATE rew_um1
SET pol_id = 	CASE
									WHEN agent = 'Opt. Prec. Pol.' THEN 1
									WHEN agent = 'Const. Mort.' THEN 2
									WHEN agent = 'Constr. Prec. Pol..' THEN 3
									WHEN agent = '1 obs. RL' THEN 10
									WHEN agent = '2 obs. RL' THEN 11
							END,
		env_id = CASE
								WHEN agent = '2 obs. RL' THEN 2
								ELSE 1
							END,
		episode = ep,
		reward = rew;

--

ALTER TABLE rew_um2
	ADD COLUMN pol_id INTEGER,
	ADD COLUMN env_id INTEGER,
	ADD COLUMN episode INTEGER,
	ADD COLUMN reward FLOAT;

UPDATE rew_um2
SET pol_id = 	CASE
									WHEN agent = 'Opt. Prec. Pol.' THEN 4
									WHEN agent = 'Const. Mort.' THEN 5
									WHEN agent = 'Constr. Prec. Pol..' THEN 6
									WHEN agent = '1 obs. RL' THEN 12
									WHEN agent = '2 obs. RL' THEN 13
							END,
		env_id = CASE
								WHEN agent = '2 obs. RL' THEN 4
								ELSE 3
							END,
		episode = ep,
		reward = rew;

--

ALTER TABLE rew_um3
	ADD COLUMN pol_id INTEGER,
	ADD COLUMN env_id INTEGER,
	ADD COLUMN episode INTEGER,
	ADD COLUMN reward FLOAT;

UPDATE rew_um3
SET pol_id = 	CASE
									WHEN agent = 'Opt. Prec. Pol.' THEN 7
									WHEN agent = 'Const. Mort.' THEN 8
									WHEN agent = 'Constr. Prec. Pol..' THEN 9
									WHEN agent = '1 obs. RL' THEN 14
									WHEN agent = '2 obs. RL' THEN 15
							END,
	 	env_id = CASE
								WHEN agent = '2 obs. RL' THEN 6
								ELSE 5
							END,
	 	episode = ep,
	 	reward = rew;

--

INSERT INTO rewards (pol_id, env_id, episode, reward)
SELECT pol_id, env_id, episode, reward FROM rew_um1
UNION ALL
SELECT pol_id, env_id, episode, reward FROM rew_um2
UNION ALL
SELECT pol_id, env_id, episode, reward FROM rew_um3
