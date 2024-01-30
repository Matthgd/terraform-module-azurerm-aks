resource "azurerm_kubernetes_cluster" "main" {
  name                       = var.name
  tags                       = var.tags
  resource_group_name        = module.rg.resource_group_name
  location                   = var.location.name
  dns_prefix_private_cluster = "aks-project"
  kubernetes_version         = var.kubernetes_version
  sku_tier                   = "Standard"
  private_cluster_enabled    = var.private_cluster_enabled
  local_account_disabled     = false
  default_node_pool {
    name                 = var.default_node_pool.name
    orchestrator_version = var.kubernetes_version
    node_count           = var.default_node_pool.node_count
    vm_size              = var.default_node_pool.vm_size
    type                 = "VirtualMachineScaleSets"
    zones                = var.default_node_pool.zones
    max_pods             = 110
    os_disk_size_gb      = 256
    enable_auto_scaling  = var.default_node_pool.cluster_auto_scaling
    min_count            = var.default_node_pool.cluster_auto_scaling_min_count
    max_count            = var.default_node_pool.cluster_auto_scaling_max_count
  }
}