# Public Instance (Jenkins EC2)
resource "aws_instance" "public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name != "" ? var.key_name : null
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.public_sg_id, var.jenkins_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-public-instance"
  }

  provisioner "local-exec" {
    command = <<EOT
      cp /var/lib/jenkins/workspace/postgresql-infra/apsouth.pem /tmp/apsouth.pem && \
      chown jenkins:jenkins /tmp/apsouth.pem && \
      chmod 400 /tmp/apsouth.pem
    EOT
  }

  provisioner "file" {
    source      = "/tmp/apsouth.pem"
    destination = "/tmp/apsouth.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/tmp/apsouth.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/apsouth.pem /var/lib/jenkins/apsouth.pem",
      "sudo chown jenkins:jenkins /var/lib/jenkins/apsouth.pem",
      "sudo chmod 400 /var/lib/jenkins/apsouth.pem"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/tmp/apsouth.pem")
      host        = self.public_ip
    }
  }
}

# Private Instance 1 (PostgreSQL Node 1)
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

# Private Instance 2 (PostgreSQL Node 2)
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
