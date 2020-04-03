This is my vim configuration. I cleaned it up most of the stuff.

The `vimrc` file should be easy to understand and contains almost everything.

# Install

```
git clone https://github.com/jackonell/vimrc.git .vim
vim +PlugInstall +qall
```
# other tool to be installed:

## ag
```
centos:  yum install the_silver_searcher
ubutun:  apt-get install silversearcher-ag
```

## YouCompleteMe
**如果直接使用vim安装YouCompleteMe不生效,则执行以下指令：**
```
cd ~/.vim/plugged
rm -rf YouCompleteMe
git clone --recursive https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
./install.sh --clang-completer
cp third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
```
在vimrc中添加：
```
let g:ycm_server_python_interpreter='/usr/bin/python'  #注意这里的解释器和运行install.sh时找到的python编译器要一致
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
```

## fzf
ubuntu 16.04下在vim中使用fzf回报错，有两种解决方案：
- 升级内核
- 在tmux中使用

因为担心升级内核会出现别的问题,目前在tmux中使用

This repository is based on [vimrc](https://gitlab.esy.fun/yogsototh/vimrc.git)
