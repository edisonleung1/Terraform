variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "resource_pool_id" {
  description = "Resource pool ID of the ESXi host"
  type        = string
}

variable "cpu" {
  description = "Number of CPUs"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory size in MB"
  type        = number
  default     = 2048
}

variable "datastore_id" {
  description = "Datastore ID where VM disks will be stored"
  type        = string
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 40
}

variable "network_id" {
  description = "Network ID for VM network interface"
  type        = string
}

variable "guest_id" {
  description = "Guest OS identifier"
  type        = string
}