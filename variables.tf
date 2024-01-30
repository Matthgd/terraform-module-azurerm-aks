variable "name" {
  type        = string
  description = "Nome do Cluster e Nodegroups que serão criados na Azure."
}

variable "location" {
  type = object({
    name  = string
    alias = string
  })
  description = "Objeto contendo informações de região que os recursos serão criados."
}

variable "default_node_pool" {
  description = "Object contendo as configurações do nodepool default."
  type = object({
    name                           = string
    node_count                     = number
    vm_size                        = string
    zones                          = list(string)
    labels                         = map(string)
    taints                         = list(string)
    cluster_auto_scaling           = bool
    cluster_auto_scaling_min_count = number
    cluster_auto_scaling_max_count = number
  })
  default = {
    name                           = "system"
    node_count                     = 1
    vm_size                        = "Standard_D2_v3"
    zones                          = ["1", "2"]
    labels                         = {}
    taints                         = []
    cluster_auto_scaling           = true
    cluster_auto_scaling_min_count = 1
    cluster_auto_scaling_max_count = 5
  }
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes."
  type        = string
  default     = "1.27.7"
}

variable "tags" {
  type = any
}

variable "private_cluster_enabled" {
  type        = bool
  default     = true
  description = "(Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
}
