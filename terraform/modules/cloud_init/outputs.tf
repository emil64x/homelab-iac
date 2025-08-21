output "user_data_file_id" {
    value = proxmox_virtual_environment_file.user_data_cloud_config.id
}

output "cloud_init_rendered_stack_files" {
  value = [
    for f in local.rendered_stacks : {
      path        = f.path
      permissions = f.permissions
    }
  ]
  description = "Paths and permissions of stack config files rendered into Cloud-Init"
}

output "cloud_init_yaml" {
  value       = data.template_file.cloud_init.rendered
  description = "Final rendered Cloud-Init YAML configuration"
  sensitive   = true
}


output "cloud_init_portainer_script" {
  value       = data.template_file.portainer_script.rendered
  description = "Rendered Portainer setup script embedded in Cloud-Init"
  sensitive   = true
}
