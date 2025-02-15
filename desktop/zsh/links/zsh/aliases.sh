alias diff='diff --color=auto -u'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lsusers='cut -d: -f1 /etc/passwd | sort'

function gca() { git commit --amend; }
function gcm() { git commit -m "$*"; }
function gd()  { git diff; }
function gst() { git status; }
