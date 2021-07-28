# 梅 💮 mei.nvim
A beautiful color scheme that is written in lua. It works in both vim and neovim.

## Screenshot
With Tree-sitter
![treesitter](treesitter_on.png)

Without Tree-sitter
![treesitter](treesitter_off.png)

## Quick Start
* Vim-plug
```vim
Plug "shoukoo/mei.nvim"
```
* Packer

You can add the following in your `init.lua`.
```lua
require("packer").startup(function()
  use({"shoukoo/mei.nvim", branch="first-commit"})
end)
...
require("shoukoo/mei.nvim")
```
