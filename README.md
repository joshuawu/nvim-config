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
- `<Leader>` is mapped to `<Space>` in `init.lua`.
- `<M-` is the Meta or Alt modifier key.
  - On OSX, the Option key can be used. This config will automatically enable using Option as Meta until you exit `nvim`.
    - If it doesn't work, enable DECSET 1036 support for your terminal.
      - In iTerm2, this can be enabled under `Settings > Advanced`. (Beta builds of iTerm2 should have this already enabled.)
        - Make sure "Apps can change this" is checked under your profile's `Keys > General` settings.
    - If your terminal doesn't support DECSET 1036, enable using Option as Meta globally in your terminal settings.

### All Modes
- `<M-/>`: Show keymaps for this buffer
- `<M-\>`: Show keymaps

### Normal Mode
- `<C-/>`: Comment/Uncomment line
- `<C-S>`: Save changes
- `<F2>`: Rename symbol under cursor
- `<F7>`: Go to previous error in quickfix list
- `<F8>`: Go to next error in quickfix list
- `<Leader>,`: Edit custom keymaps
- `<Leader><Leader>`: Find files
- `<Leader>]`: Go to type definition of symbol under cursor
- `<Leader>}`: Go to source definition of symbol under cursor (js/jsx/ts/tsx only)
- `<Leader>a`: Show code actions
- `<Leader>b`: Git blame
- `<Leader>d`: Toggle word diff
- `<Leader>f`: Live grep
- `<Leader>h`: Find help
- `<Leader>p`: Show pickers
- `<Leader>Q`: Save session and force-quit with `:qall!`
- `<Leader>q`: Save session and quit with `:qall`
- `<Leader>r`: Find references to symbol under cursor
- `<Leader>t`: Toggle file explorer
- `<Leader>v`: Open git interface
- ``<Leader>`​``: Open terminal
- `v`: Select node under cursor

### Insert Mode
- `jj`: Switch to Normal mode

### Visual Mode
- `<C-/>`: Comment/Uncomment selected line(s)
- `<Leader>a`: Show code actions
- `J`: Expand selection to parent node
- `K`: Contract selection to previous node
- `L`: Expand selection to current scope or parent node

### Terminal Mode
- `<Esc>`: Switch to Normal mode
- `jj`: Switch to Normal mode

## Autocomplete
See `autocomplete.lua` for keymaps.

## Git (Fugit2)
See [wiki](https://github.com/SuperBo/fugit2.nvim/wiki/%E2%8C%A8%EF%B8%8F-Usage-and-Keymap) for keymaps.
(As of 2025-02-21 there is no `help` for `fugit2` keymaps.)

## Diagnostics
See `diagnostics.lua` for keymaps.
