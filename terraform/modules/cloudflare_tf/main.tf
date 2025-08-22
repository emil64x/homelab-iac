locals {
  all_dns_routes = flatten([
    for stack in var.enabled_stacks :
    [
      for route in stack.dns : {
        fqdn = "${route.dns_prefix}.${var.cloudflare_zone}"
        name = route.dns_prefix
      }
    ]
  ])
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  account_id = var.cloudflare_account_id
  name       = var.tunnel_name
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "tunnel_token" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
}

resource "cloudflare_dns_record" "routes" {
  for_each = {
    for route in local.all_dns_routes : route.fqdn => route
  }

  zone_id = var.cloudflare_zone_id
  name    = each.value.name
  type    = "CNAME"
  ttl     = 1
  proxied = true
  content = "${cloudflare_zero_trust_tunnel_cloudflared.tunnel.id}.cfargotunnel.com"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
  account_id = var.cloudflare_account_id

  config = {
    ingress = concat(
      flatten([
        for stack in var.enabled_stacks : [
          for route in stack.dns : {
            hostname = "${route.dns_prefix}.${var.cloudflare_zone}"
            service  = "${route.local_url}"
          }
        ]
      ]),
      [
        # Fallback route must always come last
        {
          service = "http_status:404"
        }
      ]
    )
  }
}

