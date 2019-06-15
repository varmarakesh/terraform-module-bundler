output "adaptor_asg_name" {
  value       = "${aws_autoscaling_group.adaptor.name}"
  description = "ASG name"
}
