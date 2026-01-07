import os

from huggingface_hub import hf_hub_download, HfApi

REPO = "boettiger-lab/rl4eco"
PATH_IN_REPO = "rl4fisheries-reproducing/"
FS = HfFileSystem()

SAVE_DATA = "data/"

csv_files = [
    os.path.basename(file) for file in FS.glob(
        REPO+"/"+PATH_IN_REPO+"*.csv"
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