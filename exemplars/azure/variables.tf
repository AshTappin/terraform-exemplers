variable "environments" {
  type = map
  default = {
    ci = "ci"
    qa = "qa"
  }
}

variable "environment_key" {
  description = "env: ci or qa"
}