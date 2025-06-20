terraform {
  required_providers {
    vmware = {
      source  = "localdomain/telmate/vmware"
      version = "0.3.0"
    }
  }
}

data "vsphere_datacenter" "dc" {
  name = "ha-datacenter" # default name for standalone ESXi
}

data "vsphere_host" "host" {
  name          = var.esxi_host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "ds" {
  name          = "datastore1" # replace with your actual datastore name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "net" {
  name          = "VM Network" # replace with your actual network name
  datacenter_id = data.vsphere_datacenter.dc.id
}

module "vm" {
  source = "../../modules/vm_esxi"

  vm_name          = var.vm_name
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  guest_id         = "ubuntu64Guest"
  cpu              = var.cpu
  memory           = var.memory
  network_id       = data.vsphere_network.net.id
  disk_size        = var.disk_size
  iso_path         = var.iso_path
}
