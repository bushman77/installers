#!/bin/bash
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle && git clone https://github.com/wkentaro/conque.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
echo "colorscheme desert" >> ~/.vimrc
echo "execute pathogen#infect()" >> ~/.vimrc
echo "<C-n> :NERDTreeToggle<CR>" >> ~/.vimrc
