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

resource "aws_instance" "app_server" {
 ami = "ami-08ca3fed11864d6bb"
 instance_type = "t1.micro"
 key_name = "x19190638_balazs_barcza_NEW"
 tags = {
   Name = "x19190638_balazs_barcza_terraform"
 }
}

