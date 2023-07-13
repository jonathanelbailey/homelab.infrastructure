module "virtual_machine" {
  source = "../modules/proxmox/vm"
  pm_api_url          = provider.proxmox.pm_api_url
  name                = "k8s-devqa-1"
  cores               = 16
  memory              = 32768
  desc                = "K8s Cluster for DevQA"
}