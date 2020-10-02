provider "yandex" {
token     = "AgAAAABCS__nAATuwfzImpKBEUtwjBgIzE-7Kww"
cloud_id  = "b1gf6ugjqc3frqm0ijqb"
folder_id = "b1g4l494cgnejfisqgv2"
zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8oqoi914e13ecv3987"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9bq8eg9210chldu8unl"
    nat       = true
  }

  metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/appuser.pub")}"
  }

  connection {
  type = "ssh"
  host = yandex_compute_instance.app.network_interface.0.nat_ip_address
  user = "ubuntu"
  agent = false
  # путь до приватного ключа
  private_key = file("~/.ssh/appuser")
  }

  provisioner "file" {
  source = "files/puma.service"
  destination = "/tmp/puma.service"
}
  provisioner "remote-exec" {
  script = "files/deploy.sh"
}
}
