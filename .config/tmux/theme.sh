TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'0'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'7'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

if [ -z "${TMUX_POWERLINE_LEFT_STATUS_SEGMENTS}" ]; then
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
        "hostname 4 0" \
        "wan_ip 19 7" \
        "pwd 18 7" \
    )
fi

if [ -z "${TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS}" ]; then
    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
        "now_playing 18 20" \
        "date_day 9 0" \
        "date 9 0 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
        "time 9 0 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
    )
fi
