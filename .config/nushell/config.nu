$env.config = {
    buffer_editor: "nvim"
    show_banner: false
    ls: {
        use_ls_colors: true
        clickable_links: true
    }
    table: {
        mode: rounded
        index_mode: auto
        show_empty: true
        padding: {
            left: 1
            right: 1
        }
        trim: {
            methodology: wrapping
            wrapping_try_keep_words: true
            truncating_suffix: "..."
        }
        header_on_separator: false
    }
    error_style: "fancy"
    completions: {
        case_sensitive: false
        quick: true
        partial: true
        algorithm: "fuzzy"
        external: {
            enable: true
            completer: null
        }
        use_ls_colors: true
    }
    filesize: {
        metric: true
        format: "auto"
    }
    use_kitty_protocol: true
    keybindings: [
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [vi_insert]
            event: {
                edit: backspaceword
            }
        }
    ]
}
source ~/.zoxide.nu
source ~/.cache/carapace/init.nu
use ~/.cache/starship/init.nu
alias l = eza --color=always --icons=always -a
alias c = z
alias fzf = fzf --preview 'bat --style=numbers --color=always {}'
alias lg = lazygit
alias cl = clear
alias lt = l --tree
alias v = nvim
