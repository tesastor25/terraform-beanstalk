provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.region
}

module "elastic_beanstalk" {
  source = "./modules/elastic_beanstalk"
  
  # Define variables for Elastic Beanstalk module
}

module "rds" {
  source = "./modules/rds"
  
  # Define variables for RDS module
}

module "alb" {
  source = "./modules/alb"
  
  # Define variables for ALB module
}