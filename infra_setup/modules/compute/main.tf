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
      sudo cp /var/lib/jenkins/workspace/postgresql-infra/apsouth.pem /tmp/apsouth.pem && \
      sudo chown jenkins:jenkins /tmp/apsouth.pem && \
      sudo chmod 400 /tmp/apsouth.pem
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
      "sudo mv /tmp/apsouth.pem /var/lib/jenkins/workspace/postgresql-infra/apsouth.pem",
      "sudo chown jenkins:jenkins /var/lib/jenkins/workspace/postgresql-infra/apsouth.pem",
      "sudo chmod 400 /var/lib/jenkins/workspace/postgresql-infra/apsouth.pem"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/tmp/apsouth.pem")
      host        = self.public_ip
    }
  }
}
