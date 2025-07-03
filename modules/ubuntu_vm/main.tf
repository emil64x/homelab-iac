resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.enable_vm ? 1 : 0
  
  name      = var.vm_name
  node_name = var.node_name

  cpu {
    cores = var.vm_cores
  }

  memory {
    dedicated = var.vm_memory
  }

  disk {
    datastore_id = var.datastore_id
    interface    = var.disk_interface
    file_id      = proxmox_virtual_environment_download_file.ubuntu_cloud_image.id
    iothread     = true
    discard      = "on"
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.static_ip
        gateway = var.gateway
      }
    }

    user_data_file_id = module.cloud_init.user_data_file_id
  }

  network_device {
    bridge = "vmbr0"
  }

  agent {
    enabled = true
  }
}

resource "null_resource" "attach_disk" {
  depends_on = [proxmox_virtual_environment_vm.ubuntu_vm]

  provisioner "local-exec" {
    command = "ssh ${var.terraform_user}@${var.proxmox_host} -i ${var.terraform_user_key} 'sudo qm set ${proxmox_virtual_environment_vm.ubuntu_vm[0].vm_id} --scsi2 ${var.persistent_disk_path}'"
  }

  triggers = {
    always_run = timestamp()
  }
}

resource "null_resource" "add_ssh_known_host" {
  depends_on = [proxmox_virtual_environment_vm.ubuntu_vm]

  provisioner "local-exec" {
    command = "ssh-keyscan -H ${proxmox_virtual_environment_vm.ubuntu_vm[0].ipv4_addresses[1][0]} >> ~/.ssh/known_hosts"
  }

  triggers = {
    always_run = timestamp()
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_cloud_image" {
  content_type =  "iso"
  datastore_id =  "local"
  node_name    =  var.node_name

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

module "cloudflare_tunnel"{
  source = "./../cloudflare_tf"

  cloudflare_zone = var.cloudflare_zone
  cloudflare_zone_id = var.cloudflare_zone_id
  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_email = var.cloudflare_email
  cloudflare_token = var.cloudflare_api_token
  tunnel_name = "pve-${var.vm_name}"
}

module "cloud_init" {
  source = "./cloud_init"
  depends_on = [ module.cloudflare_tunnel ]

  node_name = var.node_name
  vm_name = var.vm_name  
  cf_tunnel_token = module.cloudflare_tunnel.tunnel_token
}

