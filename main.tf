provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0f58b397bc5c1f2e8" # Ubuntu 22.04 for ap-south-1
  instance_type = "t2.micro"
  key_name      = "My1stproject"  # Replace with your key pair name
  tags = {
    Name = "Terraform-Ansible-Project"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/My1stproject") # Update path
      host        = self.public_ip
    }
  }
}
