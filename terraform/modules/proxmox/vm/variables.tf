variable "pm_api_url" {
  type        = string
  default     = "https://localhost:8006/api2/json"
  description = "Proxmox API URL"
}

variable "pm_api_token_secret" {
  type        = string
  default     = ""
  description = "Terraform API token"
}

variable "name" {
  type        = string
  default     = "ubuntu"
  description = "VM Name"
}

variable "desc" {
  type        = string
  default     = ""
  description = "Short description of VM"
}

variable "target_node" {
  type        = string
  default     = "pve"
  description = "Node that the VM will be created on"
}

variable "qemu_os" {
  type        = string
  default     = "other"
  description = "OS of the VM"
}

variable "os_type" {
  type        = string
  default     = "cloud-init"
  description = "Type of OS"
}

variable "clone" {
  type        = string
  default     = "VM 9000"
  description = "Name of VM Template to clone VM from"
}

variable "full_clone" {
  type        = bool
  default     = false
  description = "Full clone or thin VM"
}

variable "oncreate" {
  type        = bool
  default     = false
  description = "Start VM after creation"
}

variable "sockets" {
  type        = number
  default     = 1
  description = "Number of CPU sockets"
}

variable "cores" {
  type        = number
  default     = 4
  description = "Number of cores"
}

variable "memory" {
  type        = number
  default     = 8192
  description = "Memory in MB"
}

variable "scsihw" {
  type        = string
  default     = "virtio-scsi-pci"
  description = "SCSI device for boot disk"
}

variable "disk_size" {
  type        = string
  default     = "40G"
  description = "Size of boot disk"
}

variable "nic" {
  type        = string
  default     = "virtio"
  description = "Model of Network Interface"
}

variable "bridge" {
  type        = string
  default     = "vmbr0"
  description = "Bridge Interface for VM"
}

variable "ipconfig0" {
  type        = string
  default     = "ip=dhcp"
  description = "IP configuration for net adapter #0 on VM"
}

variable "agent" {
  type        = number
  default     = 1
  description = "QEMU guest agent installed on VM"
}

variable "ciuser" {
  type        = string
  default     = "ubuntu"
  description = "Changes the default cloud-init user."
}
variable "cipassword" {
  type        = string
  default     = "password"
  description = "Changes the default cloud-init user password."
}
variable "sshkeys" {
  type        = string
  default     = ""
  description = "Add ssh public keys to VM."
}