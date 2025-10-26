-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<Tab>", "%", { desc = "Toggle move cursor to start/end of {}" })

vim.keymap.set("n", "<F10>", function()
  vim.cmd("w") -- Save file
  vim.cmd("!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < input.txt")
end, { noremap = true, silent = true, desc = "C++ compile/run with sanitizer" })
