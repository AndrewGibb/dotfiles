echo "running bashrc"
source ${HOME}/.dotfiles/.bash_profile

eval "$(starship init bash)"

set -o vi
