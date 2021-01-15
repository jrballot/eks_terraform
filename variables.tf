variable "region" {
  default = "sa-east-1"
  description = "AWS São Paulo Region"
}


##
## EKS Variables
##
variable "eks_k8s_version" {
  default = "1.18"
  description = "AWS EKS's Kubernetes version"
}

variable "eks_cluster_name" {
  default = "ballot_eks"
  description = "AWS EKS Cluster Name"
}

variable "eks_node_group_name" {
  default = "ballot_eks_node_group"
  description = "AWS EKS Node Group Name"
}



##
## RDS Variables
##
variable "rds_cluster_identifier" {
  default = "ballot-rds"
  description = "RDS Cluster Identifier"
}

variable "rds_instance_class" {
  default = "db.m5.large"
  description = "RDS Instance Class. The m5.large is the latest model (01/2021) with 2vCPUS and 8GiB RAM"
}

variable "rds_engine" {
  default = "mariadb"
  description = "RDS Engine used"
}

variable "rds_engine_version" {
  default = "10.5"
  description = "RDS Engine version to be used"
}


##
## VPC Variables
##
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  description = "AWS EKS VPC cidr block"
}

variable "public_subnets" {
  default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
  description = "AWS EKS public networks"
}

variable "private_subnets" {
  default = ["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
  description = "AWS EKS private networks"
}
