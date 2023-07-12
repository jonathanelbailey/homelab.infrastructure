resource "tls_private_key" "virtual_machine_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "proxmox_vm_qemu" "virtual_machines" {
  depends_on = [
    tls_private_key.virtual_machine_keys
  ]
  for_each         = var.virtual_machines
  name             = each.value.name
  desc             = each.value.description
  agent            = each.value.agent
  qemu_os          = each.value.qemu_os
  target_node      = each.value.target_node
  os_type          = each.value.os_type
  full_clone       = each.value.full_clone
  clone            = each.value.template
  memory           = each.value.memory
  sockets          = each.value.socket
  cores            = each.value.cores
  disk_gb          = each.value.disk_gb
  nic              = each.value.network_model
  bridge           = each.value.network_bridge_type
  sshkeys          = var.sshkeys
  ciuser           = each.value.cloud_init_user
  ipconfig0        = each.value.ipconfig0
  cipassword       = var.cloud_init_pass
}
