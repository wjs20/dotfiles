#!/usr/bin/env bash
#
set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

LOCAL_BIN="$HOME/.local/bin"
if [[ ! -f $LOCAL_BIN ]]; then
    mkdir -p $LOCAL_BIN
fi

sudo apt update

# general utilities
sudo apt-get install -y --no-install-recommends \
    tmux \
    wget \
    fzf \
    ripgrep \
    zsh \
    bat \
    exa \
    stow

# python
sudo apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    curl \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    python3-pip \
    python3-venv

curl https://pyenv.run | bash

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# pipx
# virtualenv
# tox
# cookiecutter
# pipenv

# starship
curl -sS https://starship.rs/install.sh | sh

# neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
mkdir .local/bin && mv nvim-linux64 .local/bin/nvim
tar -xvf nvim-linux64.tar.gz && rm nvim-linux64.tar.gz

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
