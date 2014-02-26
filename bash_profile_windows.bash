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
alias ls='ls --color=auto -lA'


################################################################################
#
# WebStorm
#
################################################################################
wstormFunc() {
    /c/Program\ Files\ \(x86\)/JetBrains/WebStorm\ 7.0.3/bin/WebStorm.exe $1
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
