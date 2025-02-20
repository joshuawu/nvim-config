# My Nvim Config

# Installation

1. Make sure that `~/.config/nvim` either does not exist or is empty.
2. Clone this repository there:
```sh
git clone https://github.com/joshuawu/nvim-config.git ~/.config/nvim
```

# Setup

1. If not using WSL, remove the line `require("config.wsl")` from `init.lua`.
2. Run `:Lazy` and verify plugins are installed.
3. Run `:Mason` and install any needed external tools such as:
  - `rust-analyzer`
  - `pyright`
  - `prettierd`
  - `stylua`
4. Install a [Nerd Font](https://www.nerdfonts.com/).
5. (Optional) Add a Python provider.
```sh
mkdir ~/.config/nvim/python
python -m venv ~/.config/nvim/python/venv
source ~/.config/nvim/python/venv/bin/activate
pip install pynvim
deactivate
```
6. (Optional) Add a Node provider.
```sh
npm install -g neovim
```
7. Run `:checkhealth` to see if there are any issues.

# Usage

Type `<Leader>?` (`<Space>?`) in normal mode to view key mappings in Telescope.

(`<Leader>` is mapped to `<Space>` in `init.lua`.)
