resource "aws_ecr_repository" "main" {
  for_each = toset(var.ecrs)
  name     = each.key

  tags = { "Name" = each.key }
}
