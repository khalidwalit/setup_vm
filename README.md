# 🐳 Docker & Docker Compose Installer for Ubuntu 24.04

This script installs the **latest stable versions** of Docker Engine and Docker Compose (as a plugin) on **Ubuntu 24.04**.

---

## 🚀 Quick Start

### 1. Clone this repository

```bash
git clone https://github.com/khalidwalit/setup_vm.git
cd setup_vm
```

### 2. Run the installer

```bash
chmod +x install.sh
./install.sh
```

### 3. Post-installation

```bash
docker --version
docker compose version
```


### 3. Generate ssh key

```bash
chmod +x generate_ssh_key.sh
sudo ./generate_ssh_key.sh your_email@example.com
sudo cat /root/.ssh/github_ed25519.pub
```
