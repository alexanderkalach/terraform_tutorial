
output "ec2_arn_paris" {
  value = "${aws_instance.web_paris.arn}"
}