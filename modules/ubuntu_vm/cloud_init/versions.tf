terraform {
  required_version = ">= 1.4.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.78.1"
    }
    
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.3.0"
    }
  }
}
