macOS Dotfiles
==============
This repository contains dd's personal dotfiles for
[macOS](https://en.wikipedia.org/wiki/MacOS). This is already V2 which was
"backported" from my [Arch Linux](https://www.archlinux.org/)
[dotfiles](https://github.com/ddnomad/dotfiles.arch). This version uses
[YADM](https://github.com/TheLocehiliosan/yadm) for managing the files under
[VCS](https://en.wikipedia.org/wiki/Version_control).

At any given point in time something in this configuration may be broken either
bacause it was not yet noticed or because there is no time to fix it just yet.

For those curious to see even worse version of these dots there is also
[V1](https://github.com/ddnomad/dotfiles.mac/tree/legacy/v1) branch that keeps
the very first generation of this repository untouched.

Self Reminders
--------------
### nvim
- Added [vim-commentary](https://github.com/tpope/vim-commentary). Use it with
  `gc` (toggle comment line), selection + `gc` (toggle comment a selected block
  ).
- Added [ctrlp.vom](https://github.com/ctrlpvim/ctrlp.vim). No extra
  configuration was performed. Use `Ctrl+P` to search for a file and open in
  a current buffer. Worth keeping?
- Added [ncm2](https://github.com/ncm2/ncm2) autocompletion and some
  completion providers. Currently it is annoying vvv much. Might be worth
  trying to get used to it.
- Added [SimpylFold](https://github.com/tmhedberg/SimpylFold). Use `zc` to
  fold all, `zi` to unfold all, `za` to toggle fold of a selected fold,
  `zA` to toggle fold and all nested folds.
