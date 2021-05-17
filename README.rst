=========================
Vim Runtime Configuration
=========================

My runtime configuration for vim/neovim.

.. contents::


Installation
============

To install, clone the repo into ``~/.vim_runtime`` and run the install script:

::

    git clone https://github.com/connordelacruz/vim_runtime.git ~/.vim_runtime
    ~/.vim_runtime/install/install.sh

This will create a backup of your existing ``.vimrc``. See `Restore Old
Configurations`_ for more details.

Using With Neovim
-----------------

If you use `neovim <https://neovim.io/>`__, you'll need to run the following
script after installing:

::

   ~/.vim_runtime/install/install_nvim.sh


Restore Old Configurations
==========================

The install scripts listed above first check for existing config files and
create a backup before overwriting them. A unix timestamp is appended to their
name so other backups aren’t overwritten. You can restore these by simply
copying the backup to the original file.

**Backup Files:**

-  ``~/.vimrc.bak.<timestamp>`` for ``.vimrc``
-  ``~/.config/nvim/init.vim.bak.<timestamp>`` for neovim configs


Customization
=============

Local configs and plugins can be specificed to customize your local setup. These
are not tracked by git, so you can modify things without creating conflicts.

Adding Configurations
---------------------

Configurations can be added and overwritten by putting them in
``~/.vim_runtime/local_configs.vim``.

Adding Plugins
--------------

This setup uses `vim-plug <https://github.com/junegunn/vim-plug>`_ to manage
plugins. You can add additional plugins in ``~/.vim_runtime/local_plug.vim`` and
install by running ``:PlugInstall``.

