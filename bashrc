# Quit if not running interactively
[[ $- != *i* ]] && return


readonly SOURCE_PREFIX="/Users/$(whoami)"


source "${SOURCE_PREFIX}"/.bash/prompt.bash
source "${SOURCE_PREFIX}"/.bash/settings.bash
source "${SOURCE_PREFIX}"/.shell/functions.sh
source "${SOURCE_PREFIX}"/.shell/aliases.sh
