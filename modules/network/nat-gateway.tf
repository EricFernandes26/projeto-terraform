resource "aws_eip" "vpc_iep" {
    vpc = true

    tags = {
      Name = "eip"
     "Owner" = var.owner_name
     "Department" = var.department_name
   }
}

resource "aws_nat_gateway" "nat" {
    allocation_id   = aws_eip.vpc_iep.id
    subnet_id       = aws_subnet.public_subnet_1a.id

   tags = {
      Name = "nat_gateway"
     "Owner" = var.owner_name
     "Department" = var.department_name
   }
}

resource "aws_route_table" "nat" {
    vpc_id = aws_vpc.vpc_ecs.id

    tags = {
      Name = "private-route"
     "Owner" = var.owner_name
     "Department" = var.department_name
   }
}

resource "aws_route" "nat_access" {
    route_table_id = aws_route_table.nat.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
}