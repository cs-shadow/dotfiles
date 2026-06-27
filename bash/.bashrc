# PATH
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/opt/ruby/bin:$PATH"
PATH="~/.local/bin:$PATH"
export PATH

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /opt/homebrew/lib/python3.13/site-packages/powerline/bindings/bash/powerline.sh

# Git
. /opt/homebrew/etc/profile.d/bash_completion.sh
alias git='hub'
alias squash='EDITOR=true git rebase --autosquash'
alias pull='EDITOR=true git pull-request -p'

# Aliases
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

# Silence hints
export HOMEBREW_NO_ENV_HINTS=1
