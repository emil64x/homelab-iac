variable "node_name" {
    type = string
}

variable "vm_name" {
    type = string
}

variable "cf_tunnel_token" {
    type = string
    sensitive = true
}

variable "portainer_admin_password" {
    type = string
    sensitive = true
}