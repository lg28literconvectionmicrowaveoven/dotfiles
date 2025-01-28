# set JAVA_HOME "/usr/lib/jvm/java-21-temurin/"
# set ANDROID_HOME "$HOME/Android/cmdline-tools/"
# set PATH "$HOME/scripts/:$HOME/.cargo/bin:$ANDROID_HOME/latest/bin:$HOME/Android/build-tools/36.0.0-rc3/:$HOME/Android/emulator/:$HOME/Android/platform-tools/:$PATH"
if status is-interactive
    starship init fish | source
    alias l="eza --color=always --icons=always -a"
    alias c=z
    alias fzf="fzf --preview 'bat --style=numbers --color=always {}'"
    alias lg=lazygit
    alias cl=clear
    alias lt="l --tree"
    alias v=nvim
    alias fzvim="fzf | xargs -n 1 nvim"
    zoxide init fish | source
end
