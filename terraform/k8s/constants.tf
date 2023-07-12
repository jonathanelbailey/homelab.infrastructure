locals {
  machine_map = {
    machines = {
      k8s = {
        name                = "k8s-devqa-1"
        target_node         = "pve" # Name of the Proxmox Server
        qemu_os             = "other" # Type of Operating System
        os_type             = "cloud-init" # Set to cloud-init to utilize templates
        agent               = 1           # Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect.
        full_clone          = false        # Set to true to create a full clone, or false to create a linked clone. See the docs about cloning for more info. Only applies when clone is set.
        template            = "k8s" # Name of Template Used to Clone
        cores               = 16
        socket              = 1
        memory              = 32768
        disk_gb             = 40
        ipconfig0           = "ip=dhcp"
        description         = "K8s Cluster for DevQA"
        storage_dev         = "local"
        network_bridge_type = "vmbr0"
        network_model       = "virtio"
      }
    }
  }

  machines = lookup(local.machine_map, "machines", {})
}