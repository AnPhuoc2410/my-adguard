# Portainer Community Edition (CE)

Portainer is a lightweight, web-based management user interface that allows you to easily manage your Docker containers, images, volumes, networks, and stacks.

## Directory Structure

* `docker-compose.yml` - Docker container deployment definition.
* `data/` - Persisted data containing users, settings, and application configurations.

## Ports Overview

| Port | Protocol | Purpose |
|------|----------|---------|
| `9000` | TCP | HTTP Web UI (Legacy) |
| `9443` | TCP | HTTPS Web UI (Secure - Recommended) |

## How to Deploy

1. Open your terminal in this directory.
2. Start Portainer:
   ```bash
   docker compose up -d
   ```
3. Open your browser and access the secure interface:
   * **URL:** `https://<your-server-ip>:9443`
   * *Note:* You might see a certificate warning because Portainer uses a self-signed certificate. You can safely click "Advanced" and proceed to the site.
   * *Alternative (HTTP):* `http://<your-server-ip>:9000`
4. Create the initial administrator account.
5. Choose **"Get Started"** to connect to the local Docker environment.

## Windows / WSL Compatibility Notes

If you are running Docker Desktop on Windows:
* **WSL 2 Integration:** If you are deploying this from within a WSL 2 Linux distribution, the default socket path `/var/run/docker.sock` will work out of the box.
* **Windows Command Prompt / PowerShell:** If you are running Docker natively in Windows Command Prompt without WSL, you may need to use the named pipe instead:
  ```yaml
  volumes:
    - \\.\pipe\docker_engine:\\.\pipe\docker_engine
    - ./data:/data
  ```
  *(However, for most WSL/Docker Desktop configurations, the default `/var/run/docker.sock` is fully supported).*
