# 🏡 Homelab IAC · GitOps-powered Infrastructure-as-Code

Welcome to **homelab-iac** — my evolving, modular, and fully declarative infrastructure-as-code stack for homelab automation. It leverages modern DevOps best practices including **Tofu (Terraform fork)**, **cloud-init**, **Portainer Git Stacks**, and **Docker Compose**, orchestrated into a fully self-bootstrapping and GitOps-friendly environment running on **Proxmox VE**.

This repo serves as a blueprint for deploying reproducible virtual machines, initializing container services, and scaling modular applications using declarative automation.

---

## ✨ Features

- 🔧 **Infrastructure as Code** with [Tofu](https://opentofu.org/)
- ☁️ **Cloud-init Bootstrapping** per VM for first-time configuration
- 🐳 **Docker Compose Service Definitions** with Portainer Git Stack automation
- 💾 **Proxmox-native VM Provisioning** including storage mounts
- 💡 **Dynamic Stack Targeting** — easily select which services run on which VMs using simple variables
- 🔁 **Fully GitOps-Oriented** with centralized Compose templates

---

## 🚀 Quick Overview

This repository contains:

| Directory      | Purpose                                 |
|----------------|-----------------------------------------|
| `terraform/`   | Tofu modules for provisioning VMs, volumes, and networks on Proxmox VE |
| `docker/`      | Per-service Docker Compose files (e.g. `cloudflared`, `httpbin`, etc.) |
| `templates/`   | Templated `cloud-init`, stack JSON, and shell scripts |
| `ansible/`     | (Optional) Pull-mode Ansible playbooks for post-boot customization |

---

## 🧱 Infrastructure Stack

| Layer        | Tool                  |
|--------------|-----------------------|
| VM Host      | Proxmox VE            |
| VM Lifecycle | [Tofu (Terraform)]    |
| Bootstrap    | `cloud-init`          |
| Containers   | Docker + Compose      |
| GitOps       | Portainer Git Stacks  |

---

## 🛠️ Usage

1. Clone the repo
2. Define your VM stacks:

```hcl
enabled_stacks = [
  {
    name = "cloudflared"
    path = "docker/cloudflared/docker-compose.yml"
    env  = { CF_TUNNEL_TOKEN = var.cf_tunnel_token }
  },
  {
    name = "httpbin"
    path = "docker/httpbin/docker-compose.yml"
    env  = {}
  }
]
```

3. Apply via Tofu:

```bash
tofu init
tofu apply
```

4. Watch as your VM:
   - Boots
   - Installs Docker + Portainer
   - Registers Git stacks
   - Deploys containers 🎉

---

## 🧠 Why?

Building and scaling a homegrown private cloud taught me more than any course could — distributed architecture, idempotent automation, real-world secrets management, dependency orchestration, and dealing with edge cases you won’t find in corporate clouds. This repo reflects that journey.

If you’re looking for evidence of hands-on experience in infrastructure automation, GitOps, provisioning systems, and cloud-native tooling — this is it.

---

## 💡 Future Plans

- [ ] Optional Vault / secret management
- [ ] Private Git server with webhook auto-sync
- [ ] CI validation for Compose + cloud-init linting
- [ ] Host networking autoscan + VM DNS registration
- [ ] Ansible-pull Ready for optional post-boot provisioning
 
---

## 🙌 Shout-out

Built and maintained for personal use and exploration — not affiliated with any employer or company. If you found this project interesting or learned something from it, feel free to [⭐ star] it or fork it for your own lab.

---

## 👋 Contact

While I’m not actively job hunting, I’m always open to discussing infrastructure, home labs, DevOps culture, or quirky Terraform bugs. Let's connect 🤝


---

Let me know if you'd like badges, a rendered architecture diagram, or CI/CD status checks baked in too. This README’s designed to glow under both technical scrutiny *and* recruiter-friendly filters, while staying true to your vibe.