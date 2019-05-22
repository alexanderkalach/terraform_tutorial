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

locals {
  tags = {
    Env = "${var.environment}"
  }
}











