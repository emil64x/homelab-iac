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

variable "vm_cores" {
  type    = number
  default = 6
}

variable "vm_memory" {
  type    = number
  default = 16384
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

variable "claper_oidc_client_secret" {
  description = "OIDC client secret for Claper"
  type        = string
  sensitive   = true
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
  default     = ""
}

variable "actual_password" {
  description = "Password for Actual Budget"
  type        = string
  sensitive   = true
  default     = ""
}

variable "actual_budget_id" {
  description = "Sync ID for Actual Budget"
  type        = string
  default     = ""
}

variable "google_generative_ai_api_key" {
  description = "Google Gemini API key for Actual AI"
  type        = string
  sensitive   = true
  default     = ""
}

variable "homepage_allowed_hosts" {
  description = "Allowed hosts for Homepage"
  type        = string
  default     = "emil64.cc"
}

variable "formbricks_nextauth_secret" {
  description = "NextAuth secret for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_encryption_key" {
  description = "Encryption key for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_cron_secret" {
  description = "Cron secret for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_hub_api_key" {
  description = "Hub API key for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_cubejs_api_secret" {
  description = "CubeJS API secret for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_mail_from" {
  description = "Mail from address for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_smtp_host" {
  description = "SMTP host for Formbricks"
  type        = string
  default     = "smtp.zoho.com"
}

variable "formbricks_smtp_port" {
  description = "SMTP port for Formbricks"
  type        = number
  default     = 465
}

variable "formbricks_smtp_user" {
  description = "SMTP username for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_smtp_password" {
  description = "SMTP password for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "authentik_secret_key" {
  description = "Secret key for Authentik"
  type        = string
  sensitive   = true
  default     = ""
}

variable "authentik_pg_pass" {
  description = "PostgreSQL password for Authentik"
  type        = string
  sensitive   = true
  default     = ""
}
