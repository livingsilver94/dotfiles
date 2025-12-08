# Dotfiles

These dotfiles are managed using Ansible. Not only does it restore configuration files, but it also reinstalls
applications and applies unusual configurations when custom commands are required (e.g. firewalls).

My dotfiles are split in two destinations:
- `server`: for a Debian machine acting as a server.
- `desktop`: for my workstation running Fedora.

## Installation

If you installed Ansible without any extra collections (e.g. `ansible-core`), you'll need to install some first:

```shell
ansible-galaxy install -r requirements.yaml
```

To install a destination, `cd` into that directory and run:

```shell
ansible-playbook deploy.yaml -kK
```
