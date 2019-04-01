# Quit if not running interactively
[[ $- != *i* ]] && return

# Define a sourcing prefix
readonly SOURCE_PREFIX="/Users/$(whoami)"

# Source "modules"
source "${SOURCE_PREFIX}"/.bash/prompt.bash
source "${SOURCE_PREFIX}"/.bash/settings.bash
source "${SOURCE_PREFIX}"/.shell/functions.sh
source "${SOURCE_PREFIX}"/.shell/aliases.sh

export PATH=/usr/local/sbin:$PATH
