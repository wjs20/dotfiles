# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aliases
    dotenv
    git
    tmux
    docker
    z
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cat="batcat"
alias ls="exa"
alias ez="nvim ~/.zshrc"
alias gensecret="openssl rand -hex 40"

# open previous command in neovim
alias fc="fc -e vim"

#virtualenv
alias vba=". venv/bin/activate"

# python
alias pyserve="python -m http.server"
alias pipall="python -m pip install -rrequirements.txt"
alias pipdev="python -m pip install -rrequirements.dev"
alias piped="python -m pip install -e ."
alias pipfr="python -m pip freeze"
alias pipin="python -m pip install"
alias whichpy="pyenv which python"

alias ma="mamba activate"
# export PIP_REQUIRE_VIRTUALENV=true
export PIPENV_VENV_IN_PROJECT=1

# nvim
alias vim="nvim"
alias ev="nvim $HOME/.config/nvim/init.lua"
alias el="nvim $HOME/.config/nvim/lua"

# Django
alias pm="python manage.py"
alias pmmm="python manage.py makemigrations && python manage.py migrate"
alias pmt="python manage.py test"
alias cr="coverage report"
alias chtml="coverage html"
alias crmt="coverage run --source='.' manage.py test"
alias dcrpt="docker-compose run --rm django pytest"
alias dcrpm="docker-compose run --rm django python manage.py"

# pytest
alias pt="pytest"
alias ptv="pytest -v"
alias ptvv="pytest -vv"
alias ptvvv="pytest -vvv"
alias ptcov="pytest --cov-report term --cov=src tests"
alias ptcovh="pytest --cov-report html --cov=src tests"


# Docker
alias dr="docker container run --rm"
alias drit="docker container run -it --rm"


# https://github.com/stefanjudis/dotfiles/blob/primary/config/oh-my-zsh/aliases.zsh
alias ip="echo Your ip is; dig +short myip.opendns.com @resolver1.opendns.com;"
alias -s {js,json,env,md,html,css,toml,yaml,yml}=cat # just type file name and it will be printed to terminal
alias -s git="git clone" # instead of $git clone git@github.com:wjs20/dotfiles.git, just do $git@github.com:wjs20/dotfiles


# Postgres
alias pgpsql="sudo -u postgres psql"

export PATH="$PATH:$HOME/.local/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ws/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ws/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/ws/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/ws/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/ws/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/ws/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(starship init zsh)"

# turn off annoying green background to directories
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# FZF stuff
PROJECT_HOME="~/repo"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd -t d -d 1 . $PROJECT_HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d -d 1 . $PROJECT_HOME"

## Neovim stuff
export PATH="$PATH:$HOME/.local/nvim-linux64/bin:/usr/local/go/bin"

# Pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# modelling cli tool
export PATH="$PATH:$HOME/mambaforge/envs/antibody_modeller_env/bin"


# git@github.com:stephenturner/oneliners.git
# clear shortcut
alias c='clear'
alias cls='clear && ls'

# use cut on space or comma delimeted files
alias cuts="cut -d \" \""
alias cutc="cut -d \",\""

# pack and unpack tar.gz files
alias tarup="tar -zcf"
alias tardown="tar -zxf"

# generalized extract function
# as suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           gunzip $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# show your $PATH in prettier format
alias showpath='echo $PATH | tr ":" "\n" | nl'
