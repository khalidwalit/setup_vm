#!/bin/bash

set -e

# Check if the user passed an email
if [ -z "$1" ]; then
    echo "❌ Usage: $0 your_email@example.com"
    exit 1
fi

EMAIL="$1"
KEY_DIR="/root/.ssh"
KEY_FILE="$KEY_DIR/github_ed25519"

echo "🔐 Generating SSH key for GitHub with email: $EMAIL"

# Ensure the directory exists
sudo mkdir -p $KEY_DIR
sudo chmod 700 $KEY_DIR

# Generate SSH key silently
sudo ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_FILE" -N ""

# Add the key to the ssh-agent (optional, for runtime usage)
eval "$(ssh-agent -s)"
sudo ssh-add "$KEY_FILE"

echo "✅ SSH key generated and saved to: $KEY_FILE"
echo "📎 Public key is in: ${KEY_FILE}.pub"
echo "🔒 Private key is securely stored and not displayed."

# Final reminder
echo ""
echo "📋 To view or copy the public key, run:"
echo "sudo cat ${KEY_FILE}.pub"
