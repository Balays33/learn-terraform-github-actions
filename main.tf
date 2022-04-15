terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

   cloud {
    organization = "balays33"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
 profile = "default"
 region = "eu-west-1"
}

#resource "aws_instance" "app_server" {
# ami = "ami-08ca3fed11864d6bb"
# instance_type = "t1.micro"
# key_name = "x19190638_balazs_barcza_NEW"
# tags = {
#   Name = "x19190638_balazs_barcza_terraform"
# }
#}
#aws instance creation
resource "aws_instance" "web_app" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.medium"
  subnet_id     = "subnet-01f7f9c5b9fc99986"
  associate_public_ip_address = true
  key_name = "x19190638_balazs_barcza_NEW"
  vpc_security_group_ids = ["sg-0268ecbf418effd94"]

  tags = {
    Name = "x19190638_balazs_barcza_NEW_webapp"
  }
  
}
