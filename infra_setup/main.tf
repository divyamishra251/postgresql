terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Network Module
module "network" {
  source = "./modules/network"

  vpc_cidr               = var.vpc_cidr
  public_subnet_cidr     = var.public_subnet_cidr
  private_subnet_cidr    = var.private_subnet_cidr
  availability_zone      = var.availability_zone
  project_name           = var.project_name
  jenkins_vpc_id         = var.jenkins_vpc_id
  jenkins_vpc_cidr       = var.jenkins_vpc_cidr
  jenkins_route_table_id = var.jenkins_route_table_id
}

# Security Module
module "security" {
  source = "./modules/security"

  vpc_id             = module.network.vpc_id
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  jenkins_vpc_cidr   = var.jenkins_vpc_cidr
  project_name       = var.project_name
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  public_sg_id      = module.security.public_sg_id
  private_sg_id     = module.security.private_sg_id
  jenkins_sg_id     = module.security.jenkins_sg_id
  project_name      = var.project_name
}