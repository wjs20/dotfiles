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
    tmux \
    wget \
    stow \
    curl \
    zsh \
    xclip

curl -sS https://webi.sh/webi | sh
source ~/.config/envman/PATH.env

devtools=(
    bat
    delta
    dotenv
    fd
    fzf
    gh
    jq
    pandoc
    pathman
    prettier
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

# replacement from ps, not available from webi
cargo install procs

for lang in "${langs[@]}"
do
    curl -sS https://webi.sh/$lang | sh && source ~/.config/envman/PATH.env
done

# Rust
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$LOCAL_BIN"

#sql language server
go install github.com/sqls-server/sqls@latest

# Python
# install if installation cannot be found
# [[ -d "$HOME/.pyenv" ]] || curl https://pyenv.run | bash
# export PYENV_ROOT="$HOME/.pyenv"
# # add pyenv to path if not already on path
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
pyenv install 3.12.4
pyenv global 3.12.4
python -m pip install --user pipx
# if pipx isn't on path then add it
type -p pipx 1>/dev/null || python3 -m pipx ensurepath

pydevtools=(
    black
    csvkit
    httpie
    isort
    pdb-tools
    pex
    pipenv
    pytest
    tox
    virtualenv
    build
    datasette
    llm
    files-to-prompt
)

for pydevtool in "${pydevtools[@]}"
do
    pipx install $pydevtool
done

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm .zshrc
pushd dotfiles
stow {config,ignore,tmux,vim,zsh,tools}
popd
