# ntask.vim - Work in progress

__Integrates "ntask" with vim, making task-management even more rapid__


### Installation

I would recommend you use [vundle](https://github.com/gmarik/vundle) to install
this plugin.

    λ  echo "Bundle 'hkjels/t.vim'" >> ~/.vimrc
    λ  vim +BundleInstall +qall


### Usage

":T @hkjels pri[1]"
_For more ways of using Ntask with vim, you should have a look at the
documentation of Ntask._


### Magic

Upon saving a buffer, ntask will automatically do an atomic update for that
specific buffer
