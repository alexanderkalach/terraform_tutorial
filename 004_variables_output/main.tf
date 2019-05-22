provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias = "paris"
  region = "eu-west-3"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "web" {
  ami = "${var.ec2_ami}"
  instance_type = "t3.micro"
}

resource "aws_instance" "web_paris" {
  provider = "aws.paris"
  ami = "ami-0ebb3a801d5fb8b9b"
  instance_type = "t2.micro"
}

variable "ec2_ami" {
  #default = "ami-1fb13961"
}

output "vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "ec2_arn_paris" {
  value = "${aws_instance.web_paris.arn}"
}

