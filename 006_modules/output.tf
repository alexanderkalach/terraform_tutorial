output "vpc_id" {
  value = "${data.aws_vpc.default.id}"
}

output "ec2_arn_paris" {
  value = "${module.ec2_instances.ec2_arn_paris}"
}

output "example_vpc_id" {
  value = "${module.vpc_example_complete-vpc.vpc_id}"
}
