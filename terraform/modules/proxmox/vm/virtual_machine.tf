resource "proxmox_vm_qemu" "deploy_vm" {
  name             = var.name
  desc             = var.desc
  agent            = var.agent
  qemu_os          = var.qemu_os
  target_node      = var.target_node
  os_type          = var.os_type
  full_clone       = var.full_clone
  clone            = var.clone
  memory           = var.memory
  sockets          = var.sockets
  cores            = var.cores
  scsihw           = var.scsihw
  nic              = var.nic
  bridge           = var.bridge
  sshkeys          = var.sshkeys
  ciuser           = var.ciuser
  ipconfig0        = var.ipconfig0
  cipassword       = var.cipassword
  oncreate         = var.oncreate

}

output "vm_id" {
  value = proxmox_vm_qemu.deploy_vm.id
}

data "http" "resize_vm_boot_disk" {
  depends_on = [
    proxmox_vm_qemu.deploy_vm
  ]
  url         = "${var.pm_api_url}/nodes/${var.vm_id}/resize"
  method      = "PUT"

  request_headers = {
    Authorization       = "PVEAPIToken=${var.pm_api_token_secret}"
    Content-Type        = "application/json"
  }

  request_body = {
    disk                = "scsi0"
    size                = var.boot_disk_size
  }
}

data "http" "start_vm" {
  depends_on = [
    http.resize_vm_boot_disk
  ]
  url         = "${var.pm_api_url}/nodes/${var.vm_id}/status/start"
  method      = "POST"

  request_headers = {
    Authorization       = "PVEAPIToken=${var.pm_api_token_secret}"
    Content-Type        = "application/json"
  }
}
