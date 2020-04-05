# shellcheck disable=SC1090
# If not running interactively, do nothing
[[ $- != *i* ]] && return

# Define a source prefix
readonly SOURCE_PREFIX="/Users/${USER}"

# Load "modules"
source "${SOURCE_PREFIX}"/.bash/aliases.bash
source "${SOURCE_PREFIX}"/.bash/env.bash
source "${SOURCE_PREFIX}"/.bash/prompt.bash
source "${SOURCE_PREFIX}"/.bash/settings.bash

# Source functions
for func in "${SOURCE_PREFIX}"/.bash/functions/*; do
    # shellcheck disable=SC1090
    test -f "${func}" && source "${func}"
done
