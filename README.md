# 3-Tier-AWS-network-VPC-using-Terraform
Building infrastructure on AWS using IAAC tool (Terraform)

## Setup

This infrastructure is comprised of a VPC with public and private subnets in two availability zones.

An internet gateway will be used to allow communication between instances in the VPC and the internet. For high availability and fault tolerance, 2 availability zones are used. 

The public subnet will be used by the Nat gateway, Bastion Host, and ALB (Application Load Balancer). The private subnet on the other hand will house the webservers and the database for protection against unwanted access from the internet.

For the subnet associations, the Public route table will be associated with the public subnet by routing traffic through the internet gateway. The private subnet will be associated to the main route table.
