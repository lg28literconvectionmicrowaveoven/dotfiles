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
source <(fzf --zsh)
alias "ls"="eza --color=always --long --icons=always"
alias "cd"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "fzvim"="fzf | xargs -n 1 nvim"
alias "cat"="bat"
alias "grep"="rg"
resolve-convert() {
    ffmpeg -i $1 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a alac $2
}
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
