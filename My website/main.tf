#configure provider for aws
provider "aws" {
  region = var.region
  profile = "default"
}

#reference and create vpc
module "vpc" {
  source                        = "../Modules/vpc"
  region                        = var.region
  project_name                  = var.project_name
  vpc_cidr                      = var.vpc_cidr
  public_subnet_az1_cidr        = var.public_subnet_az1_cidr
  public_subnet_az2_cidr        = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr   = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr   = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr  = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr  = var.private_data_subnet_az2_cidr
}

# reference and create nat gateway
module "nat_gateway" {
  source = "../Modules/nat-gateway"
  public_subnet_az1_id        = module.vpc.public_subnet_az1_id
  internet_gateway            = module.vpc.internet_gateway
  public_subnet_az2_id        = module.vpc.public_subnet_az2_id
  vpc_id                      = module.vpc.vpc_id
  private_app_subnet_az1_id   = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id   = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az1_id  = module.vpc.private_data_subnet_az1_id
  private_data_subnet_az2_id  = module.vpc.private_data_subnet_az2_id
}

#reference and create security groups

module "security_group" {
  source = "../Modules/security-groups"
  vpc_id =  module.vpc.vpc_id
}