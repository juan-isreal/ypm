# ypm — Pure Python Package Manager

A lightweight, zero-dependency package manager written in pure Python for installing CLI tools, Python libraries, and single files directly from GitHub repositories.

---

## Quick Install (One-Line Web Commands)

Run any of the scripts directly from GitHub without downloading them first:

### Install `ypm`
```bash
curl -fsSL https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/install.sh | bash
```

### Update `ypm`
```bash
curl -fsSL https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/update.sh | bash
```

### Uninstall `ypm`
```bash
curl -fsSL https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/uninstall.sh| bash
```

---

## Download Scripts Locally (Optional)

If you prefer to inspect or keep the management scripts on your machine before running them:

```bash
curl -fsSLO https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/install.sh
curl -fsSLO https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/update.sh
curl -fsSLO https://raw.githubusercontent.com/juan-isreal/ypm/refs/heads/main/uninstall.sh
chmod +x install.sh update.sh uninstall.sh
```

Then run them locally anytime:
```bash
./install.sh
./update.sh
./uninstall.sh
```

---

## Usage

Once installed, restart your terminal (or run `source ~/.zshrc` / `source ~/.bashrc`) and use `ypm` from anywhere:

| Command | Description |
| :--- | :--- |
| `ypm setup` | Configure `PATH` (`~/.ypm/bin`) and `PYTHONPATH` (`~/.ypm/packages`) |
| `ypm install <user/repo>` | Install a CLI tool or Python library globally from GitHub |
| `ypm get <user/repo/path/file>` | Download a single file directly into your current directory (`pwd`) |
| `ypm remove <package>` | Uninstall a globally installed package |
| `ypm list` | View all installed packages |

### Examples

```bash
# Install a Python library or CLI tool globally
ypm install juan-isreal/json

# Grab a single file into your current project folder
ypm get juan-isreal/json/betterjson.py

# List installed packages
ypm list

# Remove a package
ypm remove json
```

---

## Making Your Repo `ypm`-Compatible (`ypm.json`)

`ypm` automatically detects single-file Python libraries and CLI scripts. For custom package names, entry points, or post-install commands, add an optional **`ypm.json`** file to the root of your repository:

```json
{
  "name": "betterjson",
  "type": "lib",
  "entry": "betterjson.py",
  "version": "1.0.0",
  "post_install": "echo 'Installed successfully!'"
}
```
