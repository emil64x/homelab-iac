output "tunnel_token" {
  value = data.cloudflare_zero_trust_tunnel_cloudflared_token.tunnel_token.token
}

output "cloudflare_metadata" {
  value = {
    tunnel_id   = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
    tunnel_name = cloudflare_zero_trust_tunnel_cloudflared.tunnel.name
    dns_records = {
      for fqdn, record in cloudflare_dns_record.routes :
      fqdn => record.content
    }
    ingress_routes = cloudflare_zero_trust_tunnel_cloudflared_config.tunnel_config.config.ingress
  }
  description = "Grouped metadata for Cloudflare Tunnel and DNS configuration"
}
