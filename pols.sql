INSERT INTO policies (
	training_env,
	algo,
	fn_structure,
	url
)
VALUES
	(
		1, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM1-noise01.pkl'
	),
	(
		1, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM1-noise01.pkl'
	),
	(
		3, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM2-noise01.pkl'
	),
	(
		3, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM2-noise01.pkl'
	),
	(
		5, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM3-noise01.pkl'
	),
	(
		5, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM3-noise01.pkl'
	),
	(
		1, 'PPO', '64-32-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-biomass-UM1-64-32-16-noise0.1-chkpnt2.zip'
	),
	(
		2, 'PPO', '256-64-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-2obs-UM1-256-64-16-noise0.1-chkpnt2.zip'
	),
	(
		3, 'PPO', '64-32-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-biomass-UM2-64-32-16-noise0.1-chkpnt4.zip'
	),
	(
		4, 'PPO', '256-64-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-2obs-UM2-256-64-16-noise0.1-chkpnt4.zip'
	),
	(
		5, 'PPO', '64-32-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-biomass-UM3-64-32-16-noise0.1-chkpnt4.zip'
	),
	(
		6, 'PPO', '256-64-16',
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/PPO-AsmEnv-2obs-UM3-256-64-16-noise0.1-chkpnt2.zip'
	)
;
