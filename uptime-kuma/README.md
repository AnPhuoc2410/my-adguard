# Uptime Kuma

Uptime Kuma is an easy-to-use, self-hosted monitoring tool. You can use it to monitor HTTP(s) websites, TCP ports, ping, DNS records, and system info, with real-time status updates and multi-channel notifications (e.g., Discord, Telegram, Slack, Email).

## Directory Structure

* `docker-compose.yml` - Docker container deployment definition.
* `data/` - Persisted configuration database and logs (SQLite).

## Ports Overview

| Port | Protocol | Purpose |
|------|----------|---------|
| `3001` | TCP | Web UI Dashboard |

## How to Deploy

1. Open your terminal in this directory.
2. Run the following command to start Uptime Kuma:
   ```bash
   docker compose up -d
   ```
3. Open your browser and access the Web Interface:
   * **URL:** `http://<your-server-ip>:3001`
4. Set up your administrator username and password on first launch.

## Features & Tips

* **Notification Settings:** Go to **Settings** > **Notifications** to set up alerts. You can integrate Uptime Kuma with tools like Telegram, Discord, Pushover, or Gotify to get instant alerts if a service goes down.
* **Status Pages:** You can create public or private status pages (**Status Pages** > **Add New Status Page**) to display the health of your services to other users without showing the admin dashboard.
* **DNS Monitoring:** You can query your local AdGuard Home instance directly to monitor local DNS resolution.
