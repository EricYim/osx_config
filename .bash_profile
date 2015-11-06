# Path ------------------------------------------------------------
if [ -d ~/.local/bin ]; then
  export PATH=~/.local/bin:/usr/local/bin:$PATH
fi

# Python path -----------------------------------------------------
if [ -d ~/.local/lib/python2.7/site-packages ]; then
  export PYTHONPATH=~/.local/lib/python2.7/site-packages:$PYTHONPATH
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\h:\W \u\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

# added by Anaconda 1.6.1 installer
#export PATH="/Users/nacchii/anaconda/bin:$PATH"
export DYLD_LIBRARY_PATH=/usr/local/opt/mysql/lib
