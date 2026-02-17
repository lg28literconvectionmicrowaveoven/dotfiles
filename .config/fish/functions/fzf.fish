function fzf --description "alias fzf fzf --preview 'bat --style=numbers --color=always {}'"
    command fzf --preview 'bat --style=numbers --color=always {}' $argv
end
