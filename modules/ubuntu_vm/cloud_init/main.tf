data "local_file" "ssh_public_key" {
  filename = "${path.module}/ssh_keys/id_rsa.pub"
}

data "template_file" "stack_json" {
  template = file("${path.module}/templates/portainer-git-stack.json.tmpl")
  vars = {
    cf_tunnel_token = var.cf_tunnel_token
  }
}

data "template_file" "portainer_script" {
  template = file("${path.module}/templates/portainer-setup.sh")
  vars = {
    portainer_password = var.portainer_admin_password
  }
}

data "template_file" "cloud_init" {
  template = file("${path.module}/templates/cloud-init.yaml.tmpl")
  vars = {
    cf_tunnel_token  = var.cf_tunnel_token
    ssh_pub_key      = trimspace(data.local_file.ssh_public_key.content)
    stack_json       = data.template_file.stack_json.rendered
    portainer_script = data.template_file.portainer_script.rendered
    vm_name          = var.vm_name
  }
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  
  content_type = "snippets"
  datastore_id = "snippets"
  node_name    = var.node_name
  source_raw {
    
    data = data.template_file.cloud_init.rendered
  
    file_name = "user-data-cloud-config.yaml"
  }
}
