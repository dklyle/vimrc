## .vimrc file
This started from my use of [spf13-vim] and borrows sections from there.
However, it is heavily pared back and butchered from there to suit my needs.
Most notably all support autocomplete via neocomplete as I never was able to
get that performant on large python files. The main goal is to keep the editor
out of the way as much as possible and thus lightweight.

## Quick Start

1. Pull vimrc and put into place

  `$ git clone https://github.com/dklyle/vimrc.git`

  `$ cp vimrc/.vimrc ~/.vimrc`

2. Setup Vundle and install plugins

  `$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

  `$ vim +PluginInstall +qall`


[spf13-vim]:https://github.com/spf13/spf13-vim
