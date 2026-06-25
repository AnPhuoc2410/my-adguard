#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define color codes for formatting output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0;m' # No Color

echo -e "${BLUE}=====================================================${NC}"
echo -e "${BLUE}          Homelab ZSH & Oh My Zsh Installer          ${NC}"
echo -e "${BLUE}=====================================================${NC}"

# 1. Check if ZSH is installed
if ! command -v zsh &> /dev/null; then
    echo -e "${YELLOW}[!] ZSH is not installed.${NC}"
    if command -v apt-get &> /dev/null; then
        echo -e "${BLUE}[*] Installing ZSH via apt...${NC}"
        sudo apt-get update && sudo apt-get install -y zsh
    elif command -v brew &> /dev/null; then
        echo -e "${BLUE}[*] Installing ZSH via Homebrew...${NC}"
        brew install zsh
    else
        echo -e "${RED}[x] Unsupported package manager. Please install zsh manually, then re-run this script.${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}[✓] ZSH is already installed.${NC}"
fi

# 2. Check and Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${BLUE}[*] Installing Oh My Zsh...${NC}"
    # Install Oh My Zsh non-interactively to prevent stopping the script
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo -e "${GREEN}[✓] Oh My Zsh installed successfully.${NC}"
else
    echo -e "${GREEN}[✓] Oh My Zsh is already installed.${NC}"
fi

# Set custom directory paths
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# 3. Clone custom plugins if not present
echo -e "${BLUE}[*] Setting up custom plugins...${NC}"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo -e "${BLUE}[*] Cloning zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo -e "${GREEN}[✓] Cloned zsh-autosuggestions.${NC}"
else
    echo -e "${GREEN}[✓] zsh-autosuggestions is already installed.${NC}"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo -e "${BLUE}[*] Cloning zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    echo -e "${GREEN}[✓] Cloned zsh-syntax-highlighting.${NC}"
else
    echo -e "${GREEN}[✓] zsh-syntax-highlighting is already installed.${NC}"
fi

# 4. Backup old .zshrc and copy new template
echo -e "${BLUE}[*] Configuring .zshrc...${NC}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$HOME/.zshrc" ]; then
    echo -e "${YELLOW}[!] Existing .zshrc found. Backing up to ~/.zshrc.bak...${NC}"
    cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo -e "${BLUE}[*] Copying template .zshrc...${NC}"
cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
echo -e "${GREEN}[✓] Copied .zshrc template to $HOME/.zshrc.${NC}"

# 5. Success Message
echo -e "${BLUE}=====================================================${NC}"
echo -e "${GREEN}      Installation Completed Successfully!           ${NC}"
echo -e "${BLUE}=====================================================${NC}"
echo -e "${YELLOW}Next steps:${NC}"
echo -e " 1. Set ZSH as your default shell (if not already):"
echo -e "    ${GREEN}chsh -s \$(which zsh)${NC}"
echo -e " 2. Restart your terminal or reload configuration:"
echo -e "    ${GREEN}source ~/.zshrc${NC}"
echo -e " 3. Install a Powerline-compatible font (optional, e.g. Cascadia Code or Nerd Fonts) for better icon support."
echo -e "${BLUE}=====================================================${NC}"
