variable "cert_manager_version" {
  description = "The version of the cert-manager Helm chart."
  type        = string
  default     = "v1.17.1"  # Update frequently
}

variable "email" {
  description = "The email address used for ACME registration."
  type        = string
}
