# ~/.bashrc: executed by bash(1) for non-login shells.
export LANG=ja_JP.UTF-8

eval "$(starship init bash)"

##################
### My Aliases ###
##################

### bash_commands ###
alias mduch='sh $HOME/dotfiles/lib/touch_mkdir.sh'
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

source ~/.git-prompt.sh
if [ $UID -eq 0 ]; then
    PS1='\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
else
    PS1='\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\\$ '
fi

### translate ###
alias japanese="trans -b en:ja"
