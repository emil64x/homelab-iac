output "vm_id" {
  value       = proxmox_virtual_environment_vm.ubuntu_vm[0].vm_id
  description = "Proxmox VM ID"
}

output "vm_name" {
  value       = proxmox_virtual_environment_vm.ubuntu_vm[0].name
  description = "Name of the VM"
}

output "vm_ipv4" {
  value       = proxmox_virtual_environment_vm.ubuntu_vm[0].ipv4_addresses[1][0]
  description = "Static IPv4 address assigned to the VM"
}

output "vm_ssh_command" {
  value       = "ssh ubuntu@${proxmox_virtual_environment_vm.ubuntu_vm[0].ipv4_addresses[1][0]}"
  description = "SSH command to access the VM"
}

output "cloudflare_metadata" {
  value       = module.cloudflare_tunnel.cloudflare_metadata
  description = "Cloudflare outputs"
}

output "cloud_init_yaml" {
  value = module.cloud_init.cloud_init_yaml
}

output "cloud_init_portainer_script" {
  value = module.cloud_init.cloud_init_portainer_script
}

output "cloud_init_rendered_stack_files" {
  value = module.cloud_init.cloud_init_rendered_stack_files
}

output "enabled_stacks_metadata" {
  value = module.stack_configs.stack_metadata
}

output "dns_routes" {
  value = module.stack_configs.stack_dns_routes
}



