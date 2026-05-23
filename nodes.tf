resource "eveng_node" "router1" {
  lab_path = eveng_lab.this.path
  name     = "router1"
  template = "csr1000vng"
  type     = "qemu"
  top      = 150
  left     = 100

  lifecycle {
    prevent_destroy = true
  }
}

resource "eveng_node" "router2" {
  lab_path = eveng_lab.this.path
  name     = "router2"
  template = "csr1000vng"
  type     = "qemu"
  top      = 150
  left     = 400

  lifecycle {
    prevent_destroy = true
  }
}