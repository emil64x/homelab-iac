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
        SHOUTRRR_URL = var.shoutrrr_url
        HOSTNAME     = var.vm_name
      }
      dns = []
    }

    silverbullet = {
      name     = "silverbullet"
      path     = "docker/silverbullet/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        SILVERBULLET_USER = var.silverbullet_user

      }
      dns = [
        {
          local_url  = "http://172.17.0.1:34309"
          dns_prefix = "silverbullet-${var.dns_prefix}"
        }
      ]
    }


    hedgedoc = {
      name     = "hedgedoc"
      path     = "docker/hedgedoc/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        HEDGEDOC_DOMAIN   = "hedgedoc-${var.dns_prefix}.${var.dns_suffix}"
        HEDGEDOC_PORT     = "34409"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:34409"
          dns_prefix = "hedgedoc-${var.dns_prefix}"
        }
      ]
    }

    linkstack = {
      name     = "linkstack"
      path     = "docker/linkstack/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        LINKSTACK_ADMIN_EMAIL = var.linkstack_admin_email
        LINKSTACK_DOMAIN   = "https://linkstack-${var.dns_prefix}.${var.dns_suffix}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:8490"
          dns_prefix = "linkstack-${var.dns_prefix}"
        }
      ]
    }

    mealie = {
      name     = "mealie"
      path     = "docker/mealie/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        MEALIE_DNS        = "https://mealie-${var.dns_prefix}.${var.dns_suffix}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:9925"
          dns_prefix = "mealie-${var.dns_prefix}"
        }
      ]
    }

    radicale = {
      name     = "radicale"
      path     = "docker/radicale/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        RADICALE_DNS        = "https://radicale-${var.dns_prefix}.${var.dns_suffix}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:5232"
          dns_prefix = "radicale-${var.dns_prefix}"
        }
      ]
    }

    uptime-kuma = {
      name     = "uptime-kuma"
      path     = "docker/uptime-kuma/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:3001"
          dns_prefix = "kuma-${var.dns_prefix}"
        }
      ]
    }

    actual-budget = {
      name     = "actual-budget"
      path     = "docker/actual-budget/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:5006"
          dns_prefix = "actual-${var.dns_prefix}"
        }
      ]
    }

    actual-ai = {
      name     = "actual-ai"
      path     = "docker/actual-ai/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        ACTUAL_SERVER_URL            = "https://actual-${var.dns_prefix}.${var.dns_suffix}"
        ACTUAL_PASSWORD              = var.actual_password
        ACTUAL_BUDGET_ID             = var.actual_budget_id
        GOOGLE_GENERATIVE_AI_API_KEY = var.google_generative_ai_api_key
      }
      dns = []
    }

    homepage = {
      name     = "homepage"
      path     = "docker/homepage/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE                = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        HOMEPAGE_ALLOWED_HOSTS = var.homepage_allowed_hosts
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:3200"
          dns_prefix = "home-${var.dns_prefix}"
        }
      ]
    }

    formbricks = {
      name     = "formbricks"
      path     = "docker/formbricks/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE           = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        WEBAPP_URL        = "https://forms-${var.dns_prefix}.${var.dns_suffix}"
        NEXTAUTH_URL      = "https://forms-${var.dns_prefix}.${var.dns_suffix}"
        NEXTAUTH_SECRET   = var.formbricks_nextauth_secret
        ENCRYPTION_KEY    = var.formbricks_encryption_key
        CRON_SECRET       = var.formbricks_cron_secret
        HUB_API_KEY       = var.formbricks_hub_api_key
        CUBEJS_API_SECRET = var.formbricks_cubejs_api_secret
        MAIL_FROM         = var.formbricks_mail_from
        SMTP_HOST         = var.formbricks_smtp_host
        SMTP_PORT         = tostring(var.formbricks_smtp_port)
        SMTP_USER         = var.formbricks_smtp_user
        SMTP_PASSWORD     = var.formbricks_smtp_password
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:3233"
          dns_prefix = "forms-${var.dns_prefix}"
        }
      ]
    }

    authentik = {
      name     = "authentik"
      path     = "docker/authentik/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        STORAGE              = "${var.shared_storage_mountpoint}/${var.shared_storage_folder}"
        AUTHENTIK_SECRET_KEY = var.authentik_secret_key
        PG_PASS              = var.authentik_pg_pass
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:9010"
          dns_prefix = "auth-${var.dns_prefix}"
        }
      ]
    }


  }

  
  

  

  enabled_stack_configs = [
    for s in var.enabled_stacks : local.service_definitions[s]
    if contains(keys(local.service_definitions), s)
  ]
}

