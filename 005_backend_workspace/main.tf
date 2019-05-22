provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias = "paris"
  region = "eu-west-3"
}

terraform {
  backend "s3" {
    bucket = "terraform-tutorial-state"
    key    = "state.tfstate"
    region = "eu-central-1"
  }
}

data "aws_vpc" "default" {
  default = true
}

locals {
  tags = {
    Env = "${var.environment}"
  }
}


resource "aws_instance" "web" {
  ami = "${var.ec2_ami}"
  instance_type = "t3.micro"

  tags = "${local.tags}"
}

resource "aws_instance" "web_paris" {
  provider = "aws.paris"
  ami = "ami-0ebb3a801d5fb8b9b"
  instance_type = "t2.micro"

  tags = "${local.tags}"
}

resource "null_resource" "validate_env" {
  count = "${var.environment == terraform.workspace ? 0 : 1}"
  "Env ${var.environment} != workspace ${terraform.workspace}" = true
}


variable "ec2_ami" {
  #default = "ami-1fb13961"
}

variable "environment" {
  
}


output "vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "ec2_arn_paris" {
  value = "${aws_instance.web_paris.arn}"
}

