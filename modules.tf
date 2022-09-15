module "network" {
  source = "./modules/network"

  aws_region      = var.aws_region
  owner_name      = var.owner_name
  department_name = var.department_name
}
