terraform {
  source = "../../../../modules/k8s-ovh"
}

inputs = {
  ovh_endpoint           = get_env("TF_VAR_ovh_endpoint")
  ovh_application_key    = get_env("TF_VAR_ovh_application_key")
  ovh_application_secret = get_env("TF_VAR_ovh_application_secret")
  ovh_consumer_key       = get_env("TF_VAR_ovh_consumer_key")
  ovh_service_name       = get_env("TF_VAR_ovh_service_name")
  cluster_name           = "dev-cluster"
  region                 = "SBG5"
  kube_version           = "1.31"
  node_pool_name         = "dev-pool"
  node_pool_flavor       = "b3-8"
  node_pool_desired_nodes = 1
  node_pool_max_nodes     = 1
  node_pool_min_nodes     = 1
}
