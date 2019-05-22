provider "aws" {
  region = "eu-north-1"
}

provider "aws" {
  alias = "paris"
  region = "eu-west-3"
}