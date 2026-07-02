####################################
# AWS Configuration
####################################

variable "aws_region" {
  description = "AWS Region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

####################################
# EKS Cluster Configuration
####################################

variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "terraform-eks-cluster"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes Version"
  type        = string
  default     = "1.30"
}

####################################
# Networking
####################################

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)

  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]
}

####################################
# Worker Node Configuration
####################################

variable "node_group_name" {
  description = "Managed Node Group Name"
  type        = string
  default     = "terraform-node-group"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "desired_size" {
  description = "Desired Number of Worker Nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum Number of Worker Nodes"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum Number of Worker Nodes"
  type        = number
  default     = 4
}

####################################
# SSH Configuration
####################################

variable "ssh_key_name" {
  description = "EC2 Key Pair Name"
  type        = string
  default     = "My-KeyPair"
}
