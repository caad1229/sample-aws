terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60.0"
    }
  }

  required_version = ">= 1.9.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-05134c8ef96964280"
  instance_type = "t2.micro"

  tags = {
    Name = "Handson_SasakiSatoru_2"
    TED = "20240829_Handson"
    Environment = "development"
    Project = "mixi"
  }
}

module "rds-sasaki" {
  source  = "app.terraform.io/MIXI/rds-sasaki/aws"
  version = "1.0.0"
  # insert required variables here
}
