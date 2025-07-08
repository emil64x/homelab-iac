variable "node_name" {
    type = string
}

variable "vm_name" {
    type = string
}

variable "portainer_admin_password" {
    type = string
    sensitive = true
}

variable "enabled_stacks" {
  type = list(object({
    name = string
    repo_url = string
    path = string
    env  = map(string)
    dns  = list(object({
      local_url = string
      dns_prefix = string
    }))
  }))
}


variable "shared_storage_mountpoint" {
  type = string
}