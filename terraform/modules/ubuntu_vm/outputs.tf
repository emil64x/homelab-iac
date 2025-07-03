output "vm_id" {
  value = try(proxmox_virtual_environment_vm.ubuntu_vm[0].vm_id, "The VM no longer exists")
}

output "vm_ipv4_address" {
  value = try(proxmox_virtual_environment_vm.ubuntu_vm[0].ipv4_addresses[1][0], "No IP assigned yet")
}
