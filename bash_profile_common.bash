################################################################################
#
# Bash configuration common to all platforms
#
################################################################################

echo 'Performing common initialization (bash_profile_common.bash)...'

################################################################################
#
# ff (Find File)
#
# A command that searches for a file matching a regular expression.
#
################################################################################
ff() {
    find . -type f -iregex ".*$1.*" -print | grep -i $1 2>/dev/null
}


################################################################################
#
# fif (Find In File)
#
# A command that searches for a regular expression within all files.
#
################################################################################
fif() {
    find . -name "*" -type f -exec grep -Hn --binary-files=without-match "$1" {} \; | grep -i $1 2>/dev/null
}


################################################################################
#
# fifl (Find In File - show only file names)
#
# A command that searches for a regular expression within all files and prints
# only the file names that contain matches.
#
################################################################################
fifl() {
    # Note: The output of this command is not sent through a subsequent "grep"
    # command, because the file name may not contain the expression that was
    # found within it, and we do not want the file name removed from the output.
    find . -name "*" -type f -exec grep -HInl "$1" {} \;
}


#
# Git aliases
#
alias gs="git status"
alias gitclean="git clean -d -f -x --exclude=.idea --exclude=*.env"
alias gitbig="git config http.postBuffer 524288000"
alias gitsmall="git config --unset http.postBuffer"
alias gitbr="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/"
alias gitmy="git log --author=kwpeters --oneline -n 20"
alias gitdiff="clear && git diff"

gitDeliverFunc() {
    git merge --no-ff $1
}
alias gitDeliver=gitDeliverFunc

#
# rmRemoteBranch
#
# A command to remove obtuse Git syntax for deleting a remote branch.
#
# $1   remoteName
# $2   branchName
#
rmRemoteBranchFunc() {
    git push $1 :$2
}
alias rmRemoteBranch=rmRemoteBranchFunc

#
# grep aliases
#

grepContextFunc() {
    # A grep command with before and after context
    grep --before-context 10 --after-context 10 $*
}
alias grep-context=grepContextFunc

#
# Juggernaut
#
# Want to use "brew install hr" instead."
# alias hr=""hr.py"
alias capcom="capcom.py"

#
# Python SimpleHTTPServer
#
alias serve="python -m SimpleHTTPServer 3001 &"

# browserSyncServerFunc() {
#     browser-sync start --server --files "**/*.css" --files "**/*.html" --files "**/*.js"
# }
# alias bsServer="browserSyncServerFunc"


# browserSyncProxyFunc() {
#     browser-sync start --proxy="localhost:$1" --files "**/*.css" --files "**/*.html" --files "**/*.js"
# }
# alias bsProxy="browserSyncProxyFunc"



alias notes="wstorm $CLOUDHOME/data/notes/"
alias sp="echo; echo; echo; echo; echo; clear; hr"
alias e="emacs"
alias enw="emacs -nw"

# An alias that allows you to easily run a locally installed node
# executable (from node_modules/.bin).
alias npm-exec='PATH=$(npm bin):$PATH'
