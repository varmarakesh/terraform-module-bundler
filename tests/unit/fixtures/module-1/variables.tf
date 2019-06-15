variable "env" {
  description = "Intuit AWS environment"
  default     = "e2e"
  type        = "string"
}

variable "component" {
  description = "Component name"
  default     = "r3d3-adaptor"
  type        = "string"
}

variable "data_source" {
  description = "The data source for which the adaptor is being setup. Eg: oii"
  default     = ""
  type        = "string"
}

variable "subnet_id" {
  description = "Private subnet id. Rotate different subnets for different adaptors as they will be setup in different AZ"
  default     = ""
  type        = "string"
}

variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
  type        = "string"
}

variable "team_contact" {
  default     = ""
  description = "Contact person"
  type        = "string"
}

variable "adaptor_dns_zone_id" {
  description = "Route 53 zone where route53 record has to be created."
  default     = ""
  type        = "string"
}

variable "lc_name" {
  description = "launch configuration name to be used for creating asg"
  default     = ""
  type        = "string"
}

variable "intuit_ami_source_tag" {
  description = "ami source tag value, intuit:ami:source"
  default     = ""
  type        = "string"
}
