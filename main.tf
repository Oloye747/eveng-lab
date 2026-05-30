resource "eveng_lab" "this" {
  name   = var.lab_name
  author = var.lab_author
  body   = "Managed by Terraform. Do not edit manually."
}

resource "eveng_network" "mgmt" {
  lab_path = eveng_lab.this.path
  name     = "mgmt"
  type     = "bridge"
  icon     = "01-Cloud-Default.svg"
  top      = 20
  left     = 20
}

resource "eveng_network" "lan_core" {
  lab_path = eveng_lab.this.path
  name     = "lan-core"
  type     = "bridge"
  icon     = "01-Cloud-Default.svg"
  top      = 100
  left     = 100
}

resource "eveng_network" "user" {
  lab_path = eveng_lab.this.path
  name     = "user"
  type     = "bridge"
  icon     = "01-Cloud-Default.svg"
  top      = 220
  left     = 100
}