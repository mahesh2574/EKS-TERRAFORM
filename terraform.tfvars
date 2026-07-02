####################################
# AWS Configuration
####################################

aws_region = "ap-south-1"

####################################
# EKS Cluster
####################################

cluster_name = "terraform-eks-cluster"

kubernetes_version = "1.30"

####################################
# Worker Nodes
####################################

node_group_name = "terraform-node-group"

instance_type = "t3.medium"

desired_size = 2

min_size = 2

max_size = 4

####################################
# SSH Key Pair
####################################

ssh_key_name = "My-KeyPair"
