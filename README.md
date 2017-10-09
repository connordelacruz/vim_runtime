# Vim Runtime Configuration

Custom runtime configuration for vim.  

## TODO
- Add instructions for adding new plugins as submodules (and set ignore = dirty)
- Add link Amir's original repo (it's a great project and I want to be sure to give him credit)

## Installation

### Basic Version
To install just the basic version, you can just copy the contents of `vimrcs/basic.vim` into your `~/.vimrc`.

### Extended Version
The extended version includes the configurations from the basic version as well as some plugins and additional configurations. To install:  

1. Clone repo as `~/.vim_runtime`:

    ```
    git clone https://connordelacruz@bitbucket.org/connordelacruz/vim_runtime.git ~/.vim_runtime
    ```

2. Run the install script:

    ```
    sh ~/.vim_runtime/install/install_extended.sh
    ```

3. Initialize submodules to install plugins:

    ```
    cd ~/.vim_runtime
    git submodule update --init --recursive
    ```


If you use [neovim](https://neovim.io/), run the following script in addition to one of the above:

```
sh ~/.vim_runtime/install/install_nvim.sh
```

The install scripts first check for existing config files and create a backup before overwriting them. A unix timestamp is appended to their name so other backups aren't overwritten.  

- `~/.vimrc.bak.<timestamp>` for `.vimrc`
- `~/.config/nvim/init.vim.bak.<timestamp>` for neovim configs (if applicable)

## Plugins Setup
Plugins are set up as git submodules in the `bundle/` directory. To initialize submodules and download plugins from their respective repositories:

```
git submodule update --init --recursive
```

For organizational purposes, the plugins in `bundle/` are placed in `colors/`, `plugins/`, and `syntax/` so the root of `bundle/` doesn't get cluttered and it's a little clearer at a glance what each plugin does.  

Additional plugins can be included in the `local/` directory that aren't tracked by git. Like `bundle/`, they can be placed in subdirectories `colors/`, `plugins/`, and `syntax/`, but will still be included if you place them at the root of `local/`.

*Note:* At runtime, pathogen infects `bundle/`, `local/`, and their `colors/`, `plugins/`, and `syntax/` subdirectories. This may add to its overhead. I personally haven't encountered any noticeable impact on performance, but felt it worth mentioning. I'm open to suggestions on a more efficient way of organizing things.

## Updating
Running `update.sh` will pull the latest changes from the repository and update plugin submodules.

## Included Color Schemes
vim colorschemes:

- [onedark](https://github.com/joshdick/onedark.vim) (default for non-truecolor terminals)
- A selection of [base16](https://github.com/chriskempson/base16-vim) color schemes:  
    - oceanicnext (default for nvim on truecolor terminals)
    - eighties
    - materia
    - monokai
    - solar-flare
    - solarized-dark

lightline colorschemes:

- An [oceanic-next](https://github.com/mhartington/oceanic-next) scheme to match the base16 scheme listed above

## Included Plugins
// TODO: descriptions

- [vim-commentary](https://github.com/tpope/vim-commentary):
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter):
- [lightline.vim](https://github.com/itchyny/lightline.vim):
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors):
- [nerdtree](https://github.com/scrooloose/nerdtree):
- [vim-surround](https://github.com/tpope/vim-surround):

## Included Syntaxes
- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-log-syntax](https://github.com/dzeban/vim-log-syntax)
- [vim-markdown](https://github.com/tpope/vim-markdown)

## Customization

### Adding Configurations
Configurations can be added and overwritten by putting them in `~/.vim_runtime/my_configs.vim`. 

### Adding Plugins
Additional plugins can be installed in `local/`. Like `bundle/`, they can be placed in subdirectories `colors/`, `plugins/`, and `syntax/`, but will still be included if you place them at the root of `local/`.

## Key Mappings
// TODO: go through mappings and document

## Uninstalling
To uninstall:
- `rm -rf ~/.vim_runtime` to remove files
- (Optional) Restore the backup of `~/.vimrc` created by the install script (`~/.vimrc.bak.<timestamp>`)
- Remove lines in your `~/.vimrc` referencing these files (if applicable)

If you installed for neovim, you'll also need to:
- (Optional) restore backup of `~/.config/nvim/init.vim` (`~/.config/nvim/init.vim.bak.<timestamp>`)
- Remove lines in `~/.config/nvim/init.vim` referencing these files (if applicable)

