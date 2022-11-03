data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-${var.ami_suffix}"]
  }
}

data "aws_route53_zone" "this" {
  name = var.domain
}

locals {
  name       = module.name.prefix
  public_dns = aws_instance.this.public_dns
  site_name  = join(".", [local.name, var.domain])
  tags       = merge(module.name.tags, { "Name" : local.site_name })

  user_map = {
    s3d_domain    = var.domain
    s3d_setup_ref = var.setup_ref
    s3d_user      = var.username
    s3d_zone      = data.aws_route53_zone.this.zone_id
  }

  user_data = templatefile(
    "${path.module}/${var.template}-user-data.sh",
    merge(
      local.user_map,
      { s3d_name = local.name },
      { v = "1" },
    )
  )
}

module "name" {
  source = "github.com/s3d-club/terraform-external-name?ref=v0.1.16"

  context      = join("-", [var.name_prefix, var.template, var.setup_ref])
  disable_date = true
  path         = path.module
  tags         = var.tags

  keepers = merge(local.user_map, {
    key       = var.key_name
    subnet_id = var.subnet_id
  })
}

module "sg_egress" {
  source = "github.com/s3d-club/terraform-aws-sg_egress_open?ref=v0.1.16"

  cidrs       = var.egress_cidrs
  cidr6s      = var.egress_cidr6s
  name_prefix = local.name
  tags        = local.tags
  vpc_id      = var.vpc_id
}

module "sg_ingress" {
  source = "github.com/s3d-club/terraform-aws-sg_ingress_ssh?ref=v0.1.15"

  cidrs       = var.ssh_cidrs
  cidr6s      = var.ssh_cidr6s
  name_prefix = local.name
  tags        = local.tags
  vpc_id      = var.vpc_id
}

# tfsec:ignore:aws-ec2-enable-at-rest-encryption
# tfsec:ignore:aws-ec2-enforce-http-token-imds
resource "aws_instance" "this" {
  ami                         = coalesce(var.ami_id, data.aws_ami.this.id)
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  tags                        = local.tags
  user_data                   = local.user_data
  user_data_replace_on_change = true

  vpc_security_group_ids = [
    module.sg_egress.security_group_id,
    module.sg_ingress.security_group_id,
  ]

  root_block_device {
    volume_size = var.volume_size
  }
}

resource "aws_route53_record" "this" {
  depends_on = [aws_instance.this]

  name    = local.name
  records = [coalesce(local.public_dns, "none")]
  ttl     = 60
  type    = "CNAME"
  zone_id = data.aws_route53_zone.this.zone_id
}
