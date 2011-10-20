# -------------------------------------------------------
# Original Author: Nathan Broadbent
# Modified By: Michael-Keith Bernard
# Source: https://github.com/ndbroadbent/ubuntu_config
# Retrieved: Oct 19, 2011
# -------------------------------------------------------

# -------------------------------------------------------
# Share Bash history across sessions
# -------------------------------------------------------

# append to the history file, don't overwrite it
shopt -s histappend

export HISTSIZE=20000
export HISTFILESIZE=$HISTSIZE
# don't put duplicate lines in the history,
# ignore lines starting with a space
export HISTCONTROL=ignoredups:ignorespace
# ignore some common commands
export HISTIGNORE="&:ls:ll:gs:gd:[bf]g:exit:pwd:clear:mount:umount"

history() {
  _bash_history_sync
  builtin history $@
}

_bash_history_sync() {
  builtin history -a
  builtin history -c
  builtin history -r
}

export PROMPT_COMMAND+='_bash_history_sync;'

