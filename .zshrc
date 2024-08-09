if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="/usr/share/oh-my-zsh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
plugins=(
    git
    zsh-autosuggestions
    z
    zsh-syntax-highlighting
    colored-man-pages
    zsh-shift-select
)
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
alias "ls"="eza --color=always --long --icons=always"
alias "cd"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "fzvim"="fzf | xargs -n 1 nvim"
resolve-convert() {
    ffmpeg -i $1 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a alac $2
}
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
