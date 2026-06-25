# n8n Workflow Automation (Queue Mode)

This folder contains a production-grade, highly-scalable deployment of n8n running in **Queue Mode**. Instead of running all executions inside a single container (default SQLite mode), this setup separates the administrative Web UI from background task execution, leveraging PostgreSQL for database storage and Redis as a message broker.

---

## 🏗️ Architecture Overview

The stack comprises the following services:

1. **PostgreSQL (`postgres:16-alpine`)**: The relational database used to store users, credentials, workflow schemas, and execution logs.
2. **Redis (`redis:7-alpine`)**: The message broker used to coordinate work queues between the n8n main instance and background workers.
3. **n8n Main (`n8n_main`)**: Handles the Web UI, workflow designer, API, and incoming webhook triggers.
4. **n8n Worker (`n8n-worker`)**: Automatically pulls execution jobs from the Redis queue and processes them in the background, freeing up the main interface.
5. **n8n Runners (`n8n-runner` & `n8n-worker-runner`)**: Executes external scripts (like JavaScript or Python code blocks) in isolated environments for security and performance.

---

## 📂 Directory Structure

* `docker-compose.yml` - Defines the multi-container stack (Postgres, Redis, Main, Workers, and Runners).
* `.env` - Centralized file containing environment configurations and database credentials.
* `init-data.sh` - Database entrypoint initialization script that automatically creates the non-root PostgreSQL user and sets permissions on first boot.

---

## 📊 Ports Overview

| Port | Protocol | Purpose |
|------|----------|---------|
| `5678` | TCP | n8n Web UI Dashboard & Webhook Listener |

*Note: Redis and PostgreSQL do not expose ports to the host system. They are isolated inside the `homelab-net` network and accessible only to other containers in the stack.*

---

## 🚀 How to Deploy

### Step 1: Configure Environment Variables
Open the `.env` file and replace the placeholder passwords and keys with strong, custom values:
* `POSTGRES_USER` / `POSTGRES_PASSWORD`: Superuser credentials for Postgres.
* `POSTGRES_NON_ROOT_USER` / `POSTGRES_NON_ROOT_PASSWORD`: The standard user n8n uses to interact with the database.
* `ENCRYPTION_KEY`: A unique key n8n uses to encrypt credentials in the database. **Save this key in a secure password manager!** If you lose it, you will not be able to decrypt your API keys and credentials.
* `RUNNERS_AUTH_TOKEN`: Security token used to authorize the runners connecting to the brokers.

### Step 2: Configure Webhook URL (Required for external APIs)
If you plan to use webhooks (e.g., receiving triggers from Telegram, GitHub, or Stripe), open `docker-compose.yml` and modify these variables under `x-shared`:
```yaml
- N8N_HOST=your-domain.local
- WEBHOOK_URL=https://your-domain.local/
```
*(If running purely locally on LAN, you can use your server's local IP: e.g., `192.168.1.100`)*

### Step 3: Run the Stack
Run the following command to start all services:
```bash
docker compose up -d
```

---

## 🔍 Troubleshooting & Maintenance

### Check Container Statuses
To verify that all services (db, redis, main, workers, runners) are healthy and running:
```bash
docker compose ps
```

### View Service Logs
If n8n is not loading or failing to connect to Postgres/Redis, check the logs:
```bash
# View all logs
docker compose logs -f

# View n8n Main logs only
docker compose logs -f n8n
```

### Resetting or Backing up Database
* **Database Volume:** The Postgres database stores its files inside the Docker named volume `db_storage`.
* **n8n Storage:** File attachments, nodes, and local cached data are stored in `n8n_storage`.
