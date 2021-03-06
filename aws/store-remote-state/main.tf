# https://learn.hashicorp.com/tutorials/terraform/aws-remote?in=terraform/aws-get-started
# see ../s3/backend.tf

terraform {
  backend "remote" { # https://app.terraform.io/app/moonwave/workspaces/moonwave-apps/runs
    # hostname = "moonwave.org" # if hosted at moonwave.org
    organization = "moonwave"   # configured in app.terraform.io

    workspaces {
      name = "moonwave-apps"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  #tags = {
  #  # https://learn.hashicorp.com/tutorials/terraform/aws-variables?in=terraform/aws-get-started
  #  # Name = "ExampleAppServerInstance"
  #  Name = var.instance_name
  #}
}
