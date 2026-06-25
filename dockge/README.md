# Dockge

Dockge is a beautiful, easy-to-use, self-hosted manager for `docker-compose.yaml` files. It specializes in compose stacks, providing a clean UI to write, edit, start, stop, and monitor them.

Unlike Portainer's Stacks (which are stored in Portainer's internal database), Dockge stores stacks as plain directories on your disk. This makes Dockge **extremely git-friendly** and perfect for this Git-managed Homelab repository.

## Directory Structure

* `docker-compose.yml` - Docker container deployment definition.
* `data/` - Persisted configuration data for Dockge.

## Ports Overview

| Port | Protocol | Purpose |
|------|----------|---------|
| `5001` | TCP | Web UI Dashboard |

## How to Deploy

1. Open your terminal in this directory.
2. Start Dockge:
   ```bash
   docker compose up -d
   ```
3. Open your browser and navigate to:
   * **URL:** `http://<your-server-ip>:5001`
4. Set up your administrator username and password.

---

## Pro-Tip: Integrating Dockge with this Git Repo

To manage all the service folders in this `Homelab` repository directly from the Dockge UI:

1. Open `docker-compose.yml` in the `dockge/` folder.
2. Modify the host directory mapping for `/opt/stacks`. Change the left side of the volume mount to point to the parent path of this repository:
   ```yaml
   volumes:
     - /var/run/docker.sock:/var/run/docker.sock
     - ./data:/app/data
     - /path/to/your/VS Studio/Homelab:/opt/stacks
   ```
   *(For example, on Windows using WSL 2: `/mnt/d/VS Studio/Homelab:/opt/stacks`)*
3. Restart Dockge:
   ```bash
   docker compose up -d
   ```
4. Now, all your folders (`adguard`, `uptime-kuma`, `portainer`, `n8n`, `ollama`) will appear in Dockge as active stacks! You can update their code, start/stop them, and edit their compose files directly in the browser, and the changes will reflect in your Git repository.
