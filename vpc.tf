
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  cluster_name = format("poc-eks-%s",random_string.suffix.result)
}

resource "random_string" "suffix" {
  length = 8
  special = false
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    format("kubernetes.io/cluster/%s",var.eks_cluster_name) = "shared"
  }
}

resource "aws_subnet" "public" {
  count = 3
  vpc_id = aws_vpc.main.id
  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  

  tags = {
    format("kubernetes.io/cluster/%s",var.eks_cluster_name) = "shared"
    "kubernetes.io/cluster/elb" = "1"
  }
}

#resource "aws_subnet" "private" {
#  count= 3
#  vpc_id = aws_vpc.main.id
#  availability_zone = data.aws_availability_zones.available.names[count.index]
#  cidr_block = var.private_subnets[count.index]
#  
#
#  tags = {
#    format("kubernetes.io/cluster/%s",var.eks_cluster_name) = "shared"
#    "kubernetes.io/cluster/internal-elb" = "1"
#  }
#}



resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}
 
resource "aws_route" "main" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

