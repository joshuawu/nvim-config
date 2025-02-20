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
  - `rust-analyzer`
  - `pyright`
  - `prettierd`
  - `stylua`
3. Install a [Nerd Font](https://www.nerdfonts.com/).
4. (Optional) Add a Python provider.
```sh
mkdir ~/.config/nvim/python
python -m venv ~/.config/nvim/python/venv
source ~/.config/nvim/python/venv/bin/activate # pick the script for your shell
pip install pynvim
deactivate
```
5. (Optional) Add a Node provider.
```sh
npm install -g neovim
```
6. Run `:checkhealth` to see if there are any issues.

# Usage

Type `<Leader>?` (`<Space>?`) in normal mode to view key mappings in Telescope.

(`<Leader>` is mapped to `<Space>` in `init.lua`.)
