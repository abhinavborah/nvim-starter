#!/bin/bash

# Please refer to README.md for references

# move nvim config directories to backup
mv ~/.config/nvim{,.bak}

# delete the cache
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# cloning my repo to local
git clone https://github.com/imabhinavborah/nvim-starter ~/.config/nvim
