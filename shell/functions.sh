where() {
    echo 'Stub'
}

depsearch() {
    if test "$#" -ne 1; then
        echo 'Usage: depsearch DEPENDENCY_NAME'
        echo
        echo 'Output produced is relative to a base directory (default: '
        echo "$HOME/Development). Search is performed in all"
        echo 'subdirectories of a base folder (but not outside).'
        echo
        echo 'Note that only Pipfiles are scanned. Projects which use a'
        echo 'different way of specifying dependencies are not currently'
        echo 'supported.'

        return 1
    fi

    local dependency
    dependency="$1"

    local base_dir
    base_dir="${HOME}/Development"

    local fname
    find "${base_dir}" -type f -name Pipfile | while read -r fname; do
        grep -Hne "${dependency}" "${fname}" | \
            sed -ne 's@.*Development/\(.*\)@\1@p'
    done
}


jqless() {
    if test "$#" -ne 1; then
        echo 'Usage: jqless FILE'
        echo
        echo 'Pretty print input JSON file with jq and pass it to less'
        echo 'command preserving colors.'

        return 1
    fi

    local json_fpath
    json_fpath="$1"

    if ! test -f "${json_fpath}"; then
        echo "Error: No such file: ${json_fpath}"
        return 1
    fi

    jq --color-output < "${json_fpath}" | less -R
}
