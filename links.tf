resource "eveng_node_link" "router2_lan" {
  lab_path       = eveng_lab.this.path
  network_id     = eveng_network.lan_core.id
  source_node_id = eveng_node.router2.id
  source_port    = "Gi2"
}

resource "eveng_node_link" "router1_mgmt" {
  lab_path       = eveng_lab.this.path
  network_id     = eveng_network.mgmt.id
  source_node_id = eveng_node.router1.id
  source_port    = "Gi1"
}
resource "eveng_node_link" "router2_app" {
  lab_path       = eveng_lab.this.path
  network_id     = eveng_network.app.id
  source_node_id = eveng_node.router2.id
  source_port    = "Gi1"
}

resource "eveng_node_link" "router2_security" {
  lab_path       = eveng_lab.this.path
  network_id     = eveng_network.security.id
  source_node_id = eveng_node.router2.id
  source_port    = "Gi3"
}

resource "eveng_node_link" "router2_user" {
  lab_path       = eveng_lab.this.path
  network_id     = eveng_network.user.id
  source_node_id = eveng_node.router2.id
  source_port    = "Gi4"
}

