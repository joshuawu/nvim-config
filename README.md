# My Nvim Config

# Installation

1. Make sure that `~/.config/nvim` either does not exist or is empty.
2. Clone this repository there:
```sh
git clone https://github.com/joshuawu/nvim-config.git ~/.config/nvim
```

# Setup

1. Launch `nvim`. `lazy.nvim` will automatically install plugins.
2. Run `:Mason` and install any needed external tools such as:
  - `json-lsp`
  - `lua-language-server`
  - `prettierd`
  - `pyright`
  - `rust-analyzer`
  - `stylua`
3. Install `libgit2` with your package manager.
4. Install a [Nerd Font](https://www.nerdfonts.com/) and use it in your terminal.
5. (Optional) Add a Python provider.
```sh
mkdir ~/.config/nvim/python
python -m venv ~/.config/nvim/python/venv
source ~/.config/nvim/python/venv/bin/activate # pick the script for your shell
pip install pynvim
deactivate
```
6. (Optional) Add a Node provider.
```sh
npm install -g neovim
```
7. Run `:checkhealth` to see if there are any issues.

# Usage

## User Keymaps
`<Leader>` is mapped to `<Space>` in `init.lua`.

### Normal Mode
- `<C-/>`: Comment/Uncomment line
- `<F2>`: rename symbol under cursor
- `<F7>`: go to previous error in quickfix list
- `<F8>`: go to next error in quickfix list
- `<Leader>,`: edit custom keymaps
- `<Leader><Leader>`: find files
- `<Leader>?`: browse custom keymaps
- `<Leader>]`: go to source definition of symbol under cursor (js/jsx/ts/tsx only)
- `<Leader>b`: git blame
- `<Leader>f`: live grep
- `<Leader>h`: find help
- `<Leader>p`: browse Telescope builtins
- `<Leader>Q`: save session and force-quit with `:qall`
- `<Leader>q`: save session and quit with `:qall!`
- `<Leader>r`: find references to symbol under cursor
- `<Leader>t`: toggle file explorer
- `<Leader>v`: open git interface
- ``<Leader>`​``: open terminal

### Insert Mode
- `jj`: switch to normal mode

### Visual Mode
- `<C-/>`: Comment/Uncomment selected line(s)

### Terminal Mode
- `<Esc>`: switch to normal mode
- `jj`: switch to normal mode

## Telescope
In addition to the default keymaps, use `CTRL-J`/`CTRL-K` to select the next/previous item.

## Autocomplete
See `autocomplete.lua` for keymaps.

## Git (Fugit2)
See [wiki](https://github.com/SuperBo/fugit2.nvim/wiki/%E2%8C%A8%EF%B8%8F-Usage-and-Keymap) for keymaps.
(As of 2025-02-21 there is no `help` for `fugit2` keymaps.)

## Diagnostics
See `diagnostics.lua` for keymaps.
