data "local_file" "ssh_public_key" {
  filename = "${path.module}/ssh_keys/id_rsa.pub"
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  
  content_type = "snippets"
  datastore_id = "snippets"
  node_name    = var.node_name

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: test-ubuntu
    timezone: Europe/London
    users:
      - default
      - name: ubuntu
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    package_upgrade: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
      - software-properties-common
      - docker.io
      - docker-compose
    mounts:
      - [ "/dev/sda", "/mnt/shared_storage", "ext4", "defaults", "0", "2" ]
    write_files:
      - path: /tmp/docker-compose.yml
        permissions: '0644'
        owner: root:root
        content: |
          version: "3"
          services:
            httpbin:
              image: kennethreitz/httpbin
              restart: always
              container_name: httpbin
              ports:
                - "8080:80"
            cloudflared:
              image: cloudflare/cloudflared:latest
              restart: always
              container_name: cloudflared
              command: tunnel run --token ${CF_TUNNEL_TOKEN}

    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - |
        for i in {1..10}; do
          [ -b /dev/sda ] && break
          echo "Waiting for /dev/sda..." && sleep 2
        done
        fsck -f -y /dev/sda || true
        mkdir /mnt/shared_storage
        mount /dev/sda /mnt/shared_storage
        TARGET_DIR="/mnt/shared_storage/${var.vm_name}"
        if [ ! -d "$TARGET_DIR" ]; then
          echo "Creating directory $TARGET_DIR"
          mkdir -p "$TARGET_DIR"
        else
          echo "Directory $TARGET_DIR already exists"
        fi
        chown ubuntu:ubuntu "$TARGET_DIR"
        chmod 755 "$TARGET_DIR"
      - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
      - add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
      - apt update -y && apt upgrade -y
      - apt install docker docker-compose -y
      - docker-compose -f /tmp/docker-compose.yml up -d
      - echo "done" > /tmp/cloud-config.done
    
    EOF

    file_name = "user-data-cloud-config.yaml"
  }
}
