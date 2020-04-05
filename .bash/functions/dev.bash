# FIXME: This is broken on macOS so needs to be fixed/refactored
# FIXME: Performance of finding a project name sucks because there are too
# much projects on my machine. Need to rethink an approach (limit depth?).
function dev {
    local helpmsg
    helpmsg="$(
        echo 'Usage: dev OPTIONS PROJECT';
        echo;
        echo 'Go to a base directory of a specified development project. ';
        echo 'This function supports bash completion which should allow ';
        echo 'to quickly select any project name.';
        echo;
        echo 'This function requires DEV_ROOT variable to be exported ';
        echo 'before it can be used. DEV_ROOT determines a root directory ';
        echo 'from which projects will be searched. Only directories that ';
        echo 'have Git VCS initialized are deemed to be "projects".';
        echo;
        echo 'OPTIONS';
        echo '    -h  --help  Print this message and exit';
        echo;
        echo 'EXAMPLES';
        echo '    # Prints this help message';
        echo '    dev -h';
        echo;
        echo '    # Completes to "my_project" if there is such project ';
        echo '    # directory in DEV_ROOT';
        echo '    dev my_[TAB]';
        echo;
        echo '    # Opens "other_dev_project" if there is such project ';
        echo '    # directory in DEV_ROOT';
        echo '    dev other_dev_project'
    )"

    local errmsg_pref
    errmsg_pref='---(X) ERR:'

    if test "$#" -lt 1; then
        >&2 echo "${helpmsg}"
        return 1
    fi

    local arg
    arg="$1"

    case "${arg}" in
        -h | --help )
            >&2 echo "${helpmsg}"
            return 0
            ;;
        -* )
            >&2 echo "${errmsg_pref} Unknown option: ${arg}"
            return 1
            ;;
    esac

    local dev_root
    dev_root="$(env | grep DEV_ROOT | cut -f2 -d'=')"

    if test -z "${dev_root}"; then
        >&2 echo "${errmsg_pref}DEV_ROOT variable is not set but is required"
    elif ! test -d "${dev_root}"; then
        >&2 echo "${errmsg_pref}DEV_ROOT does not exist: ${dev_root}"
    fi

    local project_path
    project_path="$(gfind "${dev_root}" -type d -name "${arg}" | head -n 1)"
    cd "${project_path}" || return
}
