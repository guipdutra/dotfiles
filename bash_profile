source /home/guilherme/.rvm/scripts/rvm
case $- in *i*) . ~/.bashrc;; esac
bind -r '\C-s'
stty -ixon
xrdb -merge ~/.Xdefaults
