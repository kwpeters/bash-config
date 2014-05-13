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
#
# Android ADT bundle tools (required by cordova CLI)
#
#-------------------------------------------------------------------------------

# Old version(s)
#export PATH=${PATH}:/development/adt-bundle-mac-x86_64-20130522/sdk/platform-tools:/development/adt-bundle-mac-x86_64-20130522/sdk/tools

# Latest version
export PATH=${PATH}:/development/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:/development/adt-bundle-mac-x86_64-20131030/sdk/tools

#export ANDROID_HOME=/development/adt-bundle-mac-x86_64-20130522/sdk
export ANDROID_HOME=/development/adt-bundle-mac-x86_64-20131030/sdk


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
export PATH=${PATH}:~/dev/juggernautJS


#-------------------------------------------------------------------------------
# Editor Environment Variables
#-------------------------------------------------------------------------------
export ALTERNATE_EDITOR="my_emacs"
export EDITOR="my_emacsclient -n"
export SUDO_EDITOR="my_emacsclient"


#-------------------------------------------------------------------------------
# Setup Git command line completion
#-------------------------------------------------------------------------------
source "$CLOUDHOME/appdata/bash-config/.git-completion.bash"


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
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Another way to do colors in the Terminal program.
# export CLICOLOR=1
# export LSCOLORS=ExFxCxDxBxegedabagacad


#-------------------------------------------------------------------------------
# Editor aliases
#-------------------------------------------------------------------------------
# alias e="$EDITOR"
alias e="my_emacs"
alias ec="my_emacsclient"


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
copyFromGitFunc() {
    kcopy.py --ignore "/\.git/" --ignore "/node_modules/" --ignore "\.DS_Store" $1 $2
}
alias copyFromGit=copyFromGitFunc


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
# monitormd
#
# A command that monitors markdown files and converts them to HTML.
#
################################################################################
monitormdFunc() {
    # monitor.py --include md$ --cmd "md2html.py --cssFile /Users/kwpeters/Dropbox/home/dev/bootstrap/css/bootstrap.css --cssFile ~/tmp/default.css"
    monitor.py --include md$ --cmd "md2html.js --cssFile /Users/kwpeters/Dropbox/home/dev/bootstrap/css/bootstrap.css --cssFile ~/tmp/default.css"
}

alias monitormd=monitormdFunc


