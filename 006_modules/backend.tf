terraform {
  backend "s3" {
    bucket = "terraform-tutorial-state"
    key    = "state.tfstate"
    region = "eu-central-1"
  }
}