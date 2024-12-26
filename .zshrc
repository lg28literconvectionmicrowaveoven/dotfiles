if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ENABLE_CORRECTION="true"
JAVA_HOME="/usr/lib/jvm/java-21-temurin/"
ANDROID_HOME="$HOME/Android/cmdline-tools/"
PATH="$HOME/.cargo/bin:$ANDROID_HOME/latest/bin:$HOME/Android/build-tools/36.0.0-rc3/:$HOME/Android/emulator/:$HOME/Android/platform-tools/:$PATH"
PROMPT_EOL_MARK=""
ZSH=/usr/share/oh-my-zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
plugins=(
    git
    zsh-autosuggestions
    z
    zsh-syntax-highlighting
    colored-man-pages
    zsh-shift-select
    conda-zsh-completion
)
fpath+=~/.zfunc
autoload -U compinit && compinit
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
alias "l"="eza --color=always --long --icons=always -a"
alias "c"="z"
alias "fzf"="fzf --preview 'bat --style=numbers --color=always {}'"
alias "fzvim"="fzf | xargs -n 1 nvim"
alias "lg"="lazygit"
alias "cl"="clear"
alias "lt"="l --tree"
alias "v"="nvim"
resolve-convert() {
    ffmpeg -i $1 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a alac $2
}
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
tabs -4
# [ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
#         . "/opt/mambaforge/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/mambaforge/bin:$PATH"
#     fi
# fi
# unset __conda_setup
#
# if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
#     . "/opt/mambaforge/etc/profile.d/mamba.sh"
# fi
# <<< mamba initialize <<<
