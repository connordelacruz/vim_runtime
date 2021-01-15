Vim Runtime Configuration
=========================

.. note::

    This README is (very) out of date as of 2021. Plugins are now managed with
    vim-plug and the directory structure, included configs, etc have changed a
    lot. I'll work on updating this when I get around to it, sorry!


My runtime configuration for vim (and neovim).

I wanted a vimrc setup with some sensible defaults and a plugin setup
that was reasonably easy to organize and keep up-to-date. I also wanted
to make it relatively easy to have plugins and configurations on a
per-machine basis.

I started this out using Amir Salihefendic’s `ultimate
vimrc <https://github.com/amix/vimrc>`__, which I highly recommend
checking out. The configurations, plugins, and organization has changed,
but it’s still heavily based on his project.


.. contents::


Installation
------------

Basic Version
~~~~~~~~~~~~~

To install just the basic version, run:

::

    git clone https://github.com/connordelacruz/vim_runtime.git ~/.vim_runtime
    ~/.vim_runtime/install/install_basic.sh

Alternatively, you can just copy the contents of ``vimrcs/basic.vim`` into your
``~/.vimrc``.

Extended Version
~~~~~~~~~~~~~~~~

The extended version includes the configurations from the basic version
as well as some plugins and additional configurations. To install the extended
version, run:

::

    git clone https://github.com/connordelacruz/vim_runtime.git ~/.vim_runtime
    ~/.vim_runtime/install/install_extended.sh

Using With Neovim
~~~~~~~~~~~~~~~~~

If you use `neovim <https://neovim.io/>`__, you'll need to run the following
script after installing either version:

::

   ~/.vim_runtime/install/install_nvim.sh


Updating
--------

Running ``update.sh`` will pull the latest changes from the repository
and initialize/update plugin submodules.

Running ``update_plugins.sh`` will go through each of the submodules and
pull from each of their remotes. The changes will need to be staged and
committed after updating submodules.


Restore Old Configurations
--------------------------

The install scripts listed above first check for existing config files and
create a backup before overwriting them. A unix timestamp is appended to their
name so other backups aren’t overwritten.

Backup Files
~~~~~~~~~~~~

-  ``~/.vimrc.bak.<timestamp>`` for ``.vimrc``
-  ``~/.config/nvim/init.vim.bak.<timestamp>`` for neovim configs (if
   applicable)


Included Plugins
----------------

-  `vim-abolish <https://github.com/tpope/vim-abolish>`__
-  `CamelCaseMotion <https://github.com/bkad/CamelCaseMotion>`__
-  `vim-closetag <https://github.com/alvan/vim-closetag>`__
-  `Colorizer <https://github.com/chrisbra/Colorizer>`__
-  `vim-commentary <https://github.com/tpope/vim-commentary>`__
-  `vim-fugitive <https://github.com/tpope/vim-fugitive.git>`__
-  `vim-gitgutter <https://github.com/airblade/vim-gitgutter>`__
-  `lightline.vim <https://github.com/itchyny/lightline.vim>`__
-  `vim-markdown-toc <https://github.com/mzlogin/vim-markdown-toc.git>`__
-  `vim-multiple-cursors <https://github.com/terryma/vim-multiple-cursors>`__
-  `nerdtree <https://github.com/scrooloose/nerdtree>`__
-  `vim-python-pep8-indent <https://github.com/Vimjas/vim-python-pep8-indent>`__
-  `vim-pydocstring <https://github.com/heavenshell/vim-pydocstring>`__
-  `vim-surround <https://github.com/tpope/vim-surround>`__
-  `vim-table-mode <https://github.com/dhruvasagar/vim-table-mode>`__
-  `vim-visual-increment <https://github.com/triglav/vim-visual-increment.git>`__

Included Syntaxes
-----------------

-  `vim-javascript <https://github.com/pangloss/vim-javascript>`__
-  `vim-log-syntax <https://github.com/dzeban/vim-log-syntax>`__
-  `vim-css-color <https://github.com/ap/vim-css-color>`__

