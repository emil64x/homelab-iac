locals {
  service_definitions = {
    cloudflared = {
      name     = "cloudflared"
      path     = "docker/cloudflared/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        CF_TUNNEL_TOKEN = var.cloudflare_tunnel_token
      }
      dns = []
    }

    portainer = {
      name     = "portainer"
      path     = null # This stack is not deployed via Git
      repo_url = null
      env      = {}
      dns = [
        {
          dns_prefix = "portainer-${var.dns_prefix}"
          local_url  = "http://172.17.0.1:9000"
        }
      ]
    }

    traccar = {
      name     = "traccar"
      path     = "docker/traccar/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:8082"
          dns_prefix = "traccar-${var.dns_prefix}"
        }
      ]
    }

    shlink = {
      name     = "shlink"
      path     = "docker/shlink/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE        = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        SHLINK_API_KEY = var.shlink_api_key
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:3100"
          dns_prefix = "s"
        },
        {
          local_url  = "http://172.17.0.1:3120"
          dns_prefix = "shlink"
        }
      ]
    }

    claper = {
      name     = "claper"
      path     = "docker/claper/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE                = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        CLAPER_BASE_URL        = "https://claper-${var.dns_prefix}.${var.dns_suffix}"
        CLAPER_SECRET_KEY_BASE = var.claper_secret_key_base
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:4000"
          dns_prefix = "claper-${var.dns_prefix}"
        }
      ]
    }

    vaultwarden = {
      name     = "vaultwarden"
      path     = "docker/vaultwarden/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"

        # PostgreSQL settings
        VW_PG_USER                 = var.vw_pg_user
        VW_PG_PASSWORD             = var.vw_pg_password
        VW_PG_REPLICATION_USER     = var.vw_pg_replication_user
        VW_PG_REPLICATION_PASSWORD = var.vw_pg_replication_password
        VW_PG_MASTER_HOST          = var.vw_pg_master_host
        VW_PG_MASTER_PORT_NUMBER   = var.vw_pg_master_port_number

        # Vaultwarden admin
        VW_ADMIN_TOKEN = var.vw_admin_token
        VW_DOMAIN      = "https://vaultwarden-replica.${var.dns_suffix}"

        # SMTP settings
        VW_SMTP_HOST     = var.vw_smtp_host
        VW_SMTP_PORT     = var.vw_smtp_port
        VW_SMTP_SECURITY = var.vw_smtp_security
        VW_SMTP_USER     = var.vw_smtp_user
        VW_SMTP_PASSWORD = var.vw_smtp_password
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:8200"
          dns_prefix = "vaultwarden-replica"
        }
      ]
    }

    watchtower = {
      name     = "watchtower"
      path     = "docker/watchtower/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        WATCHTOWER_SHOUTRRR_URL = var.shoutrrr_url
        HOSTNAME = var.vm_name
      }
    }

  }

  enabled_stack_configs = [
    for s in var.enabled_stacks : local.service_definitions[s]
    if contains(keys(local.service_definitions), s)
  ]
}

