packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "mongodb-example" {
  # access_key    = var.aws_access_key
  # secret_key    = var.aws_secret_key
  region        = "ap-southeast-2"
  source_ami    = "ami-05c029a4b57edda9e"
  instance_type = "t2.micro"
  ssh_username  = "ec2-user"
  ami_name      = "mongodb {{timestamp}}"
}

build {
  sources = ["source.amazon-ebs.mongodb-example"]

  provisioner "ansible" {
    playbook_file = "./playbook-mongo-v3.yml"
  }
}