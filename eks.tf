####################################
# Amazon EKS Cluster
####################################

resource "aws_eks_cluster" "eks_cluster" {

  name     = var.cluster_name
  version  = var.kubernetes_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    subnet_ids = concat(
      aws_subnet.public_subnets[*].id,
      aws_subnet.private_subnets[*].id
    )

    security_group_ids = [
      aws_security_group.cluster_sg.id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true

  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]

  tags = {
    Name = var.cluster_name
  }

}
