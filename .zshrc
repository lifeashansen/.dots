PROMPT="%F{245}ec%f%F{red}%?%f %F{green}%n%f%F{yellow}@%f%F{red}%m%f →  "

ZSH_PLUGINS_DIR=$HOME/.zshplugins

if [[ ! -d $ZSH_PLUGINS_DIR ]]; then 
    mkdir -p $ZSH_PLUGINS_DIR
fi

if [[ ! -d $ZSH_PLUGINS_DIR/fzf-tab ]]; then
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_PLUGINS_DIR}/fzf-tab
fi

autoload -U compinit && compinit
source ${ZSH_PLUGINS_DIR}/fzf-tab/fzf-tab.plugin.zsh

# Show ⏎ when a command doesn't end with newline
PROMPT_EOL_MARK=$'\u23ce'

alias src="source $HOME/.zshrc"
alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -la --color=auto'
alias q='exit'
alias :q='exit'
alias x='clear'
alias lg='lazygit'
alias c='wl-copy'
alias v='nvim'
alias mkdir='mkdir -p'
alias tk='tmux kill-server'

alias gs='git status --short'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'
alias gcl='git clone'
alias gp='git push'
alias gpm='git push -u origin main'
alias cat='bat'
alias car='bat'

alias cr='cargo run'
alias cb='cargo build'
alias cbr='cargo build --release'
alias cbrl='cargo build --release --locked'

alias "mr"="make run"
alias "mb"="make build"
alias "mbr"="make build-release"

alias "tf"="terraform"
alias "k"="kubectl"

# --- HISTORY ---

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# append to history rather than overwriting
setopt appendhistory
# share history across all zsh sessions at the same time
setopt sharehistory
# dont add commands starting with space to history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups 
setopt hist_find_no_dups

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export PAGER="less"
export PNPM_HOME=$HOME/.pnpm

export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/.pnpm:$PATH"
export PATH="$HOME/.pnpm/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.sdkman:$PATH"

# --- KEYBINDS ---
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

