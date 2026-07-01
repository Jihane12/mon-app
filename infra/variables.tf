variable "app_name" {
  type = string
}

variable "acr_registry" {
  type = string
}

variable "acr_username" {
  type = string
}

variable "acr_password" {
  type      = string
  sensitive = true
}
