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

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  environment        = var.environment
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  instance_count    = var.instance_count
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  instance_name     = var.instance_name
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.security_group_id
  key_name          = var.key_name
  root_volume_size  = var.root_volume_size
  environment       = var.environment
}
