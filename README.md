# Fedora/Ubuntu Post Install

Projeto Ansible para configurar uma workstation de desenvolvimento.

## Estrutura

- Fedora Workstation
- Ubuntu Desktop
- Docker
- Git
- PostgreSQL
- Google Chrome
- VS Code
- Terraform
- AWS CLI
- kubectl
- Helm
- k9s
- Kind
- Minikube

## Requisitos

- Fedora 44+ ou Ubuntu 24.04+
- sudo
- Git

## Instalação

```bash
./install-ansible.sh
```

## Executando

```bash
ansible-playbook playbooks/site.yml --ask-become-pass
```

Ou apenas uma categoria:

```bash
ansible-playbook playbooks/site.yml --tags docker
```
