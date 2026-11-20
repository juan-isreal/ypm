#!/usr/bin/env bash
set -e

REPO_USER="juan-isreal"
REPO_NAME="ypm"
BRANCH="main"
INSTALL_PATH="/usr/local/bin/ypm"

echo "Installing ypm..."

# 1. Make sure /usr/local/bin exists
if [ ! -d "/usr/local/bin" ]; then
    echo "Creating /usr/local/bin (may ask for your Mac password)..."
    sudo mkdir -p /usr/local/bin
fi

# 2. Install from local file if cloned, otherwise download from GitHub
if [ -f "./ypm" ]; then
    echo "Installing from local ./ypm file..."
    sudo cp ./ypm "$INSTALL_PATH"
else
    echo "Downloading ypm from GitHub..."
    RAW_URL="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/refs/heads/${BRANCH}/ypm"
    sudo curl -fsSL "$RAW_URL" -o "$INSTALL_PATH"
fi

# 3. Make it executable
sudo chmod +x "$INSTALL_PATH"

# 4. Run ypm setup to configure PATH and PYTHONPATH
ypm setup

echo ""
echo "ypm installed successfully!"
echo "Restart your terminal or run: source ~/.zshrc"
