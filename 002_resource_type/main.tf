provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias = "paris"
  region = "eu-west-3"
}

resource "aws_instance" "web" {
  ami = "ami-1fb13961"
  instance_type = "t3.micro"
}

resource "aws_instance" "web_paris" {
  provider = "aws.paris"
  ami = "ami-0ebb3a801d5fb8b9b"
  instance_type = "t2.micro"
}
