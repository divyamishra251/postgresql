variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

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

variable "jenkins_vpc_cidr" {
  description = "CIDR block of the Jenkins VPC"
  type        = string
}

variable "jenkins_route_table_id" {
  description = "Route table ID of the Jenkins VPC"
  type        = string
}