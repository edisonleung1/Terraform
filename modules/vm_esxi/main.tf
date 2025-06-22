terraform {
  required_providers {
    vsphere = {
      source  = "vmware/vsphere" # <-- change from hashicorp/vsphere
      version = ">= 2.13.0"
    }
  }
}

resource "vsphere_virtual_machine" "vm" {

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  name             = var.vm_name
  firmware = var.firmware
  guest_id         = var.guest_id
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id

  scsi_type             = "pvscsi"
  scsi_controller_count = 1

  num_cpus = var.cpu
  memory   = var.memory

  network_interface {
    network_id   = var.network_id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    thin_provisioned = true
  }

  lifecycle {
    ignore_changes = [clone]
  }
  
}
