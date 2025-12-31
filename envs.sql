-- no need to manually add in env_id bc of auto-increase
INSERT INTO environments (
	n_observ, observ_noise, utility_fn, url
)
VALUES 
	(1, 0.1, 'harvest', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py'),
	(2, 0.1, 'harvest', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py'),
	(1, 0.1, 'hara', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py'),
	(2, 0.1, 'hara', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py'),
	(1, 0.1, 'trophy', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py'),
	(2, 0.1, 'trophy', 'https://github.com/boettiger-lab/rl4fisheries/blob/main/src/rl4fisheries/envs/asm_env.py')
;
