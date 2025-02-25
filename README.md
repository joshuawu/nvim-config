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
- `<F2>`: Rename symbol under cursor
- `<F7>`: Go to previous error in quickfix list
- `<F8>`: Go to next error in quickfix list
- `<Leader>,`: Edit custom keymaps
- `<Leader>/`: Show all keymaps for this buffer
- `<Leader><Leader>`: Find files
- `<Leader>?`: Show all keymaps
- `<Leader>Q`: Save session and force-quit with `:qall`
- `<Leader>]`: Go to source definition of symbol under cursor (js/jsx/ts/tsx only)
- `<Leader>b`: Git blame
- `<Leader>f`: Live grep
- `<Leader>h`: Find help
- `<Leader>p`: Show all pickers
- `<Leader>q`: Save session and quit with `:qall!`
- `<Leader>r`: Find references to symbol under cursor
- `<Leader>t`: Toggle file explorer
- `<Leader>v`: Open git interface
- ``<Leader>`​``: Open terminal

### Insert Mode
- `jj`: Switch to normal mode

### Visual Mode
- `<C-/>`: Comment/Uncomment selected line(s)

### Terminal Mode
- `<Esc>`: Switch to normal mode
- `jj`: Switch to normal mode

## Autocomplete
See `autocomplete.lua` for keymaps.

## Git (Fugit2)
See [wiki](https://github.com/SuperBo/fugit2.nvim/wiki/%E2%8C%A8%EF%B8%8F-Usage-and-Keymap) for keymaps.
(As of 2025-02-21 there is no `help` for `fugit2` keymaps.)

## Diagnostics
See `diagnostics.lua` for keymaps.
