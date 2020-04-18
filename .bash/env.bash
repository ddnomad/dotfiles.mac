# Default application settings
export EDITOR=nvim
export VISUAL=nvim

# Used by 'dev' function in functions directory to determine a base directory
# of development/code projects. FIXME: This function is currently broken.
export DEV_ROOT=/Users/"${USER}"/Development

# Add Rust tooling to a PATH
export PATH="${HOME}/.cargo/bin:${PATH}"
