resource "aws_instance" "web" {
  ami = "${var.ec2_ami}"
  instance_type = "t3.micro"

  tags = "${var.tags}"
}

resource "aws_instance" "web_paris" {
  provider = "aws.paris"
  ami = "ami-0ebb3a801d5fb8b9b"
  instance_type = "t2.micro"

  tags = "${var.tags}"
}