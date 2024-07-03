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
    conda-zsh-completion
)
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
export SDKMAN_DIR="$HOME/.sdkman"
export LIBVA_DRIVER_NAME="iHD"
export GTK_USE_PORTAL=1
export EDITOR="nvim"
export CONDA_AUTO_ACTIVATE_BASE=false
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias "ls"="eza --color=always --long --icons=always"
alias "cd"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "zr"="zellij run -- "
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
__conda_setup="$('/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/opt/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/opt/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
fi
