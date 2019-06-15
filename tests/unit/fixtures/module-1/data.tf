data "aws_subnet" "selected" {
  id = "${var.subnet_id}"
}

data "aws_vpc" "selected" {
  id = "${data.aws_subnet.selected.vpc_id}"
}

data "aws_route53_zone" "r3d3_route53_zone" {
  zone_id      = "${var.adaptor_dns_zone_id}"
  private_zone = false
}

locals {
  common_name = "${var.data_source}"

  # this is just an intermediate variable
  full_route53_record_fqdn = "${var.data_source}.${data.aws_route53_zone.r3d3_route53_zone.name}"

  # removing the last period at the end of fqdn
  route53_record_fqdn = "${substr(local.full_route53_record_fqdn, 0, length(local.full_route53_record_fqdn)-1)}"
}
