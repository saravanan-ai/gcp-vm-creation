variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "zone" {
  description = "The GCP zone"
  type        = string
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type"
  type        = string
}


variable "disk_size" {
  description = "The size of the disk in GB"
  type        = number
}

variable "disk_type" {
  description = "The type of the disk"
  type        = string
}
