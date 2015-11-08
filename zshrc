# Path to your oh-my-zsh installation.
export ZSH=/Users/hauwen/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"


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
plugins=(git common-aliases dirhistory autojump history osx python web-search)

# User configuration

export PATH="/usr/local/opt/coreutils/libexec/gnubin:/Users/hauwen/bin:/usr/local/bin:/Users/hauwen/anaconda/bin:/opt/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
#
#bindkey '\e[A' history-beginning-search-backward
#bindkey '\e[B' history-beginning-search-forward


# history stuff
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# fix zsh annoying history behavior
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search]']'



alias ls='ls --group-directories-first --color'
alias ll='ls -lhF'
alias la='ls -lha'
alias lt='ls -lhtr'
alias lta='ls -lhatr'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias pg='echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" && ps aux | grep --color=auto'
alias v='vim'

r0() { find . -type f -size 0 -print0 | xargs -0 rm -f; }

# parallel grep is a very fast implementation using gnu parallel
pagrep() {
    [[ -z "$1" ]] && echo 'Define a grep string and try again' && return 1
    find . -type f | parallel -k -j150% -n 1000 -m grep -H -n "$1" {}
}



x() {
    if [[ -f "$1" ]]; then
        case "$1" in
            *.tar.lrz)
                b=$(basename "$1" .tar.lrz)
                lrztar -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.lrz)
                b=$(basename "$1" .lrz)
                lrunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tar.bz2)
                b=$(basename "$1" .tar.bz2)
                bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.bz2)
                b=$(basename "$1" .bz2)
                bunzip2 "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tar.gz)
                b=$(basename "$1" .tar.gz)
                bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.gz)
                b=$(basename "$1" .gz)
                gunzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tar.xz)
                b=$(basename "$1" .tar.xz)
                bsdtar Jxf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.xz)
                b=$(basename "$1" .gz)
                xz -d "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.rar)
                b=$(basename "$1" .rar)
                unrar e "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tar)
                b=$(basename "$1" .tar)
                bsdtar xf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tbz2)
                b=$(basename "$1" .tbz2)
                bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.tgz)
                b=$(basename "$1" .tgz)
                bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.zip)
                b=$(basename "$1" .zip)
                unzip "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.Z)
                b=$(basename "$1" .Z)
                uncompress "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *.7z)
                b=$(basename "$1" .7z)
                7z x "$1" && [[ -d "$b" ]] && cd "$b" ;;
            *) echo "don't know how to extract '$1'..." && return 1;;
        esac
        return 0
    else
        echo "'$1' is not a valid file!"
        return 1
    fi
}





