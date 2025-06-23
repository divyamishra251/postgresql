# Public Instance
resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name != "" ? var.key_name : null
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id, var.jenkins_sg_id]


  tags = {
    Name = "${var.project_name}-public-instance"
  }
}

# Private Instance 1
resource "aws_instance" "private_1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name != "" ? var.key_name : null
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id, var.jenkins_sg_id]

  
  tags = {
    Name = "${var.project_name}-private-instance-1"
  }
}

# Private Instance 2
resource "aws_instance" "private_2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name != "" ? var.key_name : null
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.private_sg_id, var.jenkins_sg_id]


  tags = {
    Name = "${var.project_name}-private-instance-2"
  }
}