#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim

PATH="$PATH:/home/jordan/.gem/ruby/2.7.0/bin"

# Ignore duplicate commands and commands starting with whitespace.
HISTCONTROL=ignoreboth

# Append to the history file instead of overwriting it.
shopt -s histappend

# Set size of history.
HISTSIZE=1000

# Set size of history that can be saved on logout.
HISTFILESIZE=2000

get_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

# PS1
GOLD='$(tput setaf 214)'
TEAL='$(tput setaf 45)'
GRAY='$(tput setaf 245)'
WHITE='$(tput setaf 15)'
PS1="\[${GOLD}\]\u@\h\[${WHITE}\]:\[${TEAL}\]\W\[${WHITE}\]\[${GRAY}\]\$(get_git_branch)\[${WHITE}\]$ "

# Enable color for ls and grep.
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Color GCC warnings and errors.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Similar to python decorator, wrap command in other functionality. 
# Example usage: alias bazel="stats_decorator bazel"
stats_decorator() {
    time "$@"; beep
}

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Start XFCE panel while I try to fix it...
xfce4-panel

