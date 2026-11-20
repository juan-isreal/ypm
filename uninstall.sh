#!/usr/bin/env bash
set -e

echo "Uninstalling ypm..."

# 1. Remove the global system command
if [ -f "/usr/local/bin/ypm" ]; then
    echo "Removing /usr/local/bin/ypm (may ask for your Mac password)..."
    sudo rm -f /usr/local/bin/ypm
fi

# 2. Remove the ~/.ypm directory and all installed packages
if [ -d "$HOME/.ypm" ]; then
    echo "Removing $HOME/.ypm..."
    rm -rf "$HOME/.ypm"
fi

# 3. Clean up shell config lines (~/.zshrc or ~/.bashrc)
for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
    if [ -f "$rc" ] && grep -q "\.ypm" "$rc"; then
        echo "Cleaning up $rc..."
        # Create a backup just in case, then remove ypm lines
        cp "$rc" "${rc}.bak"
        grep -v "# Added by ypm package manager" "${rc}.bak" | grep -v "\.ypm/" > "$rc"
        rm -f "${rc}.bak"
    fi
done

echo "ypm has been completely uninstalled!"
echo "Restart shell with exec \$SHELL."
exec $SHELL
clear
