default:
    just --list

chezmoi:
    #! /usr/bin/env bash
    pushd "$HOME"
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply aaron-dodd
    pushd "$HOME/.local/share/chezmoi"
    git remote set-url origin git@github.com:aaron-dodd/dotfiles

gnome-extensions:
    pip install --upgrade gnome-extensions-cli
    gext disable background-logo@fedorahosted.org
    gext install AlphabeticalAppGrid@stuarthayhurst

vivaldi:
    #! /usr/bin/env bash
    pushd "$(mktemp -d)"
    wget https://vivaldi.com/download/vivaldi-stable.x86_64.rpm
    sudo dnf --nogpgcheck --assumeyes install vivaldi-stable.x86_64.rpm

