dotfiles
=====

personal configure files for vim, zsh, git and so on.

#### install [vundle](https://github.com/gmarik/Vundle.vim)
```sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

#### install [brew](http://brew.sh/)
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### install vim
```sh
brew install macvim --with-cscope --with-lua --override-system-vim --HEAD
```

#### install vim config and plugin
```sh
git clone https://github.com/zeayes/dotfiles
cd dotfiles
ln -s vimrc ~/.vimrc
ln -s plugin.vim ~/.vim/plugin.vim
# config for jshint
ln -s jshintrc ~/.jshintrc
# config for scss-lint
ln -s scsslint.yml ~/.scsslint.yml
# config for plugin ternjs/tern_for_vim
ln -s tern-project  ~/.tern-project
```

#### install syntastic checkers
##### 1. flake8 for python
```sh
# for syntastic
# use flake8 to check python syntax
# sudo pip install pyflakes
sudo pip install flake8
```

##### 2. jshint for javascript
```sh
sudo npm install jshint
```

##### 3.  scss-lint for scss
```sh
sudo npm install scss-lint
```

##### 4. tidy for html&jinja
```sh
sudo npm install tidy
```

#### 5. ternjs for javascript
```
cd ~/.vim/bundle/tern_for_vim
npm install
```

#### install [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)


##### 1. `MAC`
```sh
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer --system-libclang
```

##### 2. build yourself
```sh
sudo apt-get install libclang-3.4-dev
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/usr/lib/llvm-3.4 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_core
make ycm_support_libs
```

### install markdown preview
```sh
npm -g install instant-markdown-d
```
