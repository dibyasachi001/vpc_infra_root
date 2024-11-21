module "VPC_module" {
#  source   = "./module_vpc1st/VPC_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/VPC_module"
  vpc_cidr = var.vpc_cidr
  prefix   = var.prefix_vpc
}

module "Pub_Sub_module" {
  # source             = "./module_vpc1st/Pub_Sub_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/Pub_Sub_module"
  vpc_id             = module.VPC_module.vpc_id
  pub_sub_cidr       = var.pub_sub_cidr
  availability_zones = var.availability_zones
}

module "Pvt_Sub_module" {
  # source             = "./module_vpc1st/Pvt_Sub_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/Pvt_Sub_module"
  vpc_id             = module.VPC_module.vpc_id
  pvt_sub_cidr       = var.pvt_sub_cidr
  availability_zones = var.availability_zones
}

module "IGW_module" {
  # source     = "./module_vpc1st/IGW_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/IGW_module"
  vpc_id     = module.VPC_module.vpc_id
  prefix_vpc = var.prefix_vpc
}

module "Pub_rt_module" {
  # source       = "./module_vpc1st/Pub_rt_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/Pub_rt_module"
  vpc_id       = module.VPC_module.vpc_id
  igw_id       = module.IGW_module.internet_gateway_id
  subnetids    = module.Pub_Sub_module.public_subnet_ids
  prefix_pubrt = var.prefix_pubrt
}

module "Pvt_rt_module" {
  # source       = "./module_vpc1st/Pvt_rt_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/Pvt_rt_module"
  vpc_id       = module.VPC_module.vpc_id
  subnetids    = module.Pvt_Sub_module.private_subnet_ids
  prefix_pvtrt = var.prefix_pvtrt
}

module "SG_module" {
  # source     = "./module_vpc1st/SG_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/SG_module"
  vpc_id     = module.VPC_module.vpc_id
  prefix_sg  = var.prefix_sg
  web_server = var.web_server
}

module "EC2_module" {
  # source         = "./module_vpc1st/EC2_module"
  source = "github.com/dibyasachi001/simple_vpc_infra/tree/main/EC2_module"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  ec2_key_name       = var.ec2_key_name
  ec2_subnet_id = var.ec2_instance_type == "public" ? module.Pub_Sub_module.public_subnet_ids[var.ec2_subnet_index - 1] : module.Pvt_Sub_module.private_subnet_ids[var.ec2_subnet_index - 1]
  ec2_sg_id     = tolist([module.SG_module.security_group_id])
#  instance_count = var.instance_count
  ec2_name = var.ec2_name
}