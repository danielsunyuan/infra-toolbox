# Infra Toolbox

A collection of infrastructure automation tools and scripts to streamline server provisioning, configuration, and management.

## Overview

This repository contains Ansible playbooks, roles, and scripts for automating infrastructure tasks, including:

- Docker installation and configuration
- Kubernetes cluster deployment using Kubespray
- NVIDIA driver and toolkit installation
- Server bootstrapping and configuration

## Repository Structure

```
.
├── ansible/
│   ├── ansible.cfg              # Ansible configuration
│   ├── group_vars/              # Variable definitions for host groups
│   │   ├── pxe.yml              # PXE server variables
│   │   └── workers.yml          # Worker node variables
│   ├── inventory/               # Inventory files
│   │   ├── example.ini          # Example inventory template
│   ├── playbooks/               # Ansible playbooks
│   │   ├── install-docker.yml   # Docker installation
│   │   ├── install-kubernetes.yml # Kubernetes deployment
│   │   ├── install-nctk.yml     # NVIDIA Container Toolkit installation
│   │   └── install-nvidia-drivers.yml # NVIDIA driver installation
│   ├── requirements.txt         # Ansible dependencies
│   └── scripts/
│       └── bootstrap.sh         # Server bootstrapping script
```g

## Prerequisites

- Ansible 2.9+
- Python 3.6+
- SSH access to target servers
- Sudo privileges on target servers

## Installation

1. Clone this repository:
   ```
   git clone https://github.com/danielsunyuan/infra-toolbox.git
   cd infra-toolbox
   ```

2. Install Ansible requirements:
   ```
   ansible-galaxy install -r ansible/requirements.txt
   ```

## Usage

### Docker Installation

To install Docker on target servers:

```
cd ansible
ansible-playbook -i inventory/your-inventory.ini playbooks/install-docker.yml
```

### Kubernetes Deployment

To deploy a Kubernetes cluster using Kubespray:

```
cd ansible
ansible-playbook -i inventory/your-inventory.ini playbooks/install-kubernetes.yml
```

### NVIDIA Setup

To install NVIDIA drivers:

```
cd ansible
ansible-playbook -i inventory/your-inventory.ini playbooks/install-nvidia-drivers.yml
```

To install NVIDIA Container Toolkit:

```
cd ansible
ansible-playbook -i inventory/your-inventory.ini playbooks/install-nctk.yml
```

### Bootstrap Script

For initial server setup:

```
./ansible/scripts/bootstrap.sh <server_ip> <ssh_user>
```

## Customizing Deployments

Edit the files in `ansible/group_vars/` to customize deployment parameters.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

[MIT License](LICENSE)