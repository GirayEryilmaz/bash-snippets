# If you are on HPC
# start an interative job and load singularity module
srun --pty -p dev -q dev -c 4 --mem 16G -t 08:00:00 bash -i
module load singularity

# fetch the client
singularity pull docker://gcr.io/google.com/cloudsdktool/google-cloud-cli:latest


singularity exec ~/google-cloud-cli_latest.sif gcloud config set pass_credentials_to_gsutil false
singularity exec ~/google-cloud-cli_latest.sif gsutil config
singularity exec ~/google-cloud-cli_latest.sif gsutil cp gs://<the path> <local path>

additional resource:
https://blog.cpming.top/p/gsutil-serviceexception-401-anonymous-caller
https://cloud.google.com/storage/docs/quickstart-gsutil
