
locals {
  ssh_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}


data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_key = local.ssh_key
  }
}

data "yandex_compute_image" "latest_image" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm_marketing" {
  name        = "vm-marketing"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.latest_image.id
    }
  }

  network_interface {
    subnet_id = module.vpc_dev.subnet_id
    nat       = true
  }

  metadata = {
    user-data = data.template_file.cloud_init.rendered
  }

  labels = {
    project = "marketing"
  }
}

resource "yandex_compute_instance" "vm_analytics" {
  name        = "vm-analytics"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.latest_image.id
    }
  }

  network_interface {
    subnet_id = module.vpc_dev.subnet_id
    nat       = true
  }

  metadata = {
    user-data = data.template_file.cloud_init.rendered
  }

  labels = {
    project = "analytics"
  }
}

module "vpc_dev" {
  source   = "./vpc"
  env_name = "develop"
  zone     = var.zone
  cidr     = var.vpc_cidr
}
