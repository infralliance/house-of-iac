terraform {
  source = "../../../../modules/s3"
}

inputs = {
  ovh_endpoint           = get_env("TF_VAR_ovh_endpoint")
  ovh_application_key    = get_env("TF_VAR_ovh_application_key")
  ovh_application_secret = get_env("TF_VAR_ovh_application_secret")
  ovh_consumer_key       = get_env("TF_VAR_ovh_consumer_key")
  ovh_service_name       = get_env("TF_VAR_ovh_service_name")
  region                      = "gra"
  s3_endpoint                 = "https://s3.gra.io.cloud.ovh.net"
  bucket_name                 = "tf-s3-bucket-dev"
}
