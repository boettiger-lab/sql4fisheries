INSERT INTO policies (
	training_env,
	algo,
	fn_structure,
	url
)
VALUES
	(
		1, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM1-noise01-no-rescaling.pkl'
	),
	(
		1, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM1-noise01-no-rescaling.pkl'
	),
	(
		3, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM2-noise01-no-rescaling.pkl'
	),
	(
		3, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM2-noise01-no-rescaling.pkl'
	),
	(
		5, 'GPOpt', 'FMSY', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/msy-UM3-noise01-no-rescaling.pkl'
	),
	(
		5, 'GPOpt', 'oPP', 
		'https://huggingface.co/boettiger-lab/rl4eco/blob/main/sb3/rl4fisheries/post-review-results/cr-UM3-noise01-no-rescaling.pkl'
	),
	... -- missing the RL policies, tbd
