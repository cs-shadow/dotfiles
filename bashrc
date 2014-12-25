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
alias test_ee='pushd ~/drupal8; sudo -u apache php core/scripts/run-tests.sh --verbose --url http://localhost/drupal8/ --module entity_embed; popd'

# IIIT Proxy
# export http_proxy='http://proxy.iiit.ac.in:8080'
# export https_proxy='http://proxy.iiit.ac.in:8080'
# Use IP instead to prevent conflicts with Google's NS.
# export http_proxy='http://10.4.8.204:8080'
# export https_proxy='http://10.4.8.204:8080'

# PHP Composer config
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Export Java path. Use sun jdk instead of openjdk.
# export JAVA_HOME=/usr/java/latest
# export PATH=$JAVA_HOME/bin:$PATH

alias drush='~/drush/drush'
