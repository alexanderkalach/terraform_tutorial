module "ec2_instances" {
  source = "ec2"
  
  ec2_ami = "${var.ec2_ami}"
  tags = "${local.tags}"

  providers = {
      "aws.paris" = "aws.paris"
  }
}
