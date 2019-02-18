[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace

shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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
export PATH="$PATH:/home/guilherme/Elixir/elixir/bin"

stty -ixon

google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    open "http://www.google.com/search?q=$search"
}

export QWANDRY_EDITOR="vim"
export EDITOR="vim"
export TERM=xterm-256color

export MYSQL_USER=root
export MYSQL_PASSWORD=
export SIMULADOS_URL="http://lvh.me:5000/statics/simulado"
export MAIN_DOMAIN=".lvh.me"
export SIMULADOS_DOMAIN="lvh.me:4000"
export SONIC_URL="http://sonic.stg.saraivaeducacao.com.br/statics/sonic"


function kexec() {
  case $1 in
    "help") printf "USAGE:\n\n    kexec namespace command\n"
      ;;
    *) namespace=$1
      shift
      pod=$(kubectl get pods --field-selector=status.phase=Running --output=jsonpath={.items\[0\].metadata.name} -n $namespace)
      kubectl exec -ti $pod -n $namespace $*
      ;;
  esac
}

export SEGMENT_KEY="RnhQqmWmTV5kf1oFAAIu3EFYeE1kALmp"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"


export PATH=$PATH:$DYLD_LIBRARY_PATH



export PATH="/usr/local/mysql-5.6.41-macos10.13-x86_64/bin:$PATH"
MYSQL=/usr/local/mysql-5.6.41-macos10.13-x86_64/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql-5.6.41-macos10.13-x86_64/lib:$DYLD_LIBRARY_PATH

. $HOME/.asdf/asdf.sh
export PATH="/usr/local/sbin/:$PATH"


export POSTGRES_HOST=localhost
export POSTGRES_USER=gdutra
export POSTGRES_PASSWORD=
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
