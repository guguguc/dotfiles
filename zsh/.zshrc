# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
PROMPT='%B%F{red}%~%f%b %# '
setopt autocd beep extendedglob nomatch notify

# emacs edit mode
bindkey -e
alias ls='ls --color'
alias pc='proxychains'
alias py='python'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;33m' \
    command man "$@"
}

autoload -U colors && colors

zstyle :compinstall filename '/home/gugugu/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*' group-name ''

autoload -Uz compinit && compinit

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
 zinit light-mode for \
     zinit-zsh/z-a-rust \
     zinit-zsh/z-a-as-monitor \
     zinit-zsh/z-a-patch-dl \
     zinit-zsh/z-a-bin-gem-node

# ### End of Zinit's installer chunk
zinit light zsh-users/zsh-autosuggestions
zinit load zdharma/history-search-multi-word
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
zinit load agkozak/zsh-z
zinit ice blockf; zinit light zsh-users/zsh-completions
zinit ice silent wait:1; zinit light supercrabtree/k
# zinit ice silent wait!1 atload"ZINIT[COMPINIT_OPTS]=-C; zpcompinit"
zinit light zdharma/fast-syntax-highlighting
