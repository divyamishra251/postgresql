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

  # Provisioner to copy PEM file to Jenkins EC2 instance
  provisioner "file" {
    source      = "/home/divya/Downloads/apsouth.pem"
    destination = "/tmp/apsouth.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/divya/Downloads/apsouth.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/apsouth.pem /var/lib/jenkins/apsouth.pem",
      "sudo cp /var/lib/jenkins/apsouth.pem /home/ubuntu/oneclick_infra/apsouth.pem",
      "sudo chown jenkins:jenkins /var/lib/jenkins/apsouth.pem",
      "sudo chmod 400 /var/lib/jenkins/apsouth.pem"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/divya/Downloads/apsouth.pem")
      host        = self.public_ip
    }
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
