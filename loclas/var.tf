locals {
  values = ["Manoj","Giri","Suri"]
}

output "print" {
    value = local.values
}