####################################
# EKS Cluster Security Group
####################################

resource "aws_security_group" "cluster_sg" {

  name        = "terraform-eks-cluster-sg"
  description = "Security Group for EKS Control Plane"
  vpc_id      = aws_vpc.eks_vpc.id

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "terraform-eks-cluster-sg"
  }
}

####################################
# Worker Node Security Group
####################################

resource "aws_security_group" "node_sg" {

  name        = "terraform-eks-node-sg"
  description = "Security Group for Worker Nodes"
  vpc_id      = aws_vpc.eks_vpc.id

  ingress {

    description = "Allow all traffic between worker nodes"

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    self = true

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "terraform-eks-node-sg"
  }
}

####################################
# Allow Worker Nodes to Communicate
# with EKS Control Plane
####################################

resource "aws_security_group_rule" "cluster_ingress_nodes" {

  type = "ingress"

  from_port = 443
  to_port   = 443

  protocol = "tcp"

  security_group_id = aws_security_group.cluster_sg.id

  source_security_group_id = aws_security_group.node_sg.id

  description = "Allow worker nodes to communicate with EKS API"

}

####################################
# Allow Control Plane to Communicate
# with Worker Nodes
####################################

resource "aws_security_group_rule" "nodes_ingress_cluster" {

  type = "ingress"

  from_port = 1025
  to_port   = 65535

  protocol = "tcp"

  security_group_id = aws_security_group.node_sg.id

  source_security_group_id = aws_security_group.cluster_sg.id

  description = "Allow control plane communication"

}
