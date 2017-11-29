#!bash

################################################################################
#
# Bash configuration specific to Mac OS X
#
################################################################################

echo 'Performing Mac initialization (bash_profile_mac.bash)...'

#-------------------------------------------------------------------------------
# Setup PATH.
#-------------------------------------------------------------------------------

# bin folder for this machine
export PATH=~/bin:${PATH}

#-------------------------------------------------------------------------------
# Setup CDPATH.
# This environment variables lists directories that will be searched if you
# `cd` to a directory that does not exist in the current working directory.
#-------------------------------------------------------------------------------
# export CDPATH="~/dev:~/dev/mft:${CDPATH}"

#-------------------------------------------------------------------------------
#
# Android ADT bundle tools (required by cordova CLI)
#
#-------------------------------------------------------------------------------

export PATH=${PATH}:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools
export ANDROID_HOME=~/Library/Android/sdk


#-------------------------------------------------------------------------------
#
# Java
#
#-------------------------------------------------------------------------------
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home


#-------------------------------------------------------------------------------
#
# Juggernaut
#
#-------------------------------------------------------------------------------
export PATH=${PATH}:~/dev/juggernaut


#-------------------------------------------------------------------------------
#
# JuggernautJS
#
#-------------------------------------------------------------------------------
export PATH=${PATH}:~/dev/juggernautJS/src

#-------------------------------------------------------------------------------
#
# JuggernautBash
#
#-------------------------------------------------------------------------------
export PATH=${PATH}:~/dev/juggernautBash

#-------------------------------------------------------------------------------
#
# rokMac
#
#-------------------------------------------------------------------------------
export PATH=${PATH}:~/dev/rokMac


#-------------------------------------------------------------------------------
#
# Azure CLI 2.0
#
#-------------------------------------------------------------------------------
export PATH=$PATH:/Users/kwpeters/bin
source '/Users/kwpeters/lib/azure-cli/az.completion'


#-------------------------------------------------------------------------------
# Editor Environment Variables
#-------------------------------------------------------------------------------
#export ALTERNATE_EDITOR="my_emacs"
#export EDITOR="my_emacsclient -n"
#export SUDO_EDITOR="my_emacsclient"

#export EDITOR=/usr/local/Cellar/emacs/24.4/Emacs.app/Contents/MacOS/Emacs
#export EDITOR=/usr/local/Cellar/emacs/24.5/bin/emacs
export EDITOR=/usr/local/Cellar/emacs/25.1/bin/emacs

#-------------------------------------------------------------------------------
# Setup Git command line completion
#-------------------------------------------------------------------------------
source "$HOME/.git-completion.bash"


#-------------------------------------------------------------------------------
# Setup the prompt
#-------------------------------------------------------------------------------

# Default Mac OS X prompt is '\h:\W \u\$'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\n\! \[\033[00;34m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\n$ "

#-------------------------------------------------------------------------------
# Use colors in the Terminal program.
#-------------------------------------------------------------------------------

# -l for long, -G for colors, -F to decorate file names, -A to show dot files
alias ls='ls -lGFA'
alias lsd='ls -lGFA | grep -i "^d.*/"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Another way to do colors in the Terminal program.
# export CLICOLOR=1
# export LSCOLORS=ExFxCxDxBxegedabagacad

#-------------------------------------------------------------------------------
# Misc Aliases
#-------------------------------------------------------------------------------
alias vpn="f5vpn-login kwpeters@connect.rockwell.com; say VPN closed"
alias vpnint="f5vpn-login kwpeters@connectmay-int.ra.rockwell.com; say VPN closed"
alias h="history"

#-------------------------------------------------------------------------------
# Aliases for common directories
#-------------------------------------------------------------------------------
alias dev="cd ~/dev"


#-------------------------------------------------------------------------------
# Editor aliases
#-------------------------------------------------------------------------------
alias e="$EDITOR"


ecFunc() {
    # Need to use a fucntion so I can put the "&" on the end.
    # /usr/local/Cellar/emacs/24.5/bin/emacsclient -n "$@" &
    /usr/local/Cellar/emacs/25.1/bin/emacsclient -n "$@" &
}
#alias ec="/usr/local/Cellar/emacs/24.4/bin/emacsclient"
alias ec=ecFunc

ewinFunc() {
    # Need to use a fucntion so I can put the "&" on the end.
    # /usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs "$@" &
    /usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs "$@" &

}
alias ewin=ewinFunc

#
# estdin
# Will open text piped into it in a new Emacs window.
#
estdin() {
    # open -fn -a /usr/local/Cellar/emacs/24.5/Emacs.app/Contents/MacOS/Emacs
    open -fn -a /usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs
}


wstormFunc() {
    #/Applications/WebStorm.app/Contents/MacOS/webide "$@" &
    open -a /Applications/WebStorm.app "$@" &
}
alias wstorm=wstormFunc

#
# Opens a man page in Preview.
#
function man-preview() {
  man -t "$@" | open -f -a Preview
}

#
# copyFromGit
#
# A command that copies the source code out of a Git repository while
# ignoring non-source code files.
#
# Parameters:
#     src
#     dest
#
# copyFromGitFunc() {
#     kcopy.py --ignore ""/\.git/" --ignore "/node_modules/" --ignore "\.DS_Store" $1 $2
# }
# alias copyFromGit=copyFromGitFunc


################################################################################
#
# A command to clear out Finder's "open with" menu
#
################################################################################
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'


################################################################################
#
# dotit
#
# A command that runs dot to produce a png and then opens the resulting image
#
################################################################################
dotitFunc() {
    dot -Tpng $1.dot -o $1.png
    open $1.png
}
alias dotit=dotitFunc

neatoitFunc() {
    neato -Tpng $1.dot -o $1.png
    open $1.png
}

alias neatoit=neatoitFunc

################################################################################
#
# adblog
#
# For Android debugging
#
################################################################################
alias adblog="adb logcat jxcore-log:v cordova*:v *:s"
alias adblog-client="adb logcat jxcore-log:v cordova*:v chromium*:v *:s"


################################################################################
#
# Increase the number of open files (for jxcore).
#
################################################################################
ulimit -S -n 2048


################################################################################
#
# rsync backup
#
################################################################################
alias backup="~/dev/rsync/rsync.sh"


################################################################################
#
# AVN Configuration
#
################################################################################
export NVM_DIR="/Users/kwpeters/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


################################################################################
#
# Development aliases
#
################################################################################
alias deleteallnodemodules="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
