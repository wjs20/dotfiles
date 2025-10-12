#!/usr/bin/env bash
#
set -Eeuo pipefail

LOCAL_BIN="$HOME/.local/bin"
if [[ ! -f $LOCAL_BIN ]]; then
    mkdir -p $LOCAL_BIN
fi

export PATH="$LOCAL_BIN:$PATH"

sudo apt update && sudo apt install -y --no-install-recommends \
    build-essential \
    curl \
    eza \
    graphviz \
    htop \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    locate \
    parallel \
    python3-dev \
    python3-pip \
    python3-venv \
    stow \
    tk-dev \
    tmux \
    tree \
    unzip \
    wget \
    xclip \
    xz-utils \
    zip \
    zlib1g-dev \
    zsh

curl https://mise.run | sh

mise use --global rust \
    bat \
    cookiecutter \
    curlie \
    delta \
    fzf \
    gh \
    go \
    httpie-go \
    jq \
    node \
    pandoc \
    pipx \
    python \
    qsv \
    rg \
    shellcheck \
    shfmt  \
    pipx:files-to-prompt \
    pipx:llm \
    pipx:pex \
    pipx:pyright \
    pipx:ruff \
    pipx:sqlite-utils

export PATH="$HOME/.cargo/bin:$PATH"

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$LOCAL_BIN"

# Setup mamba
# curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
# chmod 700 Miniforge3-$(uname)-$(uname -m).sh
# bash Miniforge3-$(uname)-$(uname -m).sh
#
# Use pixi from prefix.dev instead

rm -f .zshrc
pushd dotfiles
stow {config,ignore,tmux,vim,zsh,tools}
popd

curl -L git.io/antigen > antigen.zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
