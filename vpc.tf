####################################
# VPC
####################################

resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-eks-vpc"
  }
}

####################################
# Public Subnets
####################################

resource "aws_subnet" "public_subnets" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"

    "kubernetes.io/role/elb" = "1"
  }
}

####################################
# Private Subnets
####################################

resource "aws_subnet" "private_subnets" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.eks_vpc.id

  cidr_block = cidrsubnet(
    var.vpc_cidr,
    8,
    count.index + length(var.availability_zones)
  )

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"

    "kubernetes.io/role/internal-elb" = "1"
  }
}

####################################
# Internet Gateway
####################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "terraform-eks-igw"
  }
}

####################################
# Elastic IP
####################################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name = "terraform-eks-eip"
  }
}

####################################
# NAT Gateway
####################################

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public_subnets[0].id

  tags = {
    Name = "terraform-eks-nat"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}

####################################
# Public Route Table
####################################

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.eks_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {

    Name = "public-route-table"

  }
}

####################################
# Public Route Association
####################################

resource "aws_route_table_association" "public_assoc" {

  count = length(var.availability_zones)

  subnet_id = aws_subnet.public_subnets[count.index].id

  route_table_id = aws_route_table.public_rt.id
}

####################################
# Private Route Table
####################################

resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.eks_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat.id

  }

  tags = {

    Name = "private-route-table"

  }
}

####################################
# Private Route Association
####################################

resource "aws_route_table_association" "private_assoc" {

  count = length(var.availability_zones)

  subnet_id = aws_subnet.private_subnets[count.index].id

  route_table_id = aws_route_table.private_rt.id
}
