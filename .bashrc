# In my current usage, this file is only executed when Emacs starts a shell.
echo 'Executing .bashrc'

# Unset this environmnet variable to force execution of .bash_profile.
unset BASHPROFILE

# When bash is invoked with "-i", an "interactive" session will be
# started, which will run this .bashrc file.  The problem is that
# "bash -i" may be run from any directory, so we have to make sure to
# specify the path to .bash_profile.
BASHPROFILE_FILEPATH="$HOME/.bash_profile"
source $BASHPROFILE_FILEPATH

