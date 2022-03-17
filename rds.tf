module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "4.1.3"

  identifier = "mercator"

  engine               = "postgres"
  engine_version       = "11.14"
  family               = "postgres11"
  major_engine_version = "11"
  instance_class       = "db.t3.medium"

  allocated_storage     = 20
  max_allocated_storage = 100

  db_name  = "mercator"
  username = "mercator"
  port     = 5432

  multi_az             = true
  db_subnet_group_name = module.vpc.database_subnet_group
  vpc_security_group_ids = [aws_security_group.main.id]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]

}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.db.db_instance_address
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = nonsensitive(module.db.db_instance_username)
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = nonsensitive(module.db.db_instance_password)
}