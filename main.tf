module "ubuntu_vm" {
  source       = "./modules/ubuntu_vm"

  enable_vm    = var.enable_ubuntu_vm
  vm_name      = var.ubuntu_vm_name
  static_ip    = var.ubuntu_static_ip

  proxmox_host         = var.proxmox_host
  terraform_user       = var.terraform_user
  terraform_user_key   = var.terraform_user_key
  persistent_disk_path = var.persistent_disk_path

  cloudflare_api_token     = var.cloudflare_api_token
  cloudflare_tunnel_secret = var.cloudflare_tunnel_secret
  cloudflare_account_id    = var.cloudflare_account_id
  cloudflare_email         = var.cloudflare_email
  cloudflare_zone          = var.cloudflare_zone
  cloudflare_zone_id       = var.cloudflare_zone_id
}


