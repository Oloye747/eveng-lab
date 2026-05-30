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


