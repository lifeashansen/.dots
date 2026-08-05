# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # set -gx ZELLIJ_AUTO_ATTACH true
    # set -gx ZELLIJ_AUTO_EXIT true
    #
    # eval (zellij setup --generate-auto-start fish | string collect)
end

function fish_mode_prompt; end

function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s%s%s@%s →  ' (set_color $fish_color_cwd) $USER (set_color normal) $hostname
end



fish_vi_key_bindings

# starship init fish | source

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

alias "gs"="git status --short"
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

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export PAGER="less"
export PNPM_HOME=$HOME/.pnpm
export CHROME_EXECUTABLE=google-chrome-stable
export ANDROID_HOME=$HOME/Android/Sdk

fish_add_path $HOME/.spicetify

fish_add_path $HOME/.pnpm
fish_add_path $HOME/.pnpm/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.sdkman
fish_add_path $HOME/fvm/versions/stable/bin
fish_add_path $HOME/Android/Sdk/cmdline-tools/latest/bin
fish_add_path $HOME/Android/Sdk/platform-tools

fish_add_path $HOME/.pub-cache/bin

# Puro
fish_add_path $HOME/.puro/bin
fish_add_path $HOME/.puro/shared/pub_cache/bin
fish_add_path $HOME/.puro/envs/default/flutter/bin
export PURO_ROOT=$HOME/.puro

zoxide init fish | source
direnv hook fish | source

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

fish_add_path /home/hansen/.spicetify


# Added by Antigravity CLI installer
set -gx PATH "/home/hansen/.local/bin" $PATH
