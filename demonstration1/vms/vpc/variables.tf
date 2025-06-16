variable "env_name" {
  description = "Environment name for network"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "cidr" {
  description = "CIDR block for subnet"
  type        = string
}

terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 1.8.4"
}