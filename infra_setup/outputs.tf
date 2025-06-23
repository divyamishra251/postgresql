output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "public_instance_public_ip" {
  value = module.compute.public_instance_public_ip
}

output "private_instance_1_private_ip" {
  value = module.compute.private_instance_1_private_ip
}

output "private_instance_2_private_ip" {
  value = module.compute.private_instance_2_private_ip
}

output "nat_gateway_ip" {
  value = module.network.nat_gateway_ip
}

output "peering_connection_id" {
  value = module.network.peering_connection_id
}