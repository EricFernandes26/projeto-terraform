resource "aws_vpc" "vpc_ecs" {
  cidr_block    = "10.0.0.0/16"

  enable_dns_hostnames  = true
  enable_dns_support    = true

   tags = {
      Name = "vpc_ecs"
     "Owner" = var.owner_name
     "Department" = var.department_name
   }
}