variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "environment" {
  type = string
}

variable "ip_restrictions" {
  type = list(object({ip_address = string, name = string}))
}