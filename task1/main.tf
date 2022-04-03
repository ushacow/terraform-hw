terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region  = "eu-west-1"
    default_tags {
      tags = {
        Owner = "olga.uhina"
      }
    }
}


resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"

}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}
