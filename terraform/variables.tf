variable "proxmox_user" {
  type      = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_endpoint" {
  type   = string
}

variable "proxmox_endpoint_insecure" {
  type   = bool
}

variable "proxmox_api_token"{
  type = string
}

variable "enable_ubuntu_vm" {
  type    = bool
  default = true
}

variable "ubuntu_vm_name" {
  type    = string
}

variable "ubuntu_static_ip" {
  type    = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  type = string
}

variable "cloudflare_zone" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
  sensitive = true
}

variable "cloudflare_tunnel_secret" {
  type = string
  sensitive = true
}

variable "cloudflare_account_id" {
  type = string
  sensitive = true
}

variable "proxmox_host" {
  type = string
}

variable "terraform_user" {
  type = string
}

variable "terraform_user_key" {
  type = string
  sensitive = true
}

variable "persistent_disk_path" {
  type = string  
}

variable "portainer_admin_password" {
    type = string
    sensitive = true
}