resource "helm_release" "ingress_nginx" {
  # ... configuration existante ...

  # Ajoutez ces paramètres critiques
  wait        = true
  timeout     = 600
  max_history = 5

  # Configuration spécifique OVH
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/ovh-loadbalancer-proxy-protocol"
    value = "v2"
  }

  set {
    name  = "controller.config.use-proxy-protocol"
    value = "true"
  }
}
