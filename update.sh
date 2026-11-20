#!/usr/bin/env bash
set -e

REPO_USER="juan-isreal"
REPO_NAME="ypm"
BRANCH="main"
INSTALL_PATH="/usr/local/bin/ypm"

echo "Updating ypm..."

# 1. Check if ypm is currently installed
if [ ! -f "$INSTALL_PATH" ]; then
    echo "ypm is not installed at $INSTALL_PATH. Run install.sh first!"
    exit 1
fi

# 2. Update from local ./ypm if inside a cloned repo, otherwise fetch latest from GitHub
if [ -f "./ypm" ] && [ -d "./.git" ]; then
    echo "Pulling latest changes from git..."
    git pull origin "$BRANCH"
    sudo cp ./ypm "$INSTALL_PATH"
else
    echo "Downloading latest ypm from GitHub..."
    RAW_URL="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/refs/heads/${BRANCH}/ypm"
    sudo curl -fsSL "$RAW_URL" -o "$INSTALL_PATH"
fi

# 3. Ensure executable permissions stay intact
sudo chmod +x "$INSTALL_PATH"

echo "ypm updated successfully!"
