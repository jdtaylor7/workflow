# workflow
This repo documents my coding environment setup, from text editor
configurations to testing and CI. Automated installation of entire environment
available via Ansible.

### Installation
All config settings here can be installed automatically with Ansible. The
Ansible playbooks are set up only for Linux Manjaro at the moment, but they may
for with Arch Linux as well. They could also be adapted to other Linux distros
fairly easily. Here are the installation steps.

***Note that these Ansible
playbooks will install packages and other settings on your machine
automatically and with minimal confirmation prompts. Proceed with caution and
please read through the playbooks yourself before using them.***

1. Navigate to this repo's Ansible directory (required): `cd ansible`
2. Run the installation script: `sudo install_environment.sh`

AUR packages are not installed automatically as this would be a security vulnerability.
