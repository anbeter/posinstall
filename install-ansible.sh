#!/usr/bin/env bash

set -euo pipefail

echo "Atualizando sistema..."

sudo dnf upgrade -y

echo "Instalando dependências..."

sudo dnf install -y \
    ansible \
    git \
    python3-pip \
    python3-libdnf5

echo "Instalando collections..."

ansible-galaxy collection install \
    community.general \
    community.docker \
    ansible.posix

echo
echo "Pronto!"
echo
echo "Agora execute:"
echo
echo "cd /scripts/posinstall"
echo "ansible-playbook playbook.yml"
