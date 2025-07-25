variable "vm_name" {
  type    = string
}

variable "enabled_stacks" {
  type = list(string)
}

variable "cloudflare_tunnel_token" {
   type = string
  sensitive = true  
}

variable "shared_storage_mountpoint" {
  type = string
}