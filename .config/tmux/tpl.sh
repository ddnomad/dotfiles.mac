#!/usr/bin/env bash
set -euo pipefail

readonly TPL_DIR="${HOME}/.config/tmux/tpl"
readonly TPL_ORIGIN=https://github.com/erikw/tmux-powerline.git
# shellcheck disable=SC2016
readonly TPL_OLD_CFG='$HOME/.tmux-powerlinerc'
# shellcheck disable=SC2016
readonly TPL_NEW_CFG='$HOME/.config/tmux/tpl.conf'
readonly TPL_PATHS_FILE="${TPL_DIR}/config/paths.sh"
readonly TPL_SPOTIFY_MAC_FILE="${TPL_DIR}/segments/np_spotify_mac.script"

function init {
    if test -f "${TPL_DIR}"; then
        echo 'Error: Already initialized'
        exit 1
    fi

    echo 'Initializing Tmux Powerline ...'
    git clone "${TPL_ORIGIN}" "${TPL_DIR}"

    echo 'Patching Tmux Powerline config path ...'
    gsed \
        -i \
        's@^\(.*\)'"${TPL_OLD_CFG}"'\(.*\)$@\1'"${TPL_NEW_CFG}"'\2@' \
        "${TPL_PATHS_FILE}"

    echo 'Patching Tmux Powerline Now Playing segment ...'
    gsed \
        -i \
        's@\(\t*.*to "\)►\(.*\)@\1\2@' \
        "${TPL_SPOTIFY_MAC_FILE}"
    gsed \
        -i \
        's@\(\t*.*to "\)❙❙\(.*\)@\1\2@' \
        "${TPL_SPOTIFY_MAC_FILE}"
}

function main {
    if test "$#" -eq 1 && test "$1" = 'init'; then
        init
        exit 0
    fi

    if ! test -d "${TPL_DIR}"; then
        echo "Error: Not initialized! Run the $0 init"
        exit 1
    fi

    "${TPL_DIR}"/powerline.sh "$@"
}

main "$@"
