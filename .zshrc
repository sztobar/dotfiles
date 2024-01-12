# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

alias la=ls -la

alias gs=git status
alias gcm=git commit
alias gc=git checkout
alias gcb=git checkout -b
alias gr=git rebase origin/master
alias gl=git log
alias gp=git push
alias gpu=git push -u

source "$HOME/antigen.zsh"

ZSH_TMUX_AUTOSTART=true

antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle poetry
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode
antigen theme xiong-chiamiov-plus

antigen apply

export EDITOR='vim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
