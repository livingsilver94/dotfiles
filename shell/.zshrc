[ ! -d "$XDG_DATA_HOME/zsh" ] && mkdir "$XDG_DATA_HOME/zsh"
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=2000	# Nr. commands to keep in HISTFILE
SAVEHIST=2100	# Nr. commands to keep in memory for a session
setopt share_history					# Share history between different instances of zsh
setopt hist_expire_dups_first	# Expire duplicate entries first when trimming history
setopt hist_ignore_dups				# Don't record an entry that was just recorded
setopt hist_ignore_space			# Don't insert cmds into hist if space is the leading char
setopt hist_reduce_blanks			# Remove superfluous blanks in commands

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
	$EDITOR "$XDG_CONFIG_HOME/zsh/zsh_plugins"
	antibody bundle < "$XDG_CONFIG_HOME/zsh/zsh_plugins" > "$XDG_CONFIG_HOME/zsh/zsh_plugins.sh"
}
