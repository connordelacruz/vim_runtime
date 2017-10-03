# Vim Runtime Configuration

Custom runtime configuration for vim.  

## TODO
- Update URLs
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

If you use neovim, run the following script in addition to one of the above:
```
sh ~/.vim_runtime/install/install_nvim.sh
```


## Plugins Setup
Plugins are set up as git submodules in the `bundle/` directory. To initialize submodules and download plugins from their respective repositories:

```
git submodule update --init --recursive
```

For organizational purposes, the plugins in `bundle/` are placed in `colors/`, `plugins/`, and `syntax/` so the root of `bundle/` doesn't get cluttered and it's a little clearer at a glance what each plugin does.  

Additional plugins can be included in the `local/` directory that aren't tracked by git.Like `bundle/`, they can be placed in subdirectories `colors/`, `plugins/`, and `syntax/`, but will still be included if you place them at the root of `local/`.

*Note:* At runtime, pathogen infects `bundle/`, `local/`, and their `colors/`, `plugins/`, and `syntax/` subdirectories. This may add to its overhead. I personally haven't encountered any noticeable impact on performance, but felt it worth mentioning. I'm open to suggestions on a more efficient way of organizing things.

## Updating
Running `update.sh` will pull the latest changes from the repository and update plugin submodules.

## Included Plugins
// TODO: list plugins and link repos

## Included Color Schemes
// TODO: list default color schemes and link base16-vim

## Customization
// TODO: explain my_configs.vim and local/

## Key Mappings
// TODO: go through mappings and document

## Uninstalling
// TODO: rm -rf .vim_runtime/ and restore backed up .vimrc
