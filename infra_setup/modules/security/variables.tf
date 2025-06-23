variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block of the public subnet"
  type        = string
}

variable "jenkins_vpc_cidr" {
  description = "CIDR block of the Jenkins VPC"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}