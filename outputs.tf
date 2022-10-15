output "username" {
  description = <<-END
    The user name  where tools are configured (the ec2-user also for
    low-level access)
    END

  value = var.username
}

output "dns_name" {
  description = <<-END
    The dns name we configured. This is a CNAME that refer to the
    `ec2_dns` value.
    END

  value = local.site_name
}

output "ec2_dns" {
  description = "The actual public DNS for the instance"
  value       = local.public_dns
}

output "security_groups" {
  value = [module.sg_ingress, module.sg_egress]

  description = <<-END
    The EC2 Admin site name

    The EC2 Aministration instance if one is available.
    END
}
