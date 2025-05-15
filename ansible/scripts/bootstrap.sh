#!/bin/bash
set -e

echo "🔧 Bootstrapping infra-toolbox virtualenv..."

# Create Python venv (isolated Ansible environment)
if [ ! -d ".venv" ]; then
  echo "📦 Creating Python virtual environment..."
  python3 -m venv .venv
fi

# Activate the virtualenv
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install Ansible inside the venv
pip install ansible

# Install Ansible Galaxy roles (if any roles section exists)
if grep -q "roles:" requirements.yml; then
  echo "📥 Installing roles from requirements.yml..."
  ansible-galaxy install -r requirements.yml -p ansible/roles
fi

# Install Ansible Galaxy collections
if grep -q "collections:" requirements.yml; then
  echo "📥 Installing collections from requirements.yml..."
  ansible-galaxy collection install -r requirements.yml -p ansible/collections
fi

echo "✅ Bootstrap complete. Activate your environment with:"
echo "   source .venv/bin/activate"
