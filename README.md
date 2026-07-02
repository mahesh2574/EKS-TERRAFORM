#  Amazon EKS Cluster Deployment using Terraform

This project demonstrates how to provision a production-style Amazon EKS Cluster using Terraform.

---

## Architecture

```
                     AWS Cloud
                         │
        ┌────────────────────────────────┐
        │              VPC               │
        │                                │
        │  Public Subnets                │
        │      │                         │
        │      ├── Internet Gateway      │
        │      │                         │
        │      └── NAT Gateway           │
        │                                │
        │  Private Subnets               │
        │      │                         │
        │      └── EKS Worker Nodes      │
        │                                │
        └──────────────┬─────────────────┘
                       │
                Amazon EKS Cluster
                       │
                 Kubernetes Pods
```

---

# Project Structure

```
terraform-aws-eks/
│
├── versions.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── vpc.tf
├── security-groups.tf
├── iam.tf
├── eks.tf
├── nodegroup.tf
├── outputs.tf
└── README.md
```

---

# Prerequisites

- AWS Account
- IAM User with Administrator or EKS permissions
- Terraform 1.6+
- AWS CLI
- kubectl

---

# Configure AWS CLI

```bash
aws configure
```

Verify your identity:

```bash
aws sts get-caller-identity
```

---

# Initialize Terraform

```bash
terraform init
```

---

# Validate Configuration

```bash
terraform validate
```

---

# Format Terraform Files

```bash
terraform fmt
```

---

# Create Execution Plan

```bash
terraform plan
```

---

# Create Amazon EKS Cluster

```bash
terraform apply
```

Type:

```
yes
```

---

# Verify Resources

```bash
terraform show
```

List Terraform state:

```bash
terraform state list
```

---

# Configure kubectl

```bash
aws eks update-kubeconfig \
--region ap-south-1 \
--name terraform-eks-cluster
```

---

# Verify Cluster

```bash
kubectl get nodes

kubectl get pods -A
```

---

# Destroy Infrastructure

```bash
terraform destroy
```

---

# Technologies Used

- Terraform
- Amazon EKS
- AWS VPC
- IAM
- EC2
- Kubernetes
- AWS CLI

---

# Learning Outcomes

- Infrastructure as Code (IaC)
- Amazon EKS
- Managed Node Groups
- IAM Roles
- VPC Networking
- Security Groups
- Terraform State Management

---

# Author

Created as part of a DevOps Hands-on Learning Project.
