# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zeayes"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(autojump git osx colored-man supervisor brew vundle tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

if brew list | grep coreutils > /dev/null ; then
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    export MANPATH=$(brew --prefix coreutils)/libexec/gnubin:$MANPATH
    alias ls='ls -F --show-control-chars --color=auto'
    eval `gdircolors -b $HOME/.dir_colors`
    export GOROOT=$(brew --prefix go)/libexec
    export GOPATH=$HOME/Golib
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
    export PATH=$(brew --prefix llvm)/bin:$PATH
fi

# eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=/usr/bin/vim
export PATH=/Users/zeayes/Library/Python/2.7/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home #jdk安装路径
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# export PYENV_ROOT=/usr/local/var/pyenv

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa.pub"

export HOMEBREW_BOTTLE_DOMAIN="http://7xkcej.dl1.z0.glb.clouddn.com"

alias supervisorctl="supervisorctl -c /usr/local/supervisor/supervisord.conf"
# alias vim="/usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/Vim"
