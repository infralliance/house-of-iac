variable "ovh_service_name" {
  description = "The OVH service name (project ID)."
  type        = string
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}

variable "region" {
  description = "The region where the cluster will be deployed."
  type        = string
}

variable "kube_version" {
  description = "The version of Kubernetes to deploy."
  type        = string
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type        = string
}

variable "node_pool_flavor" {
  description = "The flavor (instance type) for the nodes in the pool."
  type        = string
}

variable "node_pool_desired_nodes" {
  description = "The desired number of nodes in the pool."
  type        = number
}

variable "node_pool_max_nodes" {
  description = "The maximum number of nodes in the pool."
  type        = number
}

variable "node_pool_min_nodes" {
  description = "The minimum number of nodes in the pool."
  type        = number
}

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
