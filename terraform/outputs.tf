output "ubuntu_vm_id" {
  value = module.ubuntu_vm.vm_id
}

output "ubuntu_vm_ipv4_address" {
  value = module.ubuntu_vm.vm_ipv4
}

output "ubuntu_vm_ssh_command" {
  value = module.ubuntu_vm.vm_ssh_command
}

output "ubuntu_vm_cloudflare_metadata" {
  value = module.ubuntu_vm.cloudflare_metadata
}

output "ubuntu_vm_cloud_init_yaml" {
  value     = module.ubuntu_vm.cloud_init_yaml
  sensitive = true
}


output "ubuntu_vm_cloud_init_portainer_script" {
  value     = module.ubuntu_vm.cloud_init_portainer_script
  sensitive = true
}


output "ubuntu_vm_cloud_init_rendered_portainer_stacks" {
  value = module.ubuntu_vm.cloud_init_rendered_stack_files
}

output "ubuntu_vm_enabled_stacks_metadata" {
  value     = module.ubuntu_vm.enabled_stacks_metadata
  sensitive = true
}

output "ubuntu_vm_dns_routes" {
  value = module.ubuntu_vm.dns_routes
}

