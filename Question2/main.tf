provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  name_prefix          = var.name_prefix
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
  rds_subnet_cidr      = var.rds_subnet_cidr
  availability_zone    = var.availability_zone
  tags                 = var.tags
  nat_gateway          = module.nat_gateway.nat_gateway_id
}

module "bastion" {
  source                         = "./modules/ec2"
  ami                            = var.bastion_ami
  instance_type                  = var.bastion_instance_type
  subnet_id                      = module.vpc.public_subnet_id
  vpc_id                         = module.vpc.vpc_id
  key_name                       = var.bastion_key_name
  allowed_ips                    = var.bastion_allowed_ips
  allowed_ports                  = var.bastion_allowed_ports
  security_group_name_prefix     = "bastion-sg-"
  volume_size                    = var.bastion_volume_size
  volume_type                    = var.bastion_volume_type
  tags                           = var.tags
}

module "alb" {
  source                 = "./modules/alb"
  name_prefix            = var.alb_name_prefix
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = [module.vpc.public_subnet_id]
  enable_https           = var.alb_enable_https
  ssl_policy             = var.alb_ssl_policy
  certificate_arn        = var.alb_certificate_arn
  target_group_port      = var.alb_target_group_port   # Corrigido o nome da variável
  health_check_interval = var.alb_health_check_interval
  health_check_path      = var.alb_health_check_path
  health_check_timeout   = var.alb_health_check_timeout
  tags                   = var.tags
  allowed_ips            = var.alb_allowed_ips
}


module "nat_gateway" {
  source = "./modules/nat_gateway"

  name_prefix       = var.nat_gateway_name_prefix
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_ids = [
    module.vpc.private_subnet_id,
    module.vpc.rds_subnet_id
  ]
  tags = var.tags
}

module "rds" {
  source                    = "./modules/rds"
  allocated_storage         = var.rds_allocated_storage
  storage_type              = var.rds_storage_type
  engine                    = var.rds_engine
  instance_class            = var.rds_instance_class
  db_name                   = var.rds_db_name
  username                  = var.rds_username
  password                  = var.rds_password
  iops                      = var.rds_iops
  vpc_id                    = module.vpc.vpc_id
  subnet_ids                =[module.vpc.rds_subnet_id]
  allowed_ips               =[var.private_subnet_cidr]
  security_group_name_prefix = "rds-sg-"
  tags                      = var.tags
  name_prefix               = var.name_prefix
}


module "asg" {
  source                   = "./modules/asg"
  name_prefix              = var.asg_name_prefix
  ami                      = var.asg_ami
  min_size                 = var.asg_min_size
  vpc_id                   = module.vpc.vpc_id
  max_size                 = var.asg_max_size
  desired_capacity         = var.asg_desired_capacity
  instance_type            = var.asg_instance_type
  volume_size              = var.asg_volume_size
  volume_type              = var.asg_volume_type
  subnet_id                = module.vpc.private_subnet_id
  key_name                 = var.asg_key_name
  sg_ids                   = [module.alb.alb_security_group_id]
  tags                     = var.tags
  scale_out_adjustment     = var.asg_scale_out_adjustment
  cooldown                 = var.asg_cooldown
  scale_in_adjustment       = var.asg_scale_in_adjustment
}
