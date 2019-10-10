[ ! -d "$XDG_DATA_HOME/zsh" ] && mkdir "$XDG_DATA_HOME/zsh"
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=2000	# Nr. commands to keep in HISTFILE
SAVEHIST=2100	# Nr. commands to keep in memory for a session
setopt share_history			# Share history between different instances of zsh
setopt hist_expire_dups_first	# Expire duplicate entries first when trimming history
setopt hist_ignore_dups			# Don't record an entry that was just recorded
setopt hist_ignore_space		# Don't insert cmds into hist if space is the leading char
setopt hist_reduce_blanks		# Remove superfluous blanks in commands

setopt autocd

# Keybinds
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Rust config
[ -f ~/.cargo/env ] && source ~/.cargo/env

# Load aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Load plugins managed by antibody
source "$XDG_CONFIG_HOME/zsh/zsh_plugins.sh"
