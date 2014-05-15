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
ffFunc() {
    find . -iregex ".*$1.*" -print
}

alias ff=ffFunc


################################################################################
#
# fif (Find In File)
#
# A command that searches for a regular expression within all files.
#
################################################################################
fifFunc() {
    find . -name "*" -type f -exec grep -Hn --binary-files=without-match "$1" {} \;
}

alias fif=fifFunc


################################################################################
#
# fifl (Find In File - show only file names)
#
# A command that searches for a regular expression within all files and prints
# only the file names that contain matches.
#
################################################################################
fiflFunc() {
    find . -name "*" -type f -exec grep -HInl "$1" {} \;
}

alias fifl=fiflFunc


#
# Git aliases
#
alias gs="git status"
alias gitclean="git clean -d -f -x"
alias gitbig="git config http.postBuffer 524288000"
alias gitsmall="git config --unset http.postBuffer"
alias gitbr="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/"

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
# Juggernaut
#
alias hr="hr.py"
alias capcom="capcom.py"

#
# Python SimpleHTTPServer
#
alias serve="python -m SimpleHTTPServer 3001 &"
