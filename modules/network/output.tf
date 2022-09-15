output "vpc_ecs" {
  value = aws_vpc.vpc_ecs
}

output "private_subnet_1a" {
  value = aws_subnet.private_subnet_1a
}

output "private_subnet_1c" {
  value = aws_subnet.private_subnet_1c
}

output "public_subnet_1a" {
  value = aws_subnet.public_subnet_1a
}

output "public_subnet_1c" {
  value = aws_subnet.public_subnet_1c
}

output "alb_hostname" {
  value = aws_alb.application-lb.dns_name
}