terraform {
  required_providers {
    vsphere = {
      source  = "localdomain/telmate/vmware"
      version = "0.3.0"
    }
  }
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  guest_id         = var.guest_id

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

  cdrom {
    datastore_id = var.datastore_id
    path         = var.iso_path
  }

  lifecycle {
    ignore_changes = [clone]
  }
  
  firmware = "bios" # 或 "efi" 若你是 UEFI PXE server

  boot {
    enter_setup_mode = false
    delay            = 2000
    retry            = true
    retry_delay      = 10000
    network_boot     = true       # 關鍵：PXE boot
    disk             = true
    cdrom            = false
  }

  clone_from_vm = false  # 建立空 VM，可搭配 PXE 安裝系統
}
