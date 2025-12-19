variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_endpoint" {
  type = string
}

variable "proxmox_endpoint_insecure" {
  type = bool
}

variable "proxmox_api_token" {
  type = string
}

variable "enable_ubuntu_vm" {
  type    = bool
  default = true
}

variable "ubuntu_vm_name" {
  type = string
}

variable "ubuntu_static_ip" {
  type = string
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
  type      = string
  sensitive = true
}

variable "cloudflare_tunnel_secret" {
  type      = string
  sensitive = true
}

variable "cloudflare_account_id" {
  type      = string
  sensitive = true
}

variable "proxmox_host" {
  type = string
}

variable "terraform_user" {
  type = string
}

variable "terraform_user_key" {
  type      = string
  sensitive = true
}

variable "persistent_disk_path" {
  type = string
}

variable "portainer_admin_password" {
  type      = string
  sensitive = true
}

variable "shared_storage_mountpoint" {
  type = string
}

variable "enabled_stacks" {
  type = list(string)
}

variable "dns_prefix" {
  type = string
}

variable "shared_storage_folder" {
  type = string
}

variable "shlink_api_key" {
  type      = string
  sensitive = true
}

variable "claper_secret_key_base" {
  type      = string
  sensitive = true
}

variable "vw_pg_user" {
  description = "PostgreSQL application user for Vaultwarden"
  type        = string
}

variable "vw_pg_password" {
  description = "Password for the Vaultwarden PostgreSQL user"
  type        = string
  sensitive   = true
}

variable "vw_pg_replication_user" {
  description = "Replication user for PostgreSQL replica"
  type        = string
}

variable "vw_pg_replication_password" {
  description = "Password for the PostgreSQL replication user"
  type        = string
  sensitive   = true
}

variable "vw_pg_master_host" {
  description = "Hostname or IP of the PostgreSQL primary node"
  type        = string
}

variable "vw_pg_master_port_number" {
  description = "Port number of the PostgreSQL primary node"
  type        = number
  default     = 5432
}

variable "vw_admin_token" {
  description = "Admin token for Vaultwarden"
  type        = string
  sensitive   = true
}

variable "vw_smtp_host" {
  description = "SMTP server hostname"
  type        = string
}

variable "vw_smtp_port" {
  description = "SMTP server port"
  type        = number
  default     = 587
}

variable "vw_smtp_security" {
  description = "SMTP security mode (starttls, force_tls, off)"
  type        = string
  default     = "starttls"
}

variable "vw_smtp_user" {
  description = "SMTP username"
  type        = string
}

variable "vw_smtp_password" {
  description = "SMTP password or app-specific password"
  type        = string
  sensitive   = true
}

variable "shoutrrr_url" {
  description = "Shoutrrr notification URL for Watchtower"
  type        = string
  sensitive   = true
}

variable "silverbullet_user" {
  description = "Silverbullet user credentials in the format username:password"
  type        = string
  sensitive   = true
}

variable "linkstack_admin_email" {
  description = "Admin email for Linkstack"
  type        = string
  default = ""
}