# Ollama & Open WebUI

This stack runs Large Language Models (LLMs) locally on your system and provides a beautiful, ChatGPT-like web user interface.

## Directory Structure

* `docker-compose.yml` - Docker container deployment definition for both Ollama and Open WebUI.
* `ollama/` - Persisted data containing downloaded LLM models (e.g., Llama 3, Phi 3).
* `open-webui/` - Persisted Web UI configurations, user accounts, and conversation histories.

## Ports Overview

| Port | Protocol | Purpose |
|------|----------|---------|
| `11434` | TCP | Ollama API Endpoint (for external apps) |
| `3080` | TCP | Open WebUI Web Dashboard (ChatGPT interface) |

## How to Deploy

1. Open your terminal in this directory.
2. Start the stack:
   ```bash
   docker compose up -d
   ```
3. Open your browser and navigate to the Web UI:
   * **URL:** `http://<your-server-ip>:3080`
4. Register a new user on first launch. **Note:** The first registered user will automatically become the **Owner/Administrator**.

---

## Enabling GPU Acceleration (NVIDIA)

To speed up model inference using an NVIDIA graphics card:

1. **Host Setup:** Make sure you have the official NVIDIA GPU drivers installed on your host machine.
2. **Docker Toolkit:** Install the **NVIDIA Container Toolkit** on the host OS (or ensure WSL 2 GPU integration is enabled in Docker Desktop settings on Windows).
3. **Configuration:**
   * Open `docker-compose.yml`.
   * Uncomment the `deploy` block under the `ollama` service:
     ```yaml
     deploy:
       resources:
         reservations:
           devices:
             - driver: nvidia
               count: all
               capabilities: [gpu]
     ```
4. **Re-deploy:** Restart the stack to apply the GPU configuration:
   ```bash
   docker compose down && docker compose up -d
   ```

---

## How to Download and Run Models

Once you are logged into Open WebUI, you need to download a model to start chatting:

### Method 1: Via Web UI (Recommended)
1. Go to **Settings** > **Admin Settings** > **Models** inside Open WebUI.
2. Under "Pull a model from Ollama.com", type the model name (e.g., `llama3.8b` or `qwen2.5:7b` or `phi3:latest`).
3. Click the download icon and wait for it to complete.

### Method 2: Via Terminal CLI
If you prefer running a command, run this in your terminal:
```bash
# Pull Llama 3 model
docker exec -it ollama ollama run llama3

# Pull Qwen 2.5 model
docker exec -it ollama ollama run qwen2.5
```
Once downloaded, the model will instantly appear in the Open WebUI dropdown.
