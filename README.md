This is my vim configuration. I cleaned it up most of the stuff.

The `vimrc` file should be easy to understand and contains almost everything.

# Install

        git clone https://github.com/jackonell/vimrc.git .vim
        ln -s .vim/vimrc .vimrc
        vim +PlugInstall +qall
        cd ~/.vim/plugged/vimproc.vim && make

And you're done.

This repository is based on [vimrc](https://gitlab.esy.fun/yogsototh/vimrc.git)
