terraform {
  source = "../../../../modules/ingress-nginx"
}

inputs = {
  cluster_name = "dev-cluster"
}
