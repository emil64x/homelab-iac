variable "enable_vm" {
  type    = bool
  default = true
}

variable "vm_name" {
  type    = string
}

variable "node_name" {
  type    = string
  default = "proxmoxve"
}

variable "vm_cores" {
  type    = number
  default = 2
}

variable "vm_memory" {
  type    = number
  default = 2048
}

variable "datastore_id" {
  type    = string
  default = "local-lvm"
}

variable "disk_interface" {
  type    = string
  default = "virtio0"
}

variable "persistent_disk_size"{
  type    = string
  default = "50G"
}

variable "static_ip" {
  type    = string
  default = "dhcp"
}

variable "gateway" {
  type    = string
  default = "192.168.1.1"
}

variable "terraform_user" {
  type = string
}

variable "terraform_user_key" {
  type = string
}

variable "proxmox_host" {
  type = string
}

variable "persistent_disk_path" {
  type = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare Account ID"
  type        = string
}

variable "cloudflare_tunnel_secret" {
  description = "Cloudflare Tunnel Secret"
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