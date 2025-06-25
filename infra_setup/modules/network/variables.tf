variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "jenkins_vpc_id" {
  description = "VPC ID of the Jenkins server"
  type        = string
}

variable "jenkins_route_table_id" {
  description = "Route table ID of the Jenkins VPC"
  type        = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "jenkins_vpc_cidr" {
  default = "172.31.0.0/16"
}
