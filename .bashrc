# ~/.bashrc: executed by bash(1) for non-login shells.
export LANG=ja_JP.UTF-8

##################
### My Aliases ###
##################

### bash_commands ###
alias mduch='sh $HOME/dotfiles/lib/touch_mkdir.sh'
alias ls='ls -laG'
alias ll='ls -laG'
alias la='ls -a'

### Git ###
alias gst='git status'
alias gco='git checkout'
alias gr='git restore'
alias gl='git pull'
alias gp='git push'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -am'

### Try Hack Me ###
alias thm='sudo openvpn $HOME/tryhackme/setting.ovpn'

export PATH=$HOME/.progate/bin:$PATH

### vim ###
alias vim="nvim"

### translate ###
alias japanese="trans -b en:ja"
. "$HOME/.cargo/env"
