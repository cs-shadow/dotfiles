# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases
alias untar='tar -xvf'
alias la='ls -a'
alias drucs='drush dcs'
alias ssh='ssh -X'

# SSH aliases
alias web='ssh chandan.singh@web.iiit.ac.in'
alias qubole='ssh -p 3022 qubole@192.168.1.139'
alias staging-qubole='ssh ec2-user@admin.staging.qubole.net'

#IIIT Proxy
#export http_proxy='http://proxy.iiit.ac.in:8080'
#export https_proxy='http://proxy.iiit.ac.in:8080'

#PHP Composer hacks
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
