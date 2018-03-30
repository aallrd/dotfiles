.vim
====

My VIM configuration.

	git submodule update --init --recursive
    git submodule foreach git pull --recurse-submodules origin master
    # Producing the list of installed plugins
    git submodule --quiet foreach bash -c "echo -e \"* [\$(git config --get remote.origin.url | sed 's#https://##' | sed 's#git://##' | sed 's/.git//')](\$(git config --get remote.origin.url))\""

## Pathogen

The plugins are managed thanks to the [Pathogen](https://github.com/tpope/vim-pathogen) runtime path manager.

## Plugins Used

* [github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git)
* [github.com/altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized.git)
* [github.com/tpope/vim-endwise](https://github.com/tpope/vim-endwise.git)
* [github.com/tpope/vim-five.git](https://github.com/tpope/vim-fugitive.git)
* [github.com/elzr/vim-json](https://github.com/elzr/vim-json.git)
* [github.com/ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim.git)
* [github.com/Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim.git)
* [github.com/terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors.git)
* [github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline.git)
* [github.com/vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes.git)
* [github.com/vim-syntastic/syntastic.git](https://github.com/vim-syntastic/syntastic.git)
* [github.com/scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter.git)
* [github.com/mbbill/undotree](https://github.com/mbbill/undotree.git)
* [github.com/tpope/vim-surround](https://github.com/tpope/vim-surround.git)
* [github.com/octol/vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* [github.com/docker/syntax/vim](https://github.com/docker/docker/tree/master/contrib/syntax/vim)
