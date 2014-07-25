dotfiles
=====

personal configure files for vim, zsh, git and so on.

== vimrc
```
# for syntastic
pip install pyflakes
```
```
# for YouCompleteMe
sudo apt-get install libclang-3.4-dev
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/usr/lib/llvm-3.4 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_core
make ycm_support_libs
```

```
# for format paste
sudo apt-get install vim-gnome
```

