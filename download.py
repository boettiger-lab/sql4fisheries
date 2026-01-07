import pandas as pd
import os

from huggingface_hub import hf_hub_download, HfApi

REPO = "boettiger-lab/rl4eco"
PATH_IN_REPO = "rl4fisheries-reproducing/"
FS = HfFileSystem()

SAVE_DATA = "data"
SAVE_DATA_GLOB = os.path.join(
	os.path.abspath(__file__),
	SAVEDATA,
)

csv_files = [
    os.path.basename(file) for file in FS.glob(
        os.path.join(
        	REPO,
        	PATH_IN_REPO,
        	"*.csv",
        )
    )
]

for filename in csv_files:
    hf_hub_download(
        repo_id=REPO,
        filename=PATH_IN_REPO + filename,
        local_dir=SAVE_DATA
    )

print(
    f"downloads data to data/{PATH_IN_REPO}"
)

# make data findable
def data_type(filename):
	if filename[-7:] == 'rew.csv':
		return 'reward'
	if filename[-12:] == 'policies.csv':
		return 'policy'
	if filename[-10:] == 'action.csv':
		return 'episode-action'
	if filename[-9:] == 'state.csv':
		return 'episode-state'

data_locations = pd.DataFrame([
	[
		data_type(filename), 
		os.path.join(
			SAVE_DATA_GLOB,
			filename
		),
	]
	for file in os.listdir(SAVE_DATA)
	],
	columns = ['data_type', 'loc']
)

data_locations.to_csv('data/data_loc.csv', index=False)

# add global path to sql script
with open('data.sql', 'w') as sqlscript:
	sqlscript.write(
		'CREATE TABLE data_locs (data_type TEXT, loc TEXT)\n'
	)
	sqlscript.write(
		'\copy data_locs(data_type, loc) FROM '
		os.path.abspath('data/data_loc.csv')
		" DELIMITER ',' CSV HEADER;"
	)
