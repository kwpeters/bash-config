#
# Bash configuration specific to Windows
#

echo 'Performing Windows initialization (bash_profile_windows.bash)...'


################################################################################
#
# Bash Customizations
#
################################################################################

# Use colors in the Terminal program.
#
# --color=auto    Use color
# -l              Long format
# -A              Show all files (expect . and ..)
# alias ls='ls --color=auto -lA'
alias ls='ls -lA'


################################################################################
#
# Bash Git Prompt
#
# Gotten from:
# https://github.com/magicmonty/bash-git-prompt
#
################################################################################
# Set config variables first
# GIT_PROMPT_ONLY_IN_REPO=1
# source "$CLOUDHOME/appdata/bash-git-prompt/gitprompt.sh"


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
    kcopy.py --ignore ".git" --ignore "node_modules" --ignore ".DS_Store" $1 $2
}
alias copyFromGit=copyFromGitFunc


################################################################################
#
# WebStorm
#
################################################################################
# wstormFunc() {
#     /c/Program\ Files\ \(x86\)/JetBrains/WebStorm\ 8.0/bin/WebStorm.exe $1
# }
wstormFunc() {
    /c/Program\ Files\ \(x86\)/JetBrains/WebStorm\ 8.0/bin/WebStorm.exe `abspath.py $1`
}
alias wstorm=wstormFunc


################################################################################
#
# monitormd
#
# A command that monitors markdown files and converts them to HTML.
#
################################################################################
monitormdFunc() {
    monitor.py --include md$ --cmd "md2html.js --cssFile C:\Users\kwpeters\Dropbox\home\dev\bootstrap\css\bootstrap.css --cssFile C:\tmp\default.css"
}

alias monitormd=monitormdFunc
