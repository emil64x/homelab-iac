variable "cloudflare_zone" {
  description = "Domain used to expose the GCP VM instance to the Internet"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Zone ID for your domain"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Account ID for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "Email address for your Cloudflare account"
  type        = string
  sensitive   = true
}

variable "cloudflare_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "tunnel_name" {
  type    = string
  default = "Terraform CF Tunnel"
}

variable "enabled_stacks" {
  type = list(object({
    name     = string
    repo_url = string
    path     = string
    env      = map(string)
    dns = list(object({
      local_url  = string
      dns_prefix = string
    }))
  }))
}