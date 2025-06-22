variable "esxi_host" {
  description = "IP or hostname of standalone ESXi"
  type        = string
}

variable "esxi_user" {
  description = "ESXi username"
  type        = string
  default     = "root"
}

variable "esxi_password" {
  description = "ESXi password"
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "firmware" {
  description = "firmware type"
  type        = string
}

variable "cpu" {
  description = "CPU count"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 40
}

variable "guest_id" {
  description = "Guest OS identifier"
  type        = string
}
