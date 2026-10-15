if status is-interactive
    set fish_greeting
end

function fish_mode_prompt
end

function fish_prompt -d "Write out the prompt"
    printf '%s%s%s@%s →  ' (set_color $fish_color_cwd) $USER (set_color normal) $hostname
end

fish_vi_key_bindings

alias "src"="source ~/.config/fish/config.fish"
alias "ls"="eza"
alias "s"="eza"
alias "x"="clear"
alias "c"="wl-copy"
alias "q"="exit"
alias ":q"="exit"
alias "l"="eza"
alias "la"="eza -la"
alias "sl"="eza"
alias "lg"="lazygit"
alias "v"="nvim"
alias "zed"="zeditor"
alias "mkdir"="mkdir -p"
alias "tk"="tmux kill-server"
alias "zk"="zellij kill-all-sessions"

alias "gs"="git status"
alias "gss"="git status --short"
alias "gd"="git diff"
alias "gc"="git commit"
alias "ga"="git add"
alias "gcl"="git clone"
alias "gp"="git push"
alias "gpm"="git push -u origin main"
alias "cat"="bat"
alias "car"="bat"

alias "cr"="cargo run"
alias "cb"="cargo build"
alias "cbr"="cargo build --release"

alias "mk"="make"
alias "mr"="make run"
alias "mb"="make build"

alias "k"="kubectl"

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export PAGER="less"
export PNPM_HOME=$HOME/.pnpm

fish_add_path $HOME/.spicetify
fish_add_path $HOME/.pnpm
fish_add_path $HOME/.pnpm/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.sdkman

zoxide init fish | source
direnv hook fish | source

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

function dsh --description "Exec into docker containers"
    set -l container $argv[1]
    set -l shell $argv[2]

    if test -z "$shell"
        set shell /bin/sh
    end

    docker exec -it $container $shell

end
