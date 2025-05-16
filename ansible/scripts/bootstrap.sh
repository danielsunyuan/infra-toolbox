#!/bin/bash
set -e

echo "🔧 Bootstrapping infra-toolbox on fresh Ubuntu..."

# 🧱 Phase 1: Install system-level dependencies
echo "📦 Installing system dependencies (python3, pip, sshpass, etc)..."
sudo apt update
sudo apt install -y python3 python3-venv python3-pip sshpass git curl

# 🥽 Phase 2: Setup Python venv
echo "📦 Creating and activating Python virtual environment..."
python3 -m venv .venv
source .venv/bin/activate

# 🔼 Upgrade pip inside venv
pip install --upgrade pip

# 🛠️ Install Ansible and required packages inside venv
pip install ansible distlib

# 📥 Install Galaxy roles
if grep -q "roles:" ansible/requirements.yml; then
  echo "📥 Installing Galaxy roles..."
  ansible-galaxy install -r ansible/requirements.yml -p ansible/roles
fi

# 📥 Install Galaxy collections
if grep -q "collections:" ansible/requirements.yml; then
  echo "📥 Installing Galaxy collections..."
  ansible-galaxy collection install -r ansible/requirements.yml -p ansible/collections
fi

echo "✅ Bootstrap complete!"
echo "👉 To activate your Ansible environment, run:"
echo "   source .venv/bin/activate"
