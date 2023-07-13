module "virtual_machine" {
  source = "../modules/proxmox/vm"
  name                = "k8s-devqa-1"
  cores               = 16
  memory              = 32768
  desc                = "K8s Cluster for DevQA"
}