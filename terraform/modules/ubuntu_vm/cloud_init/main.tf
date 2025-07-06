locals {
  rendered_stacks = [
    for s in var.enabled_stacks : {
      path = "/opt/stack-${s.name}.json"
      permissions = "0644"
      content = templatefile("${path.root}/../templates/portainer-stack.json.tmpl", {
        name         = s.name
        repo_url     = s.repo_url
        compose_path = s.path
        env_block    = join(",", [
          for k, v in s.env : "{ \"name\": \"${k}\", \"value\": \"${v}\" }"
        ])
      })
    }
  ]

  rendered_stacks_string = join("\n", [
  for f in local.rendered_stacks : <<-EOT
  - path: ${f.path}
    permissions: '${f.permissions}'
    content: |
      ${indent(4, f.content)}
  EOT
  ])
}


data "local_file" "ssh_public_key" {
  filename = "${path.module}/ssh_keys/id_rsa.pub"
}


data "template_file" "portainer_script" {
  template = file("${path.root}/../templates/portainer-setup.sh")
  vars = {
    portainer_password = var.portainer_admin_password
  }
}

data "template_file" "cloud_init" {
  template = file("${path.root}/../templates/cloud-init.yaml.tmpl")
  vars = {
    ssh_pub_key      = trimspace(data.local_file.ssh_public_key.content)
    rendered_stacks  = local.rendered_stacks_string
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
