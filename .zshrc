# set up pyenv
eval "$(pyenv init -)"

#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
eval "$(pyenv virtualenv-init -)"

export EDITOR=vim
export CLICOLOR=1

# Geta  preview of upcoming behaviour where pyenv doesn't modify the prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

eval "$(starship init zsh)"

set editing-mode vi
"\C-r": reverse-search-history
# When searching history, press Ctrl-O instead of Enter 
# This will run the command from history, and insery the next command ready to run
"\C-o": operate-and-get-next

export HISTCONTROL=ignoredups
export HISTSIZE=2000
