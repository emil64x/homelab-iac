locals {
  service_definitions = {
    cloudflared = {
      name     = "cloudflared"
      path     = "docker/cloudflared/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
        CF_TUNNEL_TOKEN = var.cloudflare_tunnel_token
      }
      dns = [ ]
    }

    portainer = {
      name     = "portainer"
      path     = null                # This stack is not deployed via Git
      repo_url = null
      env      = {}
      dns = [
        {
          dns_prefix = "portainer-${var.vm_name}"
          local_url  = "http://172.17.0.1:9000"
        }
      ]
    }

    traccar = {
      name     = "traccar"
      path     = "docker/traccar/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
          STORAGE = "${var.shared_storage_mountpoint}/${var.vm_name}"
      }
      dns = [
        {
          local_url  = "http://172.17.0.1:8082"
          dns_prefix = "traccar-${var.vm_name}"
        }
      ]
    }

    shlink = {
      name     = "shlink"
      path     = "docker/shlink/docker-compose.yml"
      repo_url = "https://github.com/emil64x/homelab-iac.git"
      env = {
          STORAGE = "${var.shared_storage_mountpoint}/${var.vm_name}"
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
  }

  enabled_stack_configs = [
    for s in var.enabled_stacks : local.service_definitions[s]
    if contains(keys(local.service_definitions), s)
  ]
}
