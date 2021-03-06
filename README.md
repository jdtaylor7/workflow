# workflow
This repo documents my coding environment setup, from text editor
configurations to testing and CI. Automated installation of entire environment
available via Ansible.

### Automatic Installation
All config settings here can be installed automatically with Ansible. The
Ansible playbooks are set up only for Linux Manjaro at the moment, but they may
for with Arch Linux as well. They could also be adapted to other Linux distros
fairly easily. Here are the installation steps.

***Note that these Ansible
playbooks will install packages and other settings on your machine
automatically and with minimal confirmation prompts. Proceed with caution and
please read through the playbooks yourself before using them.***

1. [Install Manjaro Linux](https://manjaro.org/download/).
2. Clone this repo via https: `git clone https://github.com/jdtaylor7/workflow`
3. Navigate to this repo's Ansible directory: `cd ansible`
4. Run the installation script (with `sudo` since packages are being
installed): `sudo ./install_environment.sh`

AUR packages are not installed automatically as they should be checked manually
before installation.

### Manual Installation

The following settings must be executed manually. These steps assume Manjaro
Linux as well, but work similarly for Arch Linux.
* AUR package installation. See the [package list](ansible/lists/aur_package_list.yml).
* Boot loader setup. See
[the relevant section](environment/linux/README.md#boot-loader) for
details.
* Rust installation.
    * Navigate to your home directory: `cd ~`
    * Check the Rust installation script: `less rust.sh`
    * Add execution privileges to the script: `chmod +x rust.sh`
    * Execute the script: `./rust.sh`
