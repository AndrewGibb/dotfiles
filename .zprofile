pathadd() {
  while [[ $PATH =~ :$1: ]]
  do
    PATH=${PATH//:$1:/:}
  done
  PATH=${PATH#$1:}
  PATH=${PATH%:$1}
  PATH=${PATH}:${1}
}

# From https://stackoverflow.com/questions/57983007/prepending-to-the-path
pathprepend() {
  while [[ $PATH =~ :$1: ]]
  do
    PATH=${PATH//:$1:/:}
  done
  PATH=${PATH#$1:}
  PATH=${PATH%:$1}
  PATH=${1}:${PATH}
}

eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up pyenv:
eval "$(pyenv init --path)"

# Nice OSX tools
pathadd '/Users/andrewg/code/external/tools-osx/bin'
# Racket
pathadd '/Applications/Racket/bin'
# p4merge
pathadd '/Applications/p4merge.app/Contents/MacOS'
# openssl-curl
pathprepend '/usr/local/opt/curl-openssl/bin'
# for GNU readlink, to make cloudfit env work
pathprepend '/usr/local/opt/coreutils/libexec/gnubin'
pathprepend '/usr/local/opt/make/libexec/gnubin'
