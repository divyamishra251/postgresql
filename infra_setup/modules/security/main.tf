# Public Security Group
resource "aws_security_group" "public_sg" {
  name_prefix = "${var.project_name}-public-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-public-sg"
  }
}

# Private Security Group
resource "aws_security_group" "private_sg" {
  name_prefix = "${var.project_name}-private-sg"
  vpc_id      = var.vpc_id

  # Existing internal communication
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr, var.jenkins_vpc_cidr, var.public_subnet_cidr]
  }

  # ✅ Existing rule: Allow SSH from Jenkins SG
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins_sg.id]
    description     = "Allow SSH from Jenkins"
  }

  # ✅ NEW RULE: Allow SSH from Jenkins Private IP (manual access if needed)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.25.78/32"]
    description = "Allow SSH from Jenkins private IP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-private-sg"
  }
}

# Jenkins Communication Security Group
resource "aws_security_group" "jenkins_sg" {
  name_prefix = "${var.project_name}-jenkins-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.jenkins_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-jenkins-sg"
  }
}