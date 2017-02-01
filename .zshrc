# Path to your oh-my-zsh installation.
export CONFIG=/home/codete/.config/zsh
export ZSH=$CONFIG/oh-my-zsh

export PATH=~/.npm-global/bin:$PATH
export ANDROID_HOME=/usr/local/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

export DOCKER_HOST=tcp://127.0.0.1:4243
export BEAKER_SERVER=127.0.0.1:8801
export STORAGE_SERVER=127.0.0.1:4000
export JUPYTER_SERVER=127.0.0.1:8888

export TAG=latest

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

alias vim=nvim
alias la=ls -la

alias gs=git status
alias gcm=git commit
alias gc=git checkout
alias gcb=git checkout -b
alias gr=git rebase origin/master
alias gl=git log
alias gp=git push
alias gpu=git push -u

alias agi=apt-get install
alias agu=apt-get update
alias agr=apt-get remove
alias aga=apt-get add

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

# ZSH_THEME="agnoster"
# ZSH_THEME="xiong-chiamiov-plus"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(git)
# ZSH_THEME="xiong-chiamiov-plus"

# User configuration

#  export PATH="/home/codete/.nvm/versions/node/v5.7.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# source $ZSH/oh-my-zsh.sh
source $CONFIG/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle vi-mode
antigen theme xiong-chiamiov-plus
antigen apply

export EDITOR='nvim'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

kpython(){
  docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it kaggle/python python "$@"
}
ikpython() {
  docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it kaggle/python ipython
}
kjupyter() {
  (sleep 3 && open "http://$(docker-machine ip docker2):8881")&
  docker run -v $PWD:/tmp/working -w=/tmp/working -p 8881:8881 --rm -it kaggle/python jupyter notebook --no-browser --ip="\*" --notebook-dir=/tmp/working
}
jupyter() {
  cd ~/git/docker-python;
  (sleep 3 && open "http://0.0.0.0:8881")&
  jupyter-notebook --ip=0.0.0.0 --port=8881
}
