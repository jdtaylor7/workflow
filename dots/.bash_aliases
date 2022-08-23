#
# ~/.bash_aliases
#

TOOLS_REPO="~/code/workflow/tools"

# Change directory shortcuts
alias code="cd ~/code/"
alias doc='cd ~/Documents/'
alias desk="cd ~/Desktop/"

# SSH
alias pi="ssh -p 2222 jt@192.168.1.80"

# Beep
alias beep="tput bel"

# bashrc
alias brc="vim ~/.bashrc"
alias ba="vim ~/.bash_aliases"
alias sb="source ~/.bashrc"

# Commit in branch
alias cib="$TOOLS_REPO/cib.sh"

# venv
alias ve="python3 -m venv"

# Git
alias gs="git status"
alias gd="git diff"
alias gp="git pull"
alias gr="git rebase -i"
alias gc="git commit"
alias gl="git log"
alias gpu="git push"
alias gpuf="git push --force"
alias gco="git checkout"
alias gb="git branch"
alias ga="git add ."

# Watson
alias wa="watson start"
alias wo="watson stop"
alias wr="watson report"
alias wl="watson log"
alias ws="watson status"
alias wd="watson add"
alias wp="watson projects"
alias wt="watson tags"
alias wag="watson aggregate"