Included Color Schemes
----------------------

vim colorschemes:

-  `onedark <https://github.com/joshdick/onedark.vim>`__ (default for
   non-truecolor terminals)
-  A selection of
   `base16 <https://github.com/chriskempson/base16-vim>`__ color
   schemes:

   -  oceanicnext (default for nvim on truecolor terminals)
   -  eighties
   -  materia
   -  material
   -  material-darker
   -  monokai
   -  solar-flare
   -  solarized-dark
   -  solarized-light

**Note:** ``vimrcs/extended.vim`` checks if you’re using neovim and have
the environment variable ``COLORTERM`` set to ``truecolor`` when
determining what color scheme to use. As there is `no reliable means of
detecting true color
support <https://gist.github.com/XVilka/8346728#detection>`__, I have my
bashrc set up to set ``COLORTERM`` to ``truecolor`` for various terminal
emulators known to support true color. `See the section for
platform-specific color prompt configs for an
example <https://github.com/connordelacruz/bash_config/blob/master/globalrc.d/bashrc.sh>`__

lightline colorschemes:

- A modified `oceanic-next <https://github.com/mhartington/oceanic-next>`__
  scheme to match the base16 scheme listed above
   

Directory Structure
-------------------

::

   .vim_runtime
   ├── autoload
   ├── bundle
   │   ├── colors
   │   ├── plugin
   │   └── syntax
   ├── install
   ├── local
   │   ├── colors
   │   ├── plugin
   │   └── syntax
   ├── temp_dirs
   │   └── undodir
   └── vimrcs


Plugins Setup
-------------

Plugins are set up as git submodules in the ``bundle/`` directory. Plugins are
initialized in ``install/install_extended.sh``. To manually initialize
submodules and download plugins from their respective repositories:

::

   git submodule update --init --recursive

For organizational purposes, the plugins in ``bundle/`` are placed in
``colors/``, ``plugins/``, and ``syntax/`` so the root of ``bundle/``
doesn’t get cluttered and it’s a little clearer at a glance what each
plugin does.

Additional plugins can be included in the ``local/`` directory that
aren’t tracked by git. Like ``bundle/``, they can be placed in
subdirectories ``colors/``, ``plugins/``, and ``syntax/``, but will
still be included if you place them at the root of ``local/``.

*Note:* At runtime, pathogen infects ``bundle/``, ``local/``, and their
``colors/``, ``plugins/``, and ``syntax/`` subdirectories. This may add
to its overhead. I personally haven’t encountered any noticeable impact
on performance, but felt it worth mentioning. I’m open to suggestions on
a more efficient way of organizing things.


Customization
-------------

Adding Configurations
~~~~~~~~~~~~~~~~~~~~~

Configurations can be added and overwritten by putting them in
``~/.vim_runtime/my_configs.vim``.

Adding Plugins
~~~~~~~~~~~~~~

Additional plugins can be installed in ``local/``. Like ``bundle/``,
they can be placed in subdirectories ``colors/``, ``plugins/``, and
``syntax/``, but will still be included if you place them at the root of
``local/``.


Key Mappings
------------

// TODO: go through mappings and document

``<leader>`` is mapped to ``,``

Normal mode
~~~~~~~~~~~

``*`` and ``#`` search for the word under the cursor

Visual mode
~~~~~~~~~~~

``*`` and ``#`` search for the current selection


Uninstalling
------------

To uninstall:

-  ``rm -rf ~/.vim_runtime`` to remove files
-  (Optional) Restore the backup of ``~/.vimrc`` created by the install
   script (``~/.vimrc.bak.<timestamp>``)
-  Remove lines in your ``~/.vimrc`` referencing these files (if
   applicable)

If you installed for neovim, you’ll also need to:

-  (Optional) restore backup of ``~/.config/nvim/init.vim``
   (``~/.config/nvim/init.vim.bak.<timestamp>``)
-  Remove lines in ``~/.config/nvim/init.vim`` referencing these files
   (if applicable)

