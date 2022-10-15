variable "ami_id" {
  default = null
  type    = string

  description = <<-EOT
    an AMI ID.
    https://go.s3d.club/tf/ec2#ami_id
    EOT
}

variable "ami_suffix" {
  default = "arm64-gp2"

  description = <<-EOT
    an AMI suffix that is used to find an ami when ami_id is null.
    https://go.s3d.club/tf/ec2#ami_suffix
    EOT
}

variable "ssh_cidrs" {
  type = list(string)

  description = <<-EOT
    a list of addresses for ssh ingress.
    https://go.s3d.club/tf/ec2#ssh_cidrs
    EOT
}

variable "ssh_cidr6s" {
  default = []
  type    = list(string)

  description = <<-EOT
    a list of addresses for ssh ingress.
    https://go.s3d.club/tf/ec2#ssh_cidr6s
    EOT
}

variable "domain" {
  type = string

  description = <<-EOT
    the domain for route53 registration.
    https://go.s3d.club/tf/ec2#domain
    EOT
}

variable "egress_cidrs" {
  type = list(string)

  description = <<-EOT
    a list of addresses for open egress.
    https://go.s3d.club/tf/ec2#egress_cidrs
    EOT
}

variable "egress_cidr6s" {
  default = []
  type    = list(string)

  description = <<-EOT
    a list of addresses for open egress.
    https://go.s3d.club/tf/ec2#egress_cidr6s
    EOT
}

variable "instance_type" {
  default = "t4g.medium"
  type    = string

  description = <<-EOT
    an AWS EC2 instance type.
    https://go.s3d.club/tf/ec2#instance_type
    EOT
}

variable "name_prefix" {
  type = string

  description = <<-EOT
    an prefix for naming resources.
    https://go.s3d.club/tf/ec2#name_prefix
    EOT
}

variable "setup_ref" {
  default = "v0.1.8" # from dev-setup
  type    = string

  description = <<-EOT
    a version used when fetching the setup script.
    https://go.s3d.club/tf/ec2#setup_ref
    EOT
}

variable "subnet_id" {
  type = string

  description = <<-EOT
    a subnet_id.
    https://go.s3d.club/tf/ec2#subnet_id
    EOT
}

variable "tags" {
  type = map(string)

  description = <<-EOT
    a map of tags for resources.
    https://go.s3d.club/tf/ec2#tags
    EOT
}

variable "template" {
  default = "work"
  type    = string

  description = <<-EOT
    a template to use for setting up the image.
    https://go.s3d.club/tf/ec2#template
    EOT
}

variable "key_name" {
  type = string

  description = <<-EOT
    an EC2 keyname.
    https://go.s3d.club/tf/ec2#key_name
    EOT
}

variable "username" {
  default = "s3d"
  type    = string

  description = <<-EOT
    an username.
    https://go.s3d.club/tf/ec2#username
    EOT
}

variable "volume_size" {
  default = 50
  type    = number

  description = <<-EOT
    an size in GiB for the volume.
    https://go.s3d.club/tf/ec2#volume_size
    EOT
}

variable "vpc_id" {
  type = string

  description = <<-EOT
    a vpc id.
    https://go.s3d.club/tf/ec2#vpc_id
    EOT
}
