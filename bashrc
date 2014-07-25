# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


C="\033" # This is the escape sequence

NO_COLOR="$ESC[0m"

IYLW="$ESC[0;33m" # ANSI color code for intense/bold yellow

IRED="$ESC[0;31m" # ANSI color code for intense/bold red

IGRN="$ESC[0;32m" # ANSI color code for intense/bold green

IBLU="$ESC[0;34m" # ANSI color code for intense/bold blue

# From http://railstips.org/blog/archives/2009/02/02/bedazzle-your-bash-prompt-with-git-info/

# I had to change 'git-symbolic-ref' to 'git symbolic-ref'

function parse_git_branch {

  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

    echo " ("${ref#refs/heads/}")" # I wanted my branch wrapped in [], use () or <> or whatever

}

ESC="\033" # This is the escape sequence
NO_COLOR="$ESC[0m"
IRED="$ESC[1;31m" # ANSI color code for intense/bold red
IGRN="$ESC[1;32m" # ANSI color code for intense/bold green

export PS1="\[$IRED\]\[$NO_COLOR\]\W\[$IGRN\]\$(parse_git_branch)\[$NO_COLOR\]\n \$ "

export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:/home/guilherme/Elixir/elixir/bin"

function git-pull-request() {
  hub pull-request -i $1 -h "nohupbrasil:`git symbolic-ref --short -q HEAD`"
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/Projects/Opensource/pomo:$PATH"
export PATH="$HOME/Projects/Opensource/tldr:$PATH"

stty -ixon
eval "$(xrdb -merge ~/.Xdefaults)"


google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    xdg-open "http://www.google.com/search?q=$search"
}

export QWANDRY_EDITOR="vim"
source ~/.fzf.bash
