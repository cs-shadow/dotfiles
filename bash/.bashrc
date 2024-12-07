# PATH
PATH="$HOME/Library/Python/3.10/bin:$PATH"
PATH="$HOME/git/buildstream/buildstream/contrib:$PATH"
export PATH

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh

# Git
. ~/.git-completions.bash

# Aliases
alias git='hub'
alias grep='grep --color=auto'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias cat=bat

# Venv management
function activate() {
    venv_dir="$HOME"/.venvs/"$1"
    if [[ ! -d "$venv_dir" ]]; then
        mkdir -p "$venv_dir"
        python3 -m venv "$venv_dir"
    fi
    . "$venv_dir"/bin/activate
}

# mcd
function mcd() {
    mkdir -p "$1" && cd "$_"
}

# `too many open files`
ulimit -n 10240
