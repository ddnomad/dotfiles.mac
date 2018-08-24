################################################################
# dd prompt v1.0, nerd-fonts are required for that fancy chars #
################################################################

function get_git_branch {
    local git_branch
    git_branch=$(git branch 2>/dev/null | sed -n "s/* \\(.*\\)/\\1/p")
    if [ -n "$git_branch" ]; then
        echo -e " ${git_branch} "
    fi
}

# shellcheck disable=SC2016
printf -v PS1 "%s" \
    '$(if [[ $? != 0 ]]; then echo " \[\e[91m\]\[\e[0m\]";' \
    'fi) \u \[\e[90m\]$(get_git_branch)\[\e[0m\]$ '
PS2=" ↳ "
