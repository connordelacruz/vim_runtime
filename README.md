# Vim Runtime Configuration

Custom runtime configuration for vim.  

## TODO
- Update URLs
- Update installation instructions
- Add instructions for adding new plugins as submodules (and set ignore = dirty)
- Add link Amir's original repo (it's a great project and I want to be sure to give him credit)

## Installation
// TODO

## Plugins Setup
Plugins are set up as git submodules in the `bundle` directory. To initialize submodules and download plugins from their respective repositories:

```
git submodule update --init --recursive
```

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
