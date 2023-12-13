#!/bin/bash

if [ ! -x "$0" ]; then
    echo "Please make the script executable by running:\nchmod +x $0"
    exit 1
fi

install() {
    # move nvim config directories to backup
    mv ~/.config/nvim{,.bak}

    # create backups as a failsafe
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak}

    # clone my repo to local
    git clone https://github.com/imabhinavborah/nvim-starter ~/.config/nvim
}

{
    install
} || {
    echo "Installation failed, please report the issue."
}

exit 0