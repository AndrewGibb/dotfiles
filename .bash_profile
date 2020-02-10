# If not running interactively, don't do anything

#[ -z "$PS1" ] && exit

# OS

if [ "$(uname -s)" = "Darwin" ]; then
    OS="OSX"
else
    OS=$(uname -s)
fi
export BPRUN=1
# source the files (order matters)
if [ "$OS" = "OSX" ]; then
  for DOTFILE in ${HOME}/.dotfiles/.{bashrc,env}; do
    echo $DOTFILE
   [ -f $DOTFILE ] && source $DOTFILE
  done
else
  [ -f "/home/andrewg/.dotfiles/.env" ] && source "/home/andrewg/.dotfiles/.env"
#  for DOTFILE in `find /home/andrewg/.dotfiles/{.env}`
#  do
#    [ -f “$DOTFILE” ] && source “$DOTFILE”
#  done
fi

# Auto-set network proxies:
export NETWORK_LOCATION="$(/usr/sbin/scselect 2>&1 | egrep '^ \*' | sed 's:.*(\(.*\):\1:')"
if [[ "$NETWORK_LOCATION" =~ BBCRD ]]; then
    export http_proxy="http://www-cache.rd.bbc.co.uk:8080"
    export https_proxy="http://www-cache.rd.bbc.co.uk:8080"
fi


# make tmux vim solarized colours behave
#alias tmux="TERM=screen-256color tmux"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andrewg/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andrewg/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andrewg/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andrewg/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ -z $TMUX ]] || conda deactivate; conda activate base
