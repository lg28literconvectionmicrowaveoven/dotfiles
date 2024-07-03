if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-autosuggestions
    z
    zsh-syntax-highlighting
    colored-man-pages
    zsh-shift-select
)
source $ZSH/oh-my-zsh.sh
export SDKMAN_DIR="$HOME/.sdkman"
export LIBVA_DRIVER_NAME="iHD"
export GTK_USE_PORTAL=1
export EDITOR="nvim"
export PATH="/opt/miniconda3/bin:$PATH"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias "ls"="eza --color=always --long --icons=always"
alias "cd"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "zr"="zellij run -- "
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
