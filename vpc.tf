module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name = "${local.appname}-vpc"

  cidr             = "10.0.0.0/16"
  azs              = slice(data.aws_availability_zones.available.names, 0, local.number_az)
  private_subnets  = slice(["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"], 0, local.number_az)
  public_subnets   = slice(["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"], 0, local.number_az)
  database_subnets = slice(["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"], 0, local.number_az)

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    "Name" = "${local.appname}-vpc"
  }

  public_subnet_tags = {
    "Name" = "${local.appname}-public-subnet"
  }

  private_subnet_tags = {
    "Name" = "${local.appname}-private-subnet"
  }
}

module "vpc_endpoints" {
  source = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"

  vpc_id             = module.vpc.vpc_id
  security_group_ids = [data.aws_security_group.default.id]
  subnet_ids          = module.vpc.private_subnets

  endpoints = {
    s3 = {
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    },
    autoscaling = {
      service             = "autoscaling"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    ecr_api = {
      service             = "ecr.api"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    ecr_dkr = {
      service             = "ecr.dkr"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    kms = {
      service             = "kms"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    sqs = {
      service             = "sqs"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
    sts = {
      service             = "sts"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.main.id]
      tags                = {}
    },
  }
}

output "vpc_database_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

output "vpc_private_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}
