# 3-Tier-AWS-network-VPC-using-Terraform
Building infrastructure on AWS using IAAC tool (Terraform)

## Terraform Modules
It doesn't take long before your main terraform file gets complicated with various configurations and becomes hard to debug or maintain. 

This is where breaking up your configuration structure and grouping resources that are used together will come in handy. Modules are containers 
for grouping similar resources that are used together. A module consists of a collection or group of .tf or .tf.json files kept together in a directory.

It is good practice to break up terraform file structures into smaller logical component groups.

For this project, I created 3 logical groups namely
  - Main.tf
  - Output.tf
  - Variables.tf
