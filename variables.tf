variable "ami_id" {
  default = null
  type    = string

  description = <<-EOT
    An AMI ID.
    EOT
}

variable "ami_suffix" {
  default = "arm64-gp2"
  type    = string

  description = <<-EOT
    An AMI suffix that is used to find an ami when ami_id is null.
    EOT
}

variable "domain" {
  type = string

  description = <<-EOT
    The domain for route53 registration.
    EOT
}

variable "egress_cidr6s" {
  default = []
  type    = list(string)

  description = <<-EOT
    A list of addresses for open egress.
    EOT
}

variable "egress_cidrs" {
  type = list(string)

  description = <<-EOT
    A list of addresses for open egress.
    EOT
}

variable "instance_type" {
  default = "t4g.medium"
  type    = string

  description = <<-EOT
    An AWS EC2 instance type.
    EOT
}

variable "key_name" {
  type = string

  description = <<-EOT
    An EC2 keyname.
    EOT
}

variable "name_prefix" {
  type = string

  description = <<-EOT
    An prefix for naming resources.
    EOT
}

variable "setup_ref" {
  default = "v0.1.16" # from dev-setup
  type    = string

  description = <<-EOT
    A version used when fetching the setup script.
    EOT
}

variable "ssh_cidr6s" {
  default = []
  type    = list(string)

  description = <<-EOT
    A list of addresses for ssh ingress.
    EOT
}

variable "ssh_cidrs" {
  type = list(string)

  description = <<-EOT
    A list of addresses for ssh ingress.
    EOT
}

variable "subnet_id" {
  type = string

  description = <<-EOT
    A subnet_id.
    EOT
}

variable "tags" {
  type = map(string)

  description = <<-EOT
    Aa map of tags for resources.
    EOT
}

variable "template" {
  default = "work"
  type    = string

  description = <<-EOT
    A template to use for setting up the image.
    EOT
}

variable "username" {
  default = "s3d"
  type    = string

  description = <<-EOT
    A username.
    EOT
}

variable "volume_size" {
  default = 50
  type    = number

  description = <<-EOT
    An size in GiB for the volume.
    EOT
}

variable "vpc_id" {
  type = string

  description = <<-EOT
    A vpc id.
    EOT
}
