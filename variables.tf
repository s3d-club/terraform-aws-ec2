variable "ami" {
  default     = null
  description = "The AMI Image"
  type        = string
}

variable "ami_suffix" {
  default = "arm64-gp2"
}

variable "cidrs" {
  type = list(string)

  description = <<-END
    a list of addresses for ssh ingress.
    https://go.s3d.club/tf/ec2/cidrs
    END
}

variable "cidr6s" {
  type = list(string)

  description = <<-END
    a list of addresses for ssh ingress.
    https://go.s3d.club/tf/ec2#cidr6s
    END
}

variable "domain" {
  type = string

  description = <<-END
    the domain for route53 registration.
    https://go.s3d.club/tf/ec2#domain
    END
}

variable "egress_cidrs" {
  type = list(string)

  description = <<-END
    a list of addresses for open egress.
    https://go.s3d.club/tf/ec2#egress_cidrs
    END
}

variable "egress_cidr6s" {
  type = list(string)

  description = <<-END
    a list of addresses for open egress.
    https://go.s3d.club/tf/ec2#egress_cidr6s
    END
}

variable "instance_type" {
  default     = "t4g.medium"
  description = "The AWS instance type"
  type        = string
}

variable "setup_ref" {
  default = "v0.1.8" # from dev-setup
  type    = string

  description = <<-EOT
		The reference string used to fetch the setup script"
		EOT
}

variable "subnet_id" {
  description = "The subnet_id"
  type        = string
}

variable "project" {
  default     = "s3d"
  description = "The project name"
  type        = string
}

variable "suffix" {
  default     = "1"
  description = "The name suffix"
  type        = string
}

variable "tags" {
  description = "Tags for the aws_instance"
  type        = map(string)
}

variable "template" {
  description = "The template to use"
  type        = string
}

variable "key_name" {
  description = "The EC2 Key Name"
  type        = string
}

variable "user" {
  default     = "s3d"
  description = "The user name"
  type        = string
}

variable "volume_size" {
  default = 50
  type    = number

  description = "Size of the volume in gibibytes"
}

variable "vpc_id" {
  type = string
}
