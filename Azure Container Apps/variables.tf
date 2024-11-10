variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "westeurope"
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
  default     = "myapp"
}

variable "env" {
  description = "Application env"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Location short name "
  type        = string
  default     = "we"
}

variable "stage" {
  description = "Unknown variable "
  type        = string
  default     = "gav"
}

variable "prefix" {
  description = "Unknown variable "
  type        = string
  default     = "med"
}