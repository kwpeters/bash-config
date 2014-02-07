echo 'Initializing bash shell (.bash_profile)...'

#
# Detect the operating system
#
platform='UNKNOWN'   # Possible values: Windows, Mac, UNKNOWN
unamestr=`uname`
if [[ $unamestr == MINGW32* ]]; then
    platform='Windows'
elif [[ $unamestr == Darwin* ]]; then
    platform='Mac'
else
    echo '========================================'
    echo 'ERROR!'
    echo 'Detected operating system: UNKNOWN'
    echo '========================================'
fi

#
# Platform-specific initialization
#
if [[ $platform == 'Mac' ]]; then
    export DROPBOXHOME=~/Dropbox/home
    export CLOUDHOME=$DROPBOXHOME
    source "$CLOUDHOME/appdata/bash-config/bash_profile_mac.bash"

elif [[ $platform == 'Windows' ]]; then
    export DROPBOXHOME=~
    export CLOUDHOME=$DROPBOXHOME
    source "$CLOUDHOME/appdata/bash-config/bash_profile_windows.bash"

fi

#
# Common initialization
#
source "$CLOUDHOME/appdata/bash-config/bash_profile_common.bash"


