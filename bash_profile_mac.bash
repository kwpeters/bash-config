#!bash

################################################################################
#
# Bash configuration specific to Mac OS X
#
################################################################################

echo 'Performing Mac initialization (bash_profile_mac.bash)...'



################################################################################
#
# Android Development Setup
#
################################################################################

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home
export PATH=${PATH}:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools:$JAVA_HOME/bin
export ANDROID_SDK_HOME=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk


################################################################################
#
# NVM - Node.js Version Manager
#
################################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


################################################################################
#
# AVN - Automatic Version Switching for Node.js
#
################################################################################

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


################################################################################
# Setup PATH.
################################################################################

# bin folder for the current user.
export PATH=~/bin:${PATH}


#-------------------------------------------------------------------------------
# Setup CDPATH.
# This environment variables lists directories that will be searched if you
# `cd` to a directory that does not exist in the current working directory.
# There is not utility that needs to be installed.  This is a standard UNIX
# feature.
#-------------------------------------------------------------------------------

# export CDPATH="~/dev:~/dev/enipjs:~/dev/teamone:${CDPATH}"


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
# Editor Environment Variables
#-------------------------------------------------------------------------------
# An example of specifying Emacs when installed by Homebrew.
## export EDITOR=/usr/local/Cellar/emacs/25.1/bin/emacs

# Emacs installed using downloaded installer.
export EDITOR=/Applications/Emacs.app/Contents/MacOS/Emacs


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
alias h="history"


#-------------------------------------------------------------------------------
# Editor aliases
#-------------------------------------------------------------------------------
alias e="$EDITOR"


ecFunc() {
    # Need to use a fucntion so I can put the "&" on the end.
    /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n "$@" &
}
alias ec=ecFunc


ewinFunc() {
    # Need to use a fucntion so I can put the "&" on the end.
    /Applications/Emacs.app/Contents/MacOS/Emacs "$@" &
}
alias ewin=ewinFunc

#
# estdin
# Will open text piped into it in a new Emacs window.
#
estdin() {
    open -fn -a /Applications/Emacs.app/Contents/MacOS/Emacs
}

#
# Opens a man page in Preview.
#
function man-preview() {
    man -t "$@" | open -f -a Preview
}

alias wstorm=webstorm

################################################################################
#
# A command to clear out Finder's "open with" menu
#
################################################################################
# alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'


################################################################################
#
# adblog
#
# For Android debugging
#
################################################################################

# alias adblog="adb logcat jxcore-log:v cordova*:v *:s"
# alias adblog-client="adb logcat jxcore-log:v cordova*:v chromium*:v *:s"


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
# alias backup="~/dev/rsync/rsync.sh"


################################################################################
#
# Development aliases
#
################################################################################
alias deleteallnodemodules="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
