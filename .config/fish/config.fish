set -g fish_greeting ""

if status is-interactive
    starship init fish | source
    fzf_configure_bindings --directory=\cf --git_log=\cl --git_status=\cs --processes=\cp --history=\cr --variables=\cv
end
