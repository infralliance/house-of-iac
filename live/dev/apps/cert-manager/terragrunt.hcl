terraform {
  source = "../../../../modules/cert-manager"
}

inputs = {
  cert_manager_version = "v1.17.1"
  email                = "infralliance.io@gmail.com"
}
