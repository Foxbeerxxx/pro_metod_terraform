# Домашнее задание к занятию "`Название занятия`" - `Фамилия и имя студента`



---

### Задание 1

1. `Дописываю код в cloud-init.yml`
```
#cloud-config
users:
  - default
  - name: ubuntu
    ssh-authorized-keys:
      - ${ssh_key}
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    shell: /bin/bash

packages:
  - nginx

```
2. `Также меняю код в main.tf`
3. `Проверяю сборку terraform init, terraform apply`

![1](https://github.com/Foxbeerxxx/pro_metod_terraform/blob/main/img/img1.png)

4. `Подключаюсь на ВМ и пробиваю команду для теста sudo nginx -t `

![2](https://github.com/Foxbeerxxx/pro_metod_terraform/blob/main/img/img2.png)


---

### Задание 2



1. `Добавляю модуль vpc в котором распологаю три файла, а именно main.tf,outputs.tf,variables.tf`
2. `Дописываю в основной main.tf сам модуль и меняю в переменных на на звание модуля `
```
locals {
  ssh_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}

data "template_file" "cloud_init" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    ssh_key = local.ssh_key
  }
}

resource "yandex_compute_instance" "vm_marketing" {
  name        = "vm-marketing"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"  

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
  #  subnet_id = var.subnet_id
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
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  network_interface {
  #  subnet_id = var.subnet_id
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
  zone     = "ru-central1-a"
  cidr     = "10.0.1.0/24"
}


```
3. `Запускаю terraform init и terraform apply и вся структура поднялась`

![3](https://github.com/Foxbeerxxx/pro_metod_terraform/blob/main/img/img3.png)


4. `Заполните здесь этапы выполнения, если требуется ....`
5. `Заполните здесь этапы выполнения, если требуется ....`
6. 

```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![Название скриншота 2](ссылка на скриншот 2)`


---

### Задание 3

`Приведите ответ в свободной форме........`

1. `Заполните здесь этапы выполнения, если требуется ....`
2. `Заполните здесь этапы выполнения, если требуется ....`
3. `Заполните здесь этапы выполнения, если требуется ....`
4. `Заполните здесь этапы выполнения, если требуется ....`
5. `Заполните здесь этапы выполнения, если требуется ....`
6. 

```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![Название скриншота](ссылка на скриншот)`

### Задание 4

`Приведите ответ в свободной форме........`

1. `Заполните здесь этапы выполнения, если требуется ....`
2. `Заполните здесь этапы выполнения, если требуется ....`
3. `Заполните здесь этапы выполнения, если требуется ....`
4. `Заполните здесь этапы выполнения, если требуется ....`
5. `Заполните здесь этапы выполнения, если требуется ....`
6. 

```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![Название скриншота](ссылка на скриншот)`
