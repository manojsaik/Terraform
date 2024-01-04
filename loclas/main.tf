output "refer" {
  value = local.values[2]
}

variable "str" {
  type = string    
  default = 2     #tf converts the int/boolean into str when type explicitly given as stirng 
}

output "str" {
  value = var.str
}
