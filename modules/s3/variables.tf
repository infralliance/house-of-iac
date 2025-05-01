# variables.tf

variable "ovh_endpoint" {
  description = "The OVH API endpoint."
  type        = string
}

variable "ovh_application_key" {
  description = "The OVH application key."
  type        = string
  sensitive   = true
}

variable "ovh_application_secret" {
  description = "The OVH application secret."
  type        = string
  sensitive   = true
}

variable "ovh_consumer_key" {
  description = "The OVH consumer key."
  type        = string
  sensitive   = true
}

variable "ovh_service_name" {
  description = "The service name for OVH."
  type        = string
}

variable "region" {
  type    = string
  default = "gra"
}

variable "s3_endpoint" {
  type    = string
  default = "https://s3.gra.io.cloud.ovh.net"
}

variable "user_desc_prefix" {
  type    = string
  default = "[TF] User created by s3 terraform script"
}

variable "bucket_name" {
  type    = string
  default = "tf-s3-bucket-only"
}

