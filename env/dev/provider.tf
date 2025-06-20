provider "vsphere" {
  user                 = var.esxi_user
  password             = var.esxi_password
  vsphere_server       = var.esxi_host
  allow_unverified_ssl = true
}