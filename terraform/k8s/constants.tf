locals {
  machine_map = {
    machines = {
      k8s = {
        name                = "k8s-devqa"
        target_node         = "pve" # Name of the Proxmox Server
        qemu_os             = "other" # Type of Operating System
        os_type             = "cloud-init" # Set to cloud-init to utilize templates
        agent               = 1           # Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the guest for this to have any effect.
        full_clone          = false        # Set to true to create a full clone, or false to create a linked clone. See the docs about cloning for more info. Only applies when clone is set.
        template            = "VM 9000" # Name of Template Used to Clone
        cores               = 4
        socket              = 1
        memory              = 8192
        storage             = "40G" # Size of Secondary hard drive assiged as bootable
        ip_address          = "10.0.0.3"
        gateway             = "10.0.0.1"
        description         = "k8s-devqa"
        ssh_user            = "magicadmin"
        mac_address         = "02:07:14:b4:37:24"
        disk_type           = "virtio"
        storage_dev         = "local"
        network_bridge_type = "vmbr0"
        network_model       = "virtio"
        automatic_reboot    = true
        network_firewall    = false #defaults to false
        dns_servers         = "10.0.0.2"
      }
    }
  }

  machines = lookup(local.machine_map, "machines", {})
}