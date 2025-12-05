variable "vm_name" {
  type = string
}

variable "enabled_stacks" {
  type = list(string)
}

variable "cloudflare_tunnel_token" {
  type      = string
  sensitive = true
}

variable "shared_storage_mountpoint" {
  type = string
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

variable "dns_suffix" {
  type = string
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