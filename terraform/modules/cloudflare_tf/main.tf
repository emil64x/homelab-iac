resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  account_id    = var.cloudflare_account_id
  name          = var.tunnel_name
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "tunnel_token" {
  account_id   = var.cloudflare_account_id
  tunnel_id   = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
}

resource "cloudflare_dns_record" "http_app" {
  zone_id = var.cloudflare_zone_id
  name    = "http_app"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
} 

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
  account_id = var.cloudflare_account_id
  config     = {
    ingress   = [
      {
        hostname = "http_app.${var.cloudflare_zone}"
        service  = "http://localhost:8080"
      },
      {
        service  = "http_status:404"
      }
    ]
  }
}
