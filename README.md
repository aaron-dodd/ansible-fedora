# Installation Instructions

- [ ] Install fedora workstation.
- [ ] Go through the first time setup.
- [ ] Install ansible with the following command:

```bash
sudo dnf install ansible
```

- [ ] Clone the repository with the following command:

```bash
git clone https://github.com/aaron-dodd/ansible-fedora
cd ansible-fedora
```

- [ ] Run the playbook with the following command:

```bash
ansible-playbook -K main.yml
```

## Manual Steps

- Copy password store to home directory.
- Set a hostname with the following command:

```bash
sudo hostnamectl set-hostname <hostname>
```

- Enable syncthing with the following command:

```bash
systemctl --user enable syncthing.service
systemctl --user start syncthing.service
```

- Setup dotfiles with the following command:

```bash
just dotfiles
```

- Get recommended gnome extensions with the following command:

```bash
just gnome-extensions
```

- Get jetbrains toolbox for IDEs with the following command:

```bash
just jetbrains-toolbox
```

- Login to jetbrains toolbox.

