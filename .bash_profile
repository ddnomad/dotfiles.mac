# Force bash to load bashrc even if it is a login shell
# shellcheck source=/dev/null
test -f ~/.bashrc && source ~/.bashrc
