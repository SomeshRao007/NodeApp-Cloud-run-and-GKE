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


### Solutions Implemented for docker file optimisiation
 
1. Use of **Alpine-Based Images** Switched the base image from node:20 to node:20-alpine to leverage a smaller, more efficient Linux distribution.
2. **Multi-Stage Builds** Implemented multi-stage builds in the Dockerfile, separating the build environment from the runtime environment to ensure only essential files are included in the final image.
Kept the Dockerfile clean and delineated between build and production stages.
3. **Integration of Distroless Image** Transitioned from using a traditional runtime image to gcr.io/distroless/nodejs:20-debian12, which only includes the Node.js runtime and its dependencies, reducing the image size and improving security. Link
4. **Use of Scratch Image** Combined the use of the scratch base image with concepts from Distroless to create a minimalist final image.


Ensured all necessary dependencies and executables were present in the scratch image by copying from intermediate stages.
 
 
The Main reason i choose **distroless container and scratch image** is Security 

**Security Concern**:

- By using multi-stage builds, we minimized the attack surface of the final image by excluding build tools and dependencies not required at runtime.
- Distroless images lack a shell and package manager, thereby significantly reducing the potential attack vectors. This contributes to a more secure runtime environment.
- The scratch image is completely empty and has no built-in utilities or libraries, resulting in an extremely small attack surface.
 
Now the docker image is small it only takes 10-15 sec. to build and secure. all these measures add a layer to the defence of depth. 


## Docker Output

![Screenshot 2024-08-09 124825](https://github.com/user-attachments/assets/ab353d17-02f4-42c8-ae60-9d842fb9a9e7)

![Screenshot 2024-08-09 103013](https://github.com/user-attachments/assets/f1a3c1a6-e56c-4423-a06a-c9d60a917f15)

![Screenshot 2024-08-09 130147](https://github.com/user-attachments/assets/bfa288e0-a81b-4749-9998-703de417da39)


## Deployment Output 

![Screenshot 2024-08-06 155901](https://github.com/user-attachments/assets/b0747d5a-7751-4ac1-903d-38b6ba5c7117)


![Screenshot 2024-08-06 162035](https://github.com/user-attachments/assets/ebaa29ee-ce99-4530-b892-120b141930f8)


![Screenshot 2024-08-06 162112](https://github.com/user-attachments/assets/7380b206-ecfc-4485-b172-72a4badc1a1b)


![Screenshot 2024-08-06 162156](https://github.com/user-attachments/assets/585f7cf1-1946-4981-95d6-a7c5c00328bd)



