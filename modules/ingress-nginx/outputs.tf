output "load_balancer_ip" {
  description = "IP du Load Balancer"
  value       = try(one(helm_release.ingress_nginx.status[*].load_balancer[*].ingress[*].ip), null)
}
