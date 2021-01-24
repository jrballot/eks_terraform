# Simple POC about creating a MultiAZ AWS EKS cluster with Terraform

This project has the only objective of document a simple way for the creation of a AWS EKS cluster using multiple zones and also leveraging Terraform as a IaC tool.

The AWS services used are:

- AWS VPC - For networking and subnets
- AWS S3 - For keeping the tfstate file, usefull when working in groups
- AWS DynamoDB - For keeping the lock files for Terraform
- AWS EKS - Elastic Kubernetes Service

This cluster was designed with the Public-only architecture for EKS. You could also use this files and add some NAT gateway to a private subnet in order to migrate this architecture to a Public+Private network solution.
