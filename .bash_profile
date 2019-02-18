case $- in *i*) . ~/.bashrc;; esac
bind -r '\C-s'
stty -ixon

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gdutra/google-cloud-sdk/path.bash.inc' ]; then source '/Users/gdutra/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gdutra/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/gdutra/google-cloud-sdk/completion.bash.inc'; fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

. $HOME/.asdf/asdf.sh
export PATH="/usr/local/opt/php@5.6/bin:$PATH"
export PATH="/usr/local/opt/php@5.6/sbin:$PATH"
