variable "eveng_host" {
  description = "EVE-NG API base URL"
  type        = string
}

variable "eveng_username" {
  description = "EVE-NG login username"
  type        = string
  default     = "admin"
}

variable "eveng_password" {
  description = "EVE-NG login password"
  type        = string
  sensitive   = true
}

variable "lab_name" {
  description = "Name of the lab to create"
  type        = string
  default     = "Enterprise-Core-Lab"
}

variable "lab_author" {
  description = "Author metadata on the lab"
  type        = string
  default     = "Gbabo Peter Okirika"
}
