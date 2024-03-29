#!/usr/bin/env bash

# Copied from https://github.com/dikiaap/dotfiles

# On colours: https://stackoverflow.com/questions/15682537/ansi-color-specific-rgb-sequence-bash#26665998
blue='\e[34m'
#blue='\e[38;2;205;0;0m'
red='\e[38;2;0;205;0m'
#white='\e[0;37m'
white='\e[38;2;131;148;150m'
dotfiles_repo_dir=$(pwd)
backup_dir="$HOME/.dotfiles.orig"
#dotfiles_home_dir=(.zsh .aliases .bash_profile .bashrc .dircolors .editorconfig .exports
#                   .functions .gemrc .ripgreprc .wgetrc .Xresources .zshrc)
#dotfiles_xdg_config_dir=(.alacritty .dunst .htop .i3 .i3blocks .picom .rofi .tmux)
dotfiles_home_dir=(.gitconfig .tmux.conf .vimrc .zprofile .zshrc)
dotfiles_xdg_config_dir=(nvim)

# Print usage message.
usage() {
    local program_name
    program_name=${0##*/}
    cat <<EOF
Usage: $program_name [-option]
Options:
    --help    Print this message
    -i        Install all config
    -r        Restore old config
EOF
}

install_dotfiles() {
    # Backup config.
    if ! [ -f "$backup_dir/check-backup.txt" ]; then
        mkdir -p "$backup_dir/.config"
        cd "$backup_dir" || exit
        touch check-backup.txt

        # Backup to ~/.dotfiles.orig
        for dots_home in "${dotfiles_home_dir[@]}"
        do
            env cp -rf "$HOME/${dots_home}" "$backup_dir" &> /dev/null
        done

        # Backup some folder in ~/.config to ~/.dotfiles.orig/.config
        for dots_xdg_conf in "${dotfiles_xdg_config_dir[@]//./}"
        do
            env cp -rf "$HOME/.config/${dots_xdg_conf}" "$backup_dir/.config" &> /dev/null
        done

        # Backup again with Git.
        if [ -x "$(command -v git)" ]; then
            git init &> /dev/null
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Backup original config on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi

        # Output.
        printf "${blue}Your config is backed up in ${backup_dir}\n" >&2
        printf "${red}Please do not delete check-backup.txt in .dotfiles.orig folder.${white}" >&2
        printf "It's used to backup and restore your old config.\n" >&2
    fi

    # Install config.
    for dots_home in "${dotfiles_home_dir[@]}"
    do
        env rm -rf "$HOME/${dots_home}"
        env ln -fs "$dotfiles_repo_dir/${dots_home}" "$HOME/"
    done

    # Install config to ~/.config.
    mkdir -p "$HOME/.config"
    for dots_xdg_conf in "${dotfiles_xdg_config_dir[@]}"
    do
        env rm -rf "$HOME/.config/${dots_xdg_conf[*]//./}"
        env ln -fs "$dotfiles_repo_dir/${dots_xdg_conf}" "$HOME/.config/${dots_xdg_conf[*]//./}"
    done

    printf "${blue}New dotfiles is installed!\n${white}" >&2
    printf "There may be some errors when Terminal is restarted." >&2
    printf "Please read carefully the error messages and make sure all packages are installed. See more info in README.md." >&2
    printf "Note that the author of this dotfiles uses dev branch in some packages." >&2
    printf "If you want to restore your old config, you can use ${red}./install.sh -r${white} command." >&2
}

uninstall_dotfiles() {
    if [ -f "$backup_dir/check-backup.txt" ]; then
        for dots_home in "${dotfiles_home_dir[@]}"
        do
            env rm -rf "$HOME/${dots_home}"
            env cp -rf "$backup_dir/${dots_home}" "$HOME/" &> /dev/null
            env rm -rf "$backup_dir/${dots_home}"
        done

        for dots_xdg_conf in "${dotfiles_xdg_config_dir[@]//./}"
        do
            env rm -rf "$HOME/.config/${dots_xdg_conf}"
            env cp -rf "$backup_dir/.config/${dots_xdg_conf}" "$HOME/.config" &> /dev/null
            env rm -rf "$backup_dir/.config/${dots_xdg_conf}"
        done

        # Save old config in backup directory with Git.
        if [ -x "$(command -v git)" ]; then
            cd "$backup_dir" || exit
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Restore original config on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi
    fi

    if ! [ -f "$backup_dir/check-backup.txt" ]; then
        printf "${red}You have not installed this dotfiles yet.${white}" >&2
        exit 1
    else
        printf "${blue}Your old config has been restored!\n${white}" >&2
        printf "Thanks for using my dotfiles." >&2
        printf "Enjoy your next journey!" >&2
    fi

    env rm -rf "$backup_dir/check-backup.txt"
}

main() {
    case "$1" in
        ''|-h|--help)
            usage
            exit 0
            ;;
        -i)
            install_dotfiles
            ;;
        -r)
            uninstall_dotfiles
            ;;
        *)
            printf "Command not found" >&2
            exit 1
    esac
}

main "$@"
