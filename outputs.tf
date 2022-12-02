output "dns_name" {
  value = local.site_name

  description = <<-EOT
    This is a friendly `CNAME` that refer to the `ec2_dns` value.
    EOT
}

output "ec2_dns" {
  value = local.public_dns

  description = <<-EOT
    The actual public DNS for the instance.
    EOT
}

output "security_groups" {
  value = {
    ingress = module.sg_ingress
    egress  = module.sg_egress
  }

  description = <<-EOT
    The security groups.
    EOT
}

output "username" {
  value = var.username

  description = <<-EOT
    The user name where tools are configured.  The ec2-user is also for
    low-level access but should not be used for general work.
    EOT
}
