# NodeApp Deployment on Google Cloud Platform using Cloud run and GKE


This project showcases the deployment of a Node.js application on Google Cloud Platform (GCP) using Terraform for Infrastructure as Code (IaC) management. Two deployment options are provided:

1. **Google Kubernetes Engine (GKE)**: Deploy the Node.js application on a GKE cluster.
2. **Google Cloud Run**: Deploy the Node.js application on Cloud Run, a fully managed compute platform.

## Prerequisites

Before you begin, ensure you have the following:

- Google Cloud Platform (GCP) account
- Terraform installed on your local machine
- Docker installed on your local machine

## Getting Started

1. Clone this repository to your local machine:

~~~
git clone https://github.com/SomeshRao007/NodeApp-Cloud-run-and-GKE.git
cd NodeApp-Cloud-run-and-GKE
~~~


2. Build and push your Node.js application Docker image to a container registry (e.g., Docker Hub). Replace `Docker-hub-Username/repo-name:latest` with your image name and tag in the Terraform files.

3. Create a `terraform.tfvars` file and provide your GCP project ID: `project_id = "your-project-id"`


4. Initialize the Terraform working directory:

~~~
terraform init
~~~

5. Review the deployment plan:

~~~
terraform plan
~~~

6. Apply the Terraform configuration to create the desired deployment (GKE or Cloud Run):

~~~
terraform apply
~~~

7. After the deployment is complete, Terraform will output the load balancer IP address (for GKE) or the service URL (for Cloud Run) where your application is accessible.

## Cleaning Up

To remove the resources created by this project, run the following command:

~~~
terraform destroy
~~~

## Configuration

The Terraform configuration files in this project are:

- `GKE.tf` , `GKE-cluster.tf` and `cloud-run.tf`: Defines the resources for the GKE cluster, Kubernetes deployment, service (for GKE), and Cloud Run service (for Cloud Run).
- `variables.tf`: Defines the input variables required for the deployment.
- `roles.tf`: Creates a custom IAM role and binds it to the GKE node service account for managing the Node.js application (for GKE).

You can modify these files according to your requirements and choose the desired deployment option by commenting/uncommenting the relevant sections in terraform files.


## Output

![Screenshot 2024-08-06 155901](https://github.com/user-attachments/assets/b0747d5a-7751-4ac1-903d-38b6ba5c7117)


![Screenshot 2024-08-06 162035](https://github.com/user-attachments/assets/ebaa29ee-ce99-4530-b892-120b141930f8)


![Screenshot 2024-08-06 162112](https://github.com/user-attachments/assets/7380b206-ecfc-4485-b172-72a4badc1a1b)


![Screenshot 2024-08-06 162156](https://github.com/user-attachments/assets/585f7cf1-1946-4981-95d6-a7c5c00328bd)



