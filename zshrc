HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/snue/.zshrc'

# Autocomplete
autoload -Uz compinit
compinit

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '[%b]'

setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init --cmd cd --hook pwd zsh)"

[ -f "/home/snue/.ghcup/env" ] && source "/home/snue/.ghcup/env" # ghcup-env

alias sdu='source /home/snue/code/navigator/navigator.sh /home/snue/sdu/overblik'
alias temp='kak ~/misc/temp_file'
