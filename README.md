# Vim Runtime Configuration

My runtime configuration for vim (and neovim).  

I wanted a vimrc setup with some sensible defaults and a plugin setup that was reasonably easy to organize and keep up-to-date. I also wanted to make it relatively easy to have plugins and configurations on a per-machine basis.

I started this out using Amir Salihefendic's [ultimate vimrc](https://github.com/amix/vimrc), which I highly recommend checking out. The configurations, plugins, and organization has changed, but it's still heavily based on his project.

## TODO

- Directory structure
- Overview of configurations  

## Included Plugins

- [vim-commentary](https//github.com/tpope/vim-commentary)
- [vim-gitgutter](https//github.com/airblade/vim-gitgutter)
- [lightline.vim](https//github.com/itchyny/lightline.vim)
- [vim-multiple-cursors](https//github.com/terryma/vim-multiple-cursors)
- [nerdtree](https//github.com/scrooloose/nerdtree)
- [vim-surround](https//github.com/tpope/vim-surround)
- [vim-fugitive](https//github.com/tpope/vim-fugitive.git)
- [vim-visual-increment](https//github.com/triglav/vim-visual-increment.git)

## Included Syntaxes

- [vim-javascript](https://github.com/pangloss/vim-javascript)
- [vim-log-syntax](https://github.com/dzeban/vim-log-syntax)
- [vim-markdown](https://github.com/tpope/vim-markdown)

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

**Note:** `vimrcs/extended.vim` checks if you're using neovim and have the environment variable `COLORTERM` set to `truecolor` when determining what color scheme to use. As there is [no reliable means of detecting true color support](https://gist.github.com/XVilka/8346728#detection), I have my bashrc set up to set `COLORTERM` to `truecolor` for various terminal emulators known to support true color. [See the section for platform-specific color prompt configs for an example](https://github.com/connordelacruz/bash_config/blob/master/globalrc.d/bashrc.sh)

lightline colorschemes:

- An [oceanic-next](https://github.com/mhartington/oceanic-next) scheme to match the base16 scheme listed above

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

## Directory Structure

```
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
```


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

## Customization

### Adding Configurations
Configurations can be added and overwritten by putting them in `~/.vim_runtime/my_configs.vim`.

### Adding Plugins
Additional plugins can be installed in `local/`. Like `bundle/`, they can be placed in subdirectories `colors/`, `plugins/`, and `syntax/`, but will still be included if you place them at the root of `local/`.

## Key Mappings

// TODO: go through mappings and document

`<leader>` is mapped to `,`

### Normal mode

`*` and `#` search for the word under the cursor

### Visual mode

`*` and `#` search for the current selection

## Uninstalling

To uninstall:

- `rm -rf ~/.vim_runtime` to remove files
- (Optional) Restore the backup of `~/.vimrc` created by the install script (`~/.vimrc.bak.<timestamp>`)
- Remove lines in your `~/.vimrc` referencing these files (if applicable)

If you installed for neovim, you'll also need to:

- (Optional) restore backup of `~/.config/nvim/init.vim` (`~/.config/nvim/init.vim.bak.<timestamp>`)
- Remove lines in `~/.config/nvim/init.vim` referencing these files (if applicable)
