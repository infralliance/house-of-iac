resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = var.cert_manager_version
  namespace        = kubernetes_namespace.cert_manager.metadata[0].name
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "kubectl_manifest" "letsencrypt_issuer" {
  depends_on = [helm_release.cert_manager]
  yaml_body  = templatefile("${path.module}/issuer.yaml", { email = var.email })
}
