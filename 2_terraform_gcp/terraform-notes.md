using google cloud sdk.

 we will authrize project

```
gcloud auth login
gcloud projects list

gcloud config set project [PROJECT_ID]

gcloud config set project [PROJECT_ID]

gcloud config set project de-ea-retail-sales
```
You crate service key after you give these permissions

```


02datatalks@gmail.com
enes avci	
Owner

531523056255-compute@developer.gserviceaccount.com
Compute Engine default service account	

Compute Admin
Compute Network Admin
Dataproc Administrator
Dataproc Editor
Dataproc Worker
Editor
Security Admin
Storage Admin
Storage Object Viewer



terraform@de-ea-453612.iam.gserviceaccount.com
terraform	

BigQuery Admin
Compute Admin
Dataproc Administrator
Dataproc Worker
Security Admin
Service Account User
Storage Admin
Storage Object Admin
Storage Object Viewer
Viewer


```


```

allow api service:
1. Enable Required APIs
You need to enable the APIs for the Compute Engine, Dataproc, and Cloud Storage services in your Google Cloud project.

Compute Engine API: Enable Compute Engine API
Cloud Dataproc API: Enable Cloud Dataproc API
Cloud Storage API: Enable Cloud Storage API

```
gcloud services enable compute.googleapis.com \
  storage.googleapis.com \
  bigquery.googleapis.com \
  dataproc.googleapis.com --project=de-ea-retail-sales

```


if you giver necesery permisssion service account you can authenticate with google service account

```
gcloud auth activate-service-account --key-file=/path/to/your-key.json



gcloud auth activate-service-account --key-file="C:\Users\enesa\data-science-ea\retail_sales_ea\key\de-ea-retail-sales-ba8daf8c8770.json"






You enter your path where you place terraform files

cd your terraform file path

We will install terraform using `terraform.sh`

```
bash terraform.sh # google sdk
./terraform.sh
```

### Execution (Ubuntu setup)

```shell
# Initialize state file (.tfstate): initializes & configures the backend, 
# installs plugins/providers, & checks out an existing configuration from a version control.
# For example, google provider in our case and all the existing configuration 
terraform init

# Matches/previews local changes against a remote state, and proposes an Execution Plan.
terraform plan

# The changes that are detected from the terraform plan, any resources to be deleted 
# or new resources to be created or any existing resources need to be updated in configuration. 
# (Asks for approval to the proposed plan, and applies changes to cloud)
# For example, increasing the memory size of a particular cluster.
terraform apply

# Delete infra after your work, to avoid costs on any running services
terraform destroy


