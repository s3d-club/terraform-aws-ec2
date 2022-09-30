variable "cidrs" {
  type = list(string)

  description = <<-END
    IP4 CIDRs
    https://go.s3d.club/ec2/cidrs
    END
}

variable "cidr6s" {
  type = list(string)

  description = <<-END
    IP6 CIDRs
    https://go.s3d.club/ec2/cidr6s
    END
}

variable "setup_ref" {
  default = "v0.1.0" # from dev-setup
  type    = string

  description = <<-EOT
		The reference string used to fetch the setup script"
		EOT
}

variable "tags" {
  description = "Tags for the aws_instance"
  type        = map(string)
}

variable "domain" {
  description = "The domain name"
  type        = string
}

variable "subnet_id" {
  default     = null
  description = "The subnet_id (or null for the default)"
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

variable "user" {
  default     = "s3d"
  description = "The user name"
  type        = string
}

variable "ami_suffix" {
  default = "arm64-gp2"
}

variable "ami" {
  default     = null
  description = "The AMI Image"
  type        = string
}

variable "template" {
  description = "The template to use"
  type        = string
}

variable "instance_type" {
  default     = "t4g.medium"
  description = "The AWS instance type"
  type        = string
}

variable "key_name" {
  description = "The EC2 Key Name"
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
