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
    tmux \
    wget \
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

curl -sS https://webi.sh/webi | sh
source ~/.config/envman/PATH.env

devtools=(
    bat
    curlie
    delta
    dotenv
    fd
    fzf
    gh
    jq
    pandoc
    pathman
    rg
    sd
    serviceman
    shellcheck
    shfmt
    watchexec
    xsv
    yq
)

for tool in "${devtools[@]}"
do
    curl -sS https://webi.sh/$tool | sh && source ~/.config/envman/PATH.env
done

langs=(
    go-essentials
    golang
    node
    pyenv
    rustlang
    zig
)

for lang in "${langs[@]}"
do
    curl -sS https://webi.sh/$lang | sh && source ~/.config/envman/PATH.env
done

curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$LOCAL_BIN"

python3 -m pip install --user --break-system-packages pipx
python3 -m pipx ensurepath

pydevtools=(
    black
    build
    csvkit
    files-to-prompt
    httpie
    isort
    llm
    mypy
    pex
    pipenv
    pytest
    python-dotenv
    pyright
    ruff
    sqlite-utils
    tox
    virtualenv
)

for pydevtool in "${pydevtools[@]}"
do
    pipx install $pydevtool
done

# Setup mamba
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
chmod 700 Miniforge3-$(uname)-$(uname -m).sh
bash Miniforge3-$(uname)-$(uname -m).sh

rm .zshrc
pushd dotfiles
stow {config,ignore,tmux,vim,zsh,tools}
popd

curl -L git.io/antigen > antigen.zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

