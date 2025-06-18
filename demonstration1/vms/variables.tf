### cloud vars

# SSH key (если нужно)
variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGiVcfW8Wa/DxbBNzmQcwn7hJOj7ji9eoTpFakVnY/AI webinar"
}

# Используем FAMILY вместо image_id
variable "image_family" {
  description = "Image family to get the latest image"
  type        = string
  default     = "ubuntu-2004-lts"
}

# VM platform
variable "platform_id" {
  description = "Platform ID for the VM"
  type        = string
  default     = "standard-v1"
}

# Cloud zone
variable "zone" {
  description = "Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

# VM CPU & RAM
variable "vm_cores" {
  description = "Number of CPU cores for the VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "RAM size in GB for the VM"
  type        = number
  default     = 2
}

# VPC CIDR
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.1.0/24"
}
