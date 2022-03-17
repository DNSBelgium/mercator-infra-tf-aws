module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.7.2"

  cluster_name    = local.appname
  cluster_version = "1.21"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      root_volume_type = "gp3"
      disk_size        = 50
      instance_types   = ["t3.2xlarge"]

      create_launch_template = false
      launch_template_name   = ""

      min_size     = 1
      max_size     = 10
      desired_size = 1
    }
  }

  tags = {
    Name = local.appname
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
