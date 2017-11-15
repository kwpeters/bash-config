# In my current usage, this file is only executed when Emacs starts a shell.

echo 'Executing .bashrc'

# Unset this environmnet variable to force execution of .bash_profile.
unset BASHPROFILE
source ".bash_profile"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
