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
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    parallel \
    python3-pip \
    python3-venv \
    python3-dev \
    pipx \
    tmux \
    wget \
    locate \
    stow \
    curl \
    zsh \
    tree \
    eza \
    zip \
    unzip \
    htop \
    graphviz \
    xclip

pipx ensurepath

curl https://mise.run | sh

tools=(
    rust
    python
    go
    node
    bat
    curlie
    delta
    fzf
    gh
    jq
    pandoc
    rg
    shellcheck
    shfmt
    qsv
    cookiecutter
    httpie-go
)

for tool in "${tools[@]}"
do
    mise install $tool
done

export PATH="$HOME/.cargo/bin:$PATH"

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$LOCAL_BIN"

pytools=(
    llm
    files-to-prompt
    pex
    pipenv
    ruff
    pyright
    sqlite-utils
    'python-dotenv[cli]'
)

for pytool in "${pytools[@]}"
do
    pipx install $pytool
done

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
