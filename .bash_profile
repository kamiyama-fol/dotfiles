### basic setup ###
source ~/.bashrc
export BASH_SILENCE_DEPRECATION_WARNING=1

### command manual ###
# cat ~/.bashrc | grep '^alias ' | sed 's/alias //g' | sed "s/'//g"

### Local App ###
export PATH=$PATH:$HOME/.local/bin

### my command ###
export PATH="$HOME/.bin:$PATH"

### GitHub CLI ###
export PATH=$PATH:$HOME/.gh/bin

### Python ###
if [ -d "$HOME/.pyenv" ]
then
  export PYENV_ROOT="$HOME/.pyenv"
  for each in {bin,shims}
  do
    echo $PATH | grep --quiet "$PYENV_ROOT/$each"
    if [ ! $? == 0 ]
    then
      export PATH="$PYENV_ROOT/$each:$PATH"
    fi
  done
  if command -v pyenv 1>/dev/null 2>&1
  then
    eval "$(pyenv init -)"
  fi
fi

### JavaScript ###
if [ -d "$HOME/.nvm" ]
then
  export NVM_DIR="$HOME/.nvm"
  echo $PATH | grep --quiet "$NVM_DIR"
  if [ ! $? == 0 ]
  then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
fi

### Ruby ###
if [ -d "$HOME/.rbenv" ]
then
  export RBENV_ROOT="$HOME/.rbenv"
  echo $PATH | grep --quiet "$RBENV_ROOT/bin"
  if [ ! $? == 0 ]
  then
    export PATH="$RBENV_ROOT/bin:$PATH"
  fi
  if command -v rbenv 1>/dev/null 2>&1
  then
    eval "$(rbenv init -)"
  fi
fi

### go ###
export PATH="$HOME/.go/bin/:$PATH"

### Rust ###
if [ -d "$HOME/.cargo/" ];
then
  export PATH="$HOME/.cargo/bin/:$PATH"
  export CARGO_HOME=$HOME/.cargo/
fi

### starship ###
if [ -f "$HOME/.cargo/bin/starship" ]; 
then
  export PATH="$HOME/.cargo/bin:$PATH"
  eval "$(starship init bash)"
fi

### PHP ###
export PATH="/Users/kohki/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/kohki/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

### Apache Ant ###
if [ -d "/usr/local/apache-ant-1.10.14" ]
then
  export ANT_HOME="/usr/local/apache-ant-1.10.14"
  echo $PATH | grep --quiet "$ANT_HOME/bin"
  if [ ! $? == 0 ] ; then PATH=$PATH:$ANT_HOME/bin ; fi
  export ANT_OPTS="-Dfile.encoding=UTF-8 -Xmx512m -Xss256k"
fi



### Subversion ###
if [ -d "/opt/subversion" ]
then
  export SVN_HOME="/opt/subversion"
  echo $PATH | grep --quiet "$SVN_HOME/bin"
  if [ ! $? == 0 ] ; then PATH=$SVN_HOME/bin:$PATH ; fi
fi

### Homebrew ###
if [ -d $HOME/.homebrew/ ]; 
then
  export PATH="$HOME/.homebrew/bin:$PATH"
fi

### laravel ###
export PATH="$HOME/.composer/vendor/bin:$PATH"

### laravel Sail ###
export PATH="./vendor/bin:$PATH"

### Volta ###
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

### nvim ###
export PATH="$HOME/.nvim/bin:$PATH"
. "$HOME/.cargo/env"


