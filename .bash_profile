if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Path ------------------------------------------------------------
if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:/usr/local/bin:$PATH
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export BYOBU_PREFIX=$(brew --prefix)
export ARCHFLAGS="-arch x86_64"

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\h:\W \u\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

# Python path -----------------------------------------------------
if [ -d ~/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

# Locate virtualenvwrapper script
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    VENVWRAP=/usr/local/bin/virtualenvwrapper.sh
fi

if [ ! -z $VENVWRAP ]; then
    # virtualenvwrapper
    export WORKON_HOME=$HOME/.virtualenvs
    # make sure env directory exists; otherwise, create it
    [ -d $WORKON_HOME ] || mkdir -p $WORKON_HOME
    source $VENVWRAP

    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
    export VIRTAULENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

    # virtualenv
    export VIRTUALENV_USE_DISTRIBUTE=true

    # pip
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
    export PIP_REQUIRE_VIRTUALENV=true
    export PIP_RESPECT_VIRTUALENV=true
    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# SublimeText
export EDITOR='subl -w'

# Perl
export PERL5LIB=$PERL5LIB:/usr/local/lib/perl5/site_perl

export DYLD_LIBRARY_PATH=/usr/local/opt/mysql/lib

export ANDROID_SDK=/Developer/android-sdk-macosx
export ANDROID_HOME=$ANDROID_SDK
export SDK_ROOT=$ANDROID_SDK
export ANDROID_NDK=/Developer/android-ndk-r9
export ANDROID_NDK_ROOT=$ANDROID_NDK
export NDK_ROOT=$ANDROID_NDK
export NDK_OS=darwin-x86_64
export USE_CCACHE=1
export NDK_CCACHE=`which ccache`
export CCACHE_PREFIX="distcc"
export DISTCC_HOSTS="localhost 192.168.0.46 192.168.0.96 192.168.0.100"
export DISTCC_POTENTIAL_HOSTS="localhost 192.168.0.46 192.168.0.96 192.168.0.100"
export PATH=/usr/local/bin:$PATH:$ANDROID_NDK:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:~/bin
launchctl setenv PATH $PATH
