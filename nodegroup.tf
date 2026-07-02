####################################
# Amazon EKS Managed Node Group
####################################

resource "aws_eks_node_group" "eks_nodes" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = aws_subnet.private_subnets[*].id

  instance_types = [
    var.instance_type
  ]

  capacity_type = "ON_DEMAND"

  scaling_config {

    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size

  }

  update_config {

    max_unavailable = 1

  }

  remote_access {

    ec2_ssh_key = var.ssh_key_name

    source_security_group_ids = [
      aws_security_group.node_sg.id
    ]

  }

  ami_type = "AL2_x86_64_STANDARD"

  depends_on = [

    aws_eks_cluster.eks_cluster,

    aws_iam_role_policy_attachment.worker_node_policy,

    aws_iam_role_policy_attachment.cni_policy,

    aws_iam_role_policy_attachment.ecr_policy

  ]

  tags = {

    Name = var.node_group_name

  }

}
