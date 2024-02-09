provider "aws" {
  region = var.region
}

module "security_group" {
  source = "./security_group"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [var.security_group_name]  # Using the security group name variable here


  user_data = file("${path.module}/script.sh")
  tags = {
    Name = "Workflow-Backend"
  }
}
