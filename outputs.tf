####################################
# EKS Cluster Outputs
####################################

output "cluster_name" {
  description = "Amazon EKS Cluster Name"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_arn" {
  description = "Amazon EKS Cluster ARN"
  value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_endpoint" {
  description = "Amazon EKS API Server Endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
  description = "Kubernetes Version"
  value       = aws_eks_cluster.eks_cluster.version
}

####################################
# Node Group Outputs
####################################

output "node_group_name" {
  description = "Managed Node Group Name"
  value       = aws_eks_node_group.eks_nodes.node_group_name
}

output "node_group_arn" {
  description = "Managed Node Group ARN"
  value       = aws_eks_node_group.eks_nodes.arn
}

####################################
# Networking Outputs
####################################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.eks_vpc.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = aws_subnet.private_subnets[*].id
}

####################################
# Security Groups
####################################

output "cluster_security_group_id" {
  description = "Cluster Security Group ID"
  value       = aws_security_group.cluster_sg.id
}

output "node_security_group_id" {
  description = "Worker Node Security Group ID"
  value       = aws_security_group.node_sg.id
}
