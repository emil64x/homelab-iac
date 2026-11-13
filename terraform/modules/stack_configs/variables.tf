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

variable "claper_oidc_client_secret" {
  description = "OIDC client secret for Claper"
  type        = string
  sensitive   = true
}

variable "actual_budget_oidc_client_id" {
  description = "OIDC client ID for Actual Budget"
  type        = string
}

variable "actual_budget_oidc_client_secret" {
  description = "OIDC client secret for Actual Budget"
  type        = string
  sensitive   = true
}

variable "traccar_oidc_client_id" {
  description = "OIDC client ID for Traccar"
  type        = string
}

variable "traccar_oidc_client_secret" {
  description = "OIDC client secret for Traccar"
  type        = string
  sensitive   = true
}

variable "mealie_oidc_client_id" {
  description = "OIDC client ID for Mealie"
  type        = string
}

variable "mealie_oidc_client_secret" {
  description = "OIDC client secret for Mealie"
  type        = string
  sensitive   = true
}

variable "hedgedoc_oidc_client_id" {
  description = "OIDC client ID for HedgeDoc"
  type        = string
}

variable "hedgedoc_oidc_client_secret" {
  description = "OIDC client secret for HedgeDoc"
  type        = string
  sensitive   = true
}

variable "formbricks_oidc_client_id" {
  description = "OIDC client ID for Formbricks"
  type        = string
}

variable "formbricks_oidc_client_secret" {
  description = "OIDC client secret for Formbricks"
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
  default = ""
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

variable "formbricks_authzed_token" {
  description = "AuthZed / SpiceDB preshared key for Formbricks"
  type        = string
  sensitive   = true
  default     = ""
}

variable "formbricks_authzed_database_password" {
  description = "Database password for Formbricks SpiceDB datastore"
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
