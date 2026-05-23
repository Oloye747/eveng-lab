output "lab_path" {
  description = "EVE-NG UNL path for the created lab"
  value       = eveng_lab.this.path
}

output "router1_id" {
  description = "Node ID of router1"
  value       = eveng_node.router1.id
}