#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

export TERM="tmux-256color"
tabs -4
PROMPT_EOL_MARK=""

source <(fzf --bash)
eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias "l"="eza --color=always --long --icons=always -a"
alias "c"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "fzvim"="fzf | xargs -n 1 nvim"
alias "lg"="lazygit"
alias "cl"="clear"
alias "lt"="l --tree"
alias "hx"="helix"
alias "pn"="pnpm"
