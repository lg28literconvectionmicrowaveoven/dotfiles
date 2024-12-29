$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
zoxide init nushell | save -f ~/.zoxide.nu
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
