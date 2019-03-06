export EDITOR=nano
[ -z $XDG_DATA_HOME ] && export XDG_DATA_HOME=$HOME/.local/share
[ -z $XDG_CONFIG_HOME ] && export XDG_CONFIG_HOME=$HOME/.config

HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=1000				# Nr. commands to keep in HISTFILE
SAVEHIST=500				# Nr. commands to save for a single session
setopt hist_ignore_dups		# Ignore repeated commands in history
setopt hist_ignore_space	# Don't insert cmds into hist if space is the leading char
setopt hist_reduce_blanks

setopt autocd

# Keybinds
bindkey -e
bindkey "$terminfo[khome]" beginning-of-line
bindkey "$terminfo[kend]" end-of-line
bindkey "$terminfo[kdch1]" delete-char
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
# Hack to actually apply binds with $terminfo
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init() {
		echoti smkx
	}
	function zle-line-finish() {
		echoti rmkx
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

# Rust config
[ -f ~/.cargo/env ] && source ~/.cargo/env

# Load aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Load plugins managed by antibody
source "$XDG_CONFIG_HOME/zsh/zsh_plugins.sh"

antibody_edit() {
	$EDITOR "$XDG_CONFIG_HOME/zsh/zsh_plugins.txt"
	antibody bundle < "$XDG_CONFIG_HOME/zsh/zsh_plugins.txt" > "$XDG_CONFIG_HOME/zsh/zsh_plugins.sh"
}
