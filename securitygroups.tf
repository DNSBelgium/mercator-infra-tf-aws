resource "aws_security_group" "main" {
  name_prefix = "vpc-endpoint"
  description = "Allow all inbound traffic from VPC"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow all TCP traffic from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }
}
