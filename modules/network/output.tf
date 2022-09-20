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

output "application_load_balancer_dns_name" {
  value = aws_lb.application-lb.dns_name
}