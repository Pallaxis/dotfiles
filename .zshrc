# Autostarting stuff
#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then                       # Starts Hyprland automatically when on TTY1
#    exec Hyprland                                                         # Pairs nicely with auto-exec'ing a lock screen or FDE
#fi

# Sending commands on terminal launch
fastfetch                                                               # Shows a sick ass fetch
stty -ixon                                                              # Disables XON/XOFF flow control
stty -ixoff                                                             # Disables sending of start/stop characters
setopt extended_glob

# There's probably a better way to do this
export XDG_CACHE_HOME=$HOME/.cache/


# Zinit stuff
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"     # Set the directory we want to store zinit and plugins
if [ ! -d "$ZINIT_HOME" ]; then                                         # Download Zinit, if it's not there yet
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"                                        # Source/Load zinit

# Autoruns tmux on terminal start                                       # Probably need to find a better way to do this if I'm gonna uncomment it
#if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
#  # Adapted from https://unix.stackexchange.com/a/176885/347104
#  # Create session 'main' or attach to 'main' if already exists.
#  tmux new-session -A -s main
#fi


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
#zinit ice depth=1
#zinit light jeffreytse/zsh-vi-mode

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' default-color ""
zstyle ':fzf-tab:*' fzf-flags --color=query:#89b4fa,hl:#f7b3e2,hl:#cba6f7,hl+:#cba6f7,selected-hl:#89b4fa,fg:#89b4fa,fg+:#89b4fa,bg+:#313244,info:#cba6f7,border:#cba6f7,pointer:#cba6f7,marker:#cba6f7


# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q


# Keybindings
WORDCHARS=${WORDCHARS/\/}                                               # Allows deleting up to / as a word
bindkey -e
bindkey '^[[5~' history-search-backward
bindkey '^[[6~' history-search-forward
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '\e[3~' delete-char
bindkey -r "^S"


# History
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Helpful aliases
alias c='clear'                                                        # Clear terminal
alias l='eza -lh  --icons=auto'                                        # Long list
alias ls='eza -1   --icons=auto'                                       # Short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # Long list all
alias ld='eza -lhD --icons=auto'                                       # Long list dirs
alias un='yay -Rns'                                                    # Uninstall package
alias up='update.sh up'                                                # Update system/package/aur
alias pl='yay -Qs'                                                     # List installed package
alias pa='yay -Ss'                                                     # List availabe package
alias pc='yay -Sc'                                                     # Remove unused cache
alias po='yay -Qtdq | $aurhelper -Rns -'                               # Remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias cat='bat'                                                        # Cat but with colors

# Handy change dir shortcuts
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

alias mkdir='mkdir -p'                                                 # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias cp='cp -r'                                                       # Same for cp
alias ssh='kitten ssh'                                                 # Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh

# Custom aliases
alias homeserver='~/.secrets/homeserver'
alias oraclebox='~/.secrets/oraclebox'
alias sudo='sudo '
alias vi='nvim'


# Shell integrations
eval "$(batman --export-env)"
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
