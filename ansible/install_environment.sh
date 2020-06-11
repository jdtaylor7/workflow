#!/bin/sh

# Update pacman.
pacman -Syu

# Install Ansible.
pacman -S ansible --noconfirm

# Add localhost to Ansible hosts list.
echo "localhost" | tee -a /etc/ansible/hosts

# Run the top-level Ansible playbook.
ansible-playbook main_playbook.yml
