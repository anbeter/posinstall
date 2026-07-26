#!/usr/bin/env bash

set -euo pipefail

BASE_DIR="/scripts/posinstall"

echo "Criando estrutura do projeto em ${BASE_DIR}..."

# ==============================================================================
# Diretórios principais
# ==============================================================================

mkdir -p "${BASE_DIR}"

mkdir -p "${BASE_DIR}/collections"
mkdir -p "${BASE_DIR}/inventory"
mkdir -p "${BASE_DIR}/group_vars"
mkdir -p "${BASE_DIR}/playbooks"
mkdir -p "${BASE_DIR}/roles"
mkdir -p "${BASE_DIR}/files"
mkdir -p "${BASE_DIR}/templates"

# ==============================================================================
# Roles
# ==============================================================================
# retirados de ROLES: virt_manager, kde
ROLES=(
    common
    docker
    git
    git_config
    postgres
    nginx
    google_chrome
    vscode
    terraform
    awscli
    kubectl
    helm
    k9s
    kind
    minikube
    fonts
    ssh
    zsh
)

for role in "${ROLES[@]}"; do
    mkdir -p "${BASE_DIR}/roles/${role}/tasks"
    mkdir -p "${BASE_DIR}/roles/${role}/handlers"
    mkdir -p "${BASE_DIR}/roles/${role}/defaults"
    mkdir -p "${BASE_DIR}/roles/${role}/vars"
    mkdir -p "${BASE_DIR}/roles/${role}/files"
    mkdir -p "${BASE_DIR}/roles/${role}/templates"
    mkdir -p "${BASE_DIR}/roles/${role}/meta"

    touch "${BASE_DIR}/roles/${role}/tasks/main.yml"
    touch "${BASE_DIR}/roles/${role}/handlers/main.yml"
    touch "${BASE_DIR}/roles/${role}/defaults/main.yml"
    touch "${BASE_DIR}/roles/${role}/vars/main.yml"
    touch "${BASE_DIR}/roles/${role}/meta/main.yml"
done

# ==============================================================================
# Arquivos principais
# ==============================================================================

touch "${BASE_DIR}/ansible.cfg"
touch "${BASE_DIR}/requirements.yml"
touch "${BASE_DIR}/README.md"
touch "${BASE_DIR}/install-ansible.sh"

# ==============================================================================
# Inventário
# ==============================================================================

touch "${BASE_DIR}/inventory/localhost.yml"

# ==============================================================================
# Variáveis globais
# ==============================================================================

touch "${BASE_DIR}/group_vars/all.yml"

# ==============================================================================
# Playbooks
# ==============================================================================

touch "${BASE_DIR}/playbooks/workstation.yml"
touch "${BASE_DIR}/playbooks/minimal.yml"
touch "${BASE_DIR}/playbooks/devops.yml"
touch "${BASE_DIR}/playbooks/kubernetes.yml"
touch "${BASE_DIR}/playbooks/desktop.yml"

# ==============================================================================
# Finalização
# ==============================================================================

echo
echo "Estrutura criada com sucesso."
echo

if command -v tree >/dev/null 2>&1; then
    tree "${BASE_DIR}"
else
    find "${BASE_DIR}"
fi


echo "ansible-playbook playbooks/site.yml"
