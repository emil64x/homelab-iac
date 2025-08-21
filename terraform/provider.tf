provider "proxmox" {
  endpoint = var.proxmox_endpoint
  insecure = var.proxmox_endpoint_insecure
  username = var.proxmox_user
  password = var.proxmox_password
  # api_token = var.proxmox_api_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
