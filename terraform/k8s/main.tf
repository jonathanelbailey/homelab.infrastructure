module "virtual_machine" {
  source = "../modules/proxmox/vm"
  virtual_machines = local.machines
}