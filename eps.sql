CREATE TEMP TABLE rl_um1_1o_action (...);

\copy rew_um1(...) FROM 'absolute/path.sql' DELIMITER ',' CSV HEADER;

ALTER TABLE rl_um1_1o_action
	ADD COLUMN env_id,
	ADD COLUMN pol_id;