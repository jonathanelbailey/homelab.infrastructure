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
  bootdisk         = "scsi0"

  disk {
    slot = 0
    size = "50G"
    type = "scsi"
    storage = "local" # Name of storage local to the host you are spinning the VM up on
    # Enables SSD emulation
    ssd = 1
    # Enables thin-provisioning
    discard = "on"
    #iothread = 1
  }
}

# data "external" "resize_vm_boot_disk" {
#   program = [
#     "bash", "-c", "${path.module}/files/resize_vm_boot_disk.sh", 
#     "scsi0", "${var.boot_disk_size}", "${var.vm_id.id}"]
# }

# data "http" "start_vm" {
#   url         = "${var.pm_api_url}/nodes/${var.vm_id.id}/status/start"
#   method      = "POST"

#   request_headers = {
#     Authorization       = "PVEAPIToken=${var.pm_api_token_secret}"
#     Content-Type        = "application/json"
#   }
# }