# Application overview

- The code is for medusa application deployment using terraform IAC on AWS ECS fargate.


---

## What This Project Does

- Builds a Docker image for the Medusa backend
- Pushes the image to **Amazon ECR**
- Provisions infrastructure using Terraform:
  - VPC, Subnets, Internet Gateway
  - ECS Cluster (Fargate)
  - IAM roles and task execution permissions
  - Application Load Balancer (ALB)
  - ECS Service and Task Definition

---

## 🔧 Prerequisites

- [Docker](https://www.docker.com/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with `aws configure`)
- A GitHub repo with the Medusa app and Dockerfile

---

## 🛠 Setup & Deployment

```bash
git clone https://github.com/Shivamanand221/medusa-assignment.git
cd medusa-assignment
docker build -t medusa-app ./backend
aws ecr get-login-password --region <your-region> | \
docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<your-region>.amazonaws.com
docker tag medusa-app:latest <aws_account_id>.dkr.ecr.<region>.amazonaws.com/medusa-repo
docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/medusa-repo
cd terraform/
terraform init
terraform plan
terraform apply
