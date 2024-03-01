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
    gext install appindicatorsupport@rgcjonas.gmail.com
    gext install kimpanel@kde.org

jetbrains-toolbox:
    #!/usr/bin/env bash
    pushd "$(mktemp -d)"
    echo "Get latest JetBrains Toolbox version"
    # Get the json with latest releases
    curl -sSfL -o releases.json "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"
    # Extract information
    BUILD_VERSION=$(jq -r '.TBA[0].build' ./releases.json)
    DOWNLOAD_LINK=$(jq -r '.TBA[0].downloads.linux.link' ./releases.json)
    CHECKSUM_LINK=$(jq -r '.TBA[0].downloads.linux.checksumLink' ./releases.json)
    echo "Installing JetBrains Toolbox ${BUILD_VERSION}"
    curl -sSfL -O "${DOWNLOAD_LINK}"
    curl -sSfL "${CHECKSUM_LINK}" | sha256sum -c
    tar zxf jetbrains-toolbox-"${BUILD_VERSION}".tar.gz
    echo "Launching JetBrains Toolbox"
    ./jetbrains-toolbox-"${BUILD_VERSION}"/jetbrains-toolbox

