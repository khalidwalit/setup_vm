#!/bin/bash

set -e

echo "🔧 Updating system..."
sudo apt update
sudo apt upgrade -y

echo "🧹 Removing older Docker versions (if any)..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "🔑 Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📦 Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index with Docker repo..."
sudo apt update

echo "🐳 Installing Docker Engine, CLI and containerd..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🧪 Verifying Docker installation..."
sudo docker version
sudo docker compose version

echo "✅ Docker and Docker Compose installed successfully."

echo "🔓 Adding current user to the docker group..."
sudo usermod -aG docker $USER

echo "🔁 You need to log out and back in (or reboot) for group changes to take effect."

