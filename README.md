# 🏡 Personal Homelab Dashboard

Welcome to the centralized repository for my self-hosted Homelab services. This project uses Docker Compose to run, manage, and scale local network applications, along with customized shell setups for terminal productivity.

---

## 📊 Services & Port Dashboard

Below is a quick reference guide of all services running in the Homelab:

| Service Name | Default Port | Protocol | Purpose | Directory Link |
| :--- | :--- | :--- | :--- | :--- |
| **AdGuard Home** | `80` / `53` / `3000` | HTTP / DNS | Network DNS Resolver & Ad Blocker | [📂 adguard](./adguard) |
| **Portainer CE** | `9443` / `9000` | HTTPS / HTTP | Comprehensive Docker Engine Management UI | [📂 portainer](./portainer) |
| **Uptime Kuma** | `3001` | HTTP | Service Uptime Monitoring & Alerts | [📂 uptime-kuma](./uptime-kuma) |
| **Dockge** | `5001` | HTTP | Docker Compose Stack-focused Editor & Monitor | [📂 dockge](./dockge) |
| **n8n** | `5678` | HTTP | Local Workflow & Automation Platform | [📂 n8n](./n8n) |
| **Ollama API** | `11434` | HTTP | Local Large Language Model (LLM) Engine | [📂 ollama](./ollama) |
| **Open WebUI** | `3080` | HTTP | ChatGPT-style web UI for Ollama | [📂 ollama](./ollama) |
| **Zsh Customization**| *Shell CLI* | SSH / TTY | Oh My Zsh, auto-suggestions, and Docker aliases | [📂 zsh-ohmyzsh](./zsh-ohmyzsh) |

---

## 🌐 Common Shared Network (`homelab-net`)

All Docker-compose configurations in this repository share a common Docker bridge network named **`homelab-net`**.

### Why use a shared network?
1. **Container Name Resolution:** It allows containers in different compose files to discover and communicate with each other directly using their container name.
   * *Example:* The `open-webui` container connects to the `ollama` container using the address `http://ollama:11434` rather than exposing traffic to the host IP.
2. **Isolation:** Services can run securely behind a unified network and communicate without exposing all internal ports to the outer host network.

Docker Compose will automatically create this network if it doesn't exist when you spin up your first stack.

---

## 🚀 Quick Start Guide

### Step 1: Set up your Terminal
Before configuring your Docker containers, improve your terminal productivity by setting up Zsh on your WSL 2 or Linux server:
```bash
cd zsh-ohmyzsh
chmod +x install.sh
./install.sh
source ~/.zshrc
```

### Step 2: Run a Service
To start any specific service, navigate to its folder and run it in detached mode (`-d`):
```bash
# Example: Deploying AdGuard Home
cd adguard
docker compose up -d
```

### Step 3: Edit configurations (Option A: CLI / Option B: Dockge Web UI)
* **Option A:** Edit the `docker-compose.yml` files directly in VS Code or your terminal text editor, then run `docker compose up -d` to apply changes.
* **Option B:** Open the **Dockge Dashboard** at `http://<your-server-ip>:5001` and follow the instructions in the [Dockge README](./dockge/README.md) to link this whole repository directory. You can then edit, update, start, and stop all these stacks straight from the browser!

---

## 🔒 Homelab Security Guidelines
* **Secrets Management:** Do not commit plain passwords or sensitive credentials (API tokens, database root passwords) to Git. Use a `.env` file in the service directories to store sensitive variables.
* **Firewall Configuration:** Ensure ports like `53` (DNS), `80` (AdGuard Web), and other dashboards are only accessible on your local network (LAN) and not exposed directly to the public internet unless protected by a reverse proxy or VPN (such as WireGuard or Tailscale).
