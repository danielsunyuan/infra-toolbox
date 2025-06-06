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
│   │   └── example.ini          # Example inventory template
│   ├── playbooks/               # Ansible playbooks
│   │   ├── install-docker.yml   # Docker installation
│   │   ├── install-kubernetes.yml # Kubernetes deployment
│   │   ├── install-nctk.yml     # NVIDIA Container Toolkit installation
│   │   └── install-nvidia-drivers.yml # NVIDIA driver installation
│   ├── requirements.txt         # Ansible dependencies
│   └── scripts/
│       └── bootstrap.sh         # Server bootstrapping script
```

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
   ansible-galaxy install -r ansible/requirements.yml
   ```

## Usage

Full Stack Full Automated Control
```
make full-stack
```


```
source .venv/bin/activate
```


```
# Initial Bootstrap for dev of the cluster HPC
ANSIBLE_HOST_KEY_CHECKING=False \
ansible-playbook \
  -i ansible/inventory/inventory.ini \
  ansible/playbooks/ssh-bootstrap.yml \
  --ask-pass -K

# Lockdown for Resolving the Cluster to Prod
ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/lockdown.yml
```

### Docker Installation

To install Docker on target servers:

```
ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/install-docker.yml
```

### Kubernetes Deployment

To deploy a Kubernetes cluster using Kubespray:

```
cd ansible
ansible-playbook -i inventory/inventory.ini playbooks/install-kubernetes.yml
```

### NVIDIA Setup

To install NVIDIA drivers:

```
ansible-playbook -i ansible/inventory/inventory.ini ansible/playbooks/install-nvidia-drivers.yml
```

To install NVIDIA Container Toolkit:

```
ansible-playbook -i ansible/nventory/inventory.ini playbooks/install-nctk.yml
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