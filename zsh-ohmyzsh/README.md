# ZSH & Oh My Zsh Configurator

This folder contains an automated installer and an optimized configuration file (`.zshrc`) designed to turn a default shell on Linux, WSL, or macOS into a beautiful, productive terminal environment.

## Directory Structure

* `install.sh` - Bash shell script to automate installation.
* `.zshrc` - Tailored Zsh configuration template.

## Included Plugins

The installer pre-configures Oh My Zsh with these productivity plugins:
1. `git` - Handy Git aliases and prompt status.
2. `zsh-autosuggestions` - Fast fish-like command auto-suggestions based on history.
3. `zsh-syntax-highlighting` - Syntax highlighting in the shell prompt.
4. `sudo` - Press `ESC` twice to prefix the last command with `sudo`.
5. `copypath` - Copies the absolute path of the current directory to your clipboard.
6. `copyfile` - Copies the content of a file to your clipboard.
7. `colored-man-pages` - Adds colors to terminal help manual pages.
8. `extract` - A universal extraction command (`extract file.tar.gz`, `extract file.zip`, etc.).

---

## How to Install (Linux / WSL 2 / macOS)

1. Open your terminal in this directory.
2. Run the installer script:
   ```bash
   # Make the script executable
   chmod +x install.sh
   
   # Run the installer
   ./install.sh
   ```
3. Set Zsh as your default shell if prompted, or run:
   ```bash
   chsh -s $(which zsh)
   ```
4. Reload the configuration:
   ```bash
   source ~/.zshrc
   ```

---

## Helpful Commands & Aliases

This configuration adds several time-saving aliases to your terminal:

### Docker & Compose Shortcuts
* `dc` or `dco` - Shortcut for `docker compose`
* `dps` - Formats `docker ps` to display only Name, Status, and Ports in a clean table
* `dlogs <container>` - Shortcut for `docker logs -f`
* `dclean` - Safely prunes unused Docker images, containers, networks, and volumes

### Terminal Traversal
* `..` - Go up one directory (`cd ..`)
* `...` - Go up two directories (`cd ../..`)
* `ll` - Lists files in long format with sizes and coloring (`ls -lah`)
* `h` - Displays command history

### System & Editing
* `update` - Run system package updates (`apt update && apt upgrade`)
* `cleanup` - Autoremove and clean package cache
* `zshconfig` - Open `~/.zshrc` in nano for quick changes
