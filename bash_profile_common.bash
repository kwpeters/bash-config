#!bash


################################################################################
#
# Bash configuration common to all platforms
#
################################################################################

echo 'Performing common initialization (bash_profile_common.bash)...'


#
# Git aliases
#
alias gitclean="git clean -d -f -x"
alias gitbig="git config http.postBuffer 524288000"
alias gitsmall="git config --unset http.postBuffer"


#
# copyFromGit
#
# A command that copies the source code out of a Git repository while
# ignoring non-source code files.
#
copyFromGitFunc() {
    kcopy.py --ignore "/\.git/" --ignore "/node_modules/" --ignore "\.DS_Store" $1 $2
}

alias copyFromGit=copyFromGitFunc
