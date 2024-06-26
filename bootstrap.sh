#!/usr/bin/env bash
#
set -Eeuo pipefail

LOCAL_BIN="$HOME/.local/bin"
if [[ ! -f $LOCAL_BIN ]]; then
    mkdir -p $LOCAL_BIN
fi

export PATH="$LOCAL_BIN:$PATH"

sudo add-apt-repository ppa:git-core/ppa
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
    git \
    tmux \
    wget \
    curl \
    fzf \
    zsh \
    bat \
    stow \
    shellcheck \
    xclip

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install \
    sd \
    exa \
    fd-find \
    ripgrep\
    du-dust \
    grex \
    git-delta
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$LOCAL_BIN"

# Go
wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

#sql language server
go install github.com/sqls-server/sqls@latest

# Python
# install if installation cannot be found
[[ -d "$HOME/.pyenv" ]] || curl https://pyenv.run | bash
export PYENV_ROOT="$HOME/.pyenv"
# add pyenv to path if not already on path
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
python3 -m pip install --user --no-warn-script-location pipx
# if pipx isn't on path then add it
type -p pipx 1>/dev/null || python3 -m pipx ensurepath

pipx install virtualenv
pipx install pipenv
pipx install tox
pipx install pytest
pipx install black
pipx install isort
pipx install httpie
pipx install csvkit
pipx install pdb-tools

# Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar -xvf nvim-linux64.tar.gz && rm nvim-linux64.tar.gz
mv nvim-linux64 $HOME/.local/

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm .zshrc
pushd dotfiles
stow {config,ignore,tmux,vim,zsh,tools}
popd
