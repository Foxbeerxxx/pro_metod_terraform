output "subnet_id" {
  value       = yandex_vpc_subnet.this.id
  description = "ID созданной подсети"
}

output "network_id" {
  value       = yandex_vpc_network.this.id
  description = "ID созданной сети"
}
