resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.vpc_ecs.id
    cidr_block = "10.0.32.0/20"

    availability_zone = format("%sa", var.aws_region)

    tags = {
      Name = "private-1a"
     "Owner" = var.owner_name
     "Department" = var.department_name
    }

}



resource "aws_subnet" "private_subnet_1c" {
    vpc_id = aws_vpc.vpc_ecs.id
    cidr_block = "10.0.48.0/20"

    availability_zone = format("%sc", var.aws_region)

   tags = {
      Name = "private-1c"
     "Owner" = var.owner_name
     "Department" = var.department_name
    }
}

resource "aws_route_table_association" "private1a" {
  subnet_id = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat.id
}

resource "aws_route_table_association" "private1c" {
  subnet_id = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.nat.id
}