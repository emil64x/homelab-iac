output "enabled_stacks_config" {
  value = local.enabled_stack_configs
}

output "stack_metadata" {
  value = {
    for stack in local.enabled_stack_configs :
    stack.name => {
      path     = stack.path
      repo_url = stack.repo_url
      env      = stack.env
      dns      = stack.dns
    }
  }
  description = "Grouped metadata for all enabled stacks"
  sensitive   = true
}

output "stack_dns_routes" {
  value = {
    for stack in local.enabled_stack_configs :
    stack.name => stack.dns
  }
  description = "DNS routes configured for each enabled stack"
}
