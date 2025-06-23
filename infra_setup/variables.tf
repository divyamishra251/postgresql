variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
  default     = "ap-south-1a"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "postgres"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "apsouth"
}

variable "jenkins_vpc_id" {
  description = "VPC ID of the Jenkins server"
  type        = string
  default     = "vpc-08d79fe0ccd617e84"
}

variable "jenkins_vpc_cidr" {
  description = "CIDR block of the Jenkins VPC"
  type        = string
  default     = "172.31.0.0/16"
}

variable "jenkins_route_table_id" {
  description = "Route table ID of the Jenkins VPC"
  type        = string
  default     = "rtb-0cc5f7e5011a1f418"
}