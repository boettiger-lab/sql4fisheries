-- postgre SQL database

CREATE DATABASE sql4fisheries;

-- psql-specific, Equivalent to USE statement in MySQL:

\c sql4fisheries 

-- %%%%%%%%%%%%%%%%%%%%%%%%
-- Declare tables in schema
-- %%%%%%%%%%%%%%%%%%%%%%%%

-- Note: when I eventually add data in, there's no need to 
-- manually add in primary key bc of auto-increase (GENERATED
-- AS IDENTITY)

CREATE TABLE environments (
	env_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	n_observ INTEGER,
	observ_noise FLOAT CHECK (observ_noise BETWEEN 0 AND 1),
	utility_fn TEXT CHECK (utility_fn IN ('harvest', 'hara', 'trophy')),
	url TEXT
);

CREATE TABLE policies (
	pol_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	training_env INTEGER, -- environments.env_id
	algo TEXT,
	fn_structure TEXT,
	url TEXT,
	CONSTRAINT fk_env
		FOREIGN KEY (training_env)
		REFERENCES environments(env_id)
);

CREATE TABLE rewards (
	pol_id INTEGER,
	env_id INTEGER,
	episode INTEGER,
	reward FLOAT,
	CONSTRAINT pk_rew
		PRIMARY KEY (pol_id, env_id, episode),
	CONSTRAINT fk_pol
		FOREIGN KEY (pol_id)
		REFERENCES policies(pol_id),
	CONSTRAINT fk_env_rew
		FOREIGN KEY (env_id)
		REFERENCES environments(env_id)
);

CREATE TABLE episode_state_sims(
	pol_id INTEGER,
	env_id INTEGER,
	t INTEGER,
	variable TEXT,
	value FLOAT,
	CONSTRAINT pk_ep_st
		PRIMARY KEY (pol_id, env_id, episode, t),
	CONSTRAINT fk_pol_ep_st
		FOREIGN KEY (pol_id)
		REFERENCES policies(pol_id),
	CONSTRAINT fk_env_ep_st
		FOREIGN KEY (env_id)
		REFERENCES environments(env_id)
);

CREATE TABLE episode_action_sims(
	pol_id INTEGER,
	env_id INTEGER,
	t INTEGER,
	variable TEXT,
	value FLOAT,
	CONSTRAINT pk_ep_ac
		PRIMARY KEY (pol_id, env_id, episode, t),
	CONSTRAINT fk_pol_ep_ac
		FOREIGN KEY (pol_id)
		REFERENCES policies(pol_id),
	CONSTRAINT fk_env_ep_ac
		FOREIGN KEY (env_id)
		REFERENCES environments(env_id)
);