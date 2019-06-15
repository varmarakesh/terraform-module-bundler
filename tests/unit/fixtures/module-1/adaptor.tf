resource "aws_autoscaling_group" "adaptor" {
  name             = "${local.common_name}"
  max_size         = 1
  min_size         = 1
  desired_capacity = 1

  # The conditions for self recovering instance max = min = desired

  # in seconds
  health_check_grace_period = 60
  health_check_type    = "EC2"
  force_delete         = true
  launch_configuration = "${var.lc_name}"
  vpc_zone_identifier = [
    "${data.aws_subnet.selected.id}",
  ]
  tags = [
    {
      key                 = "Name"
      value               = "${local.common_name}"
      propagate_at_launch = true
    },
    {
      key                 = "idf:r3d3:env"
      value               = "${var.env}"
      propagate_at_launch = true
    },
    {
      key                 = "intuit:billing:user-app"
      value               = "${var.component}"
      propagate_at_launch = true
    },
    {
      key                 = "idf:r3d3:dataset"
      value               = "r3d3-${var.data_source}"
      propagate_at_launch = true
    },
    {
      key                 = "intuit:billing:component"
      value               = "idf.cdcingest.r3d3"
      propagate_at_launch = true
    },
    {
      key                 = "terraform"
      value               = "1"
      propagate_at_launch = true
    },
    {
      key                 = "DomainMeta"
      value               = "${var.adaptor_dns_zone_id}"
      propagate_at_launch = true
    },
    {
      key                 = "hostname"
      value               = "${local.route53_record_fqdn}"
      propagate_at_launch = true
    },
    {
      key                 = "intuit:ami:source"
      value               = "${var.intuit_ami_source_tag}"
      propagate_at_launch = true
    },
  ]
}
