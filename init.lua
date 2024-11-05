-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end
-- my keymaps
-- Remap jj or jk to escape insert mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Define a Lua function to remove comments
local function remove_python_comments()
  -- Remove single-line comments
  vim.cmd [[%s/^\s*#.*//g]]
  -- Remove multi-line comments with '''
  vim.cmd [[silent! %s/\v(''')[\s\S]+%1//g]]
  -- Remove multi-line comments with """
  vim.cmd [[silent! %s/\v(""")[\s\S]+%1//g]]
end
-- Map the function to a key combination in normal mode
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua remove_python_comments()<CR>", { noremap = true, silent = true })
-- inoremap
vim.api.nvim_set_keymap(
  "i",
  "<C-j> <C-\\> <C-n>",
  ":call search('[>)]}\"'']', 'W')<C-s>a",
  { noremap = true, silent = true }
)
require "lazy_setup"
require "polish"
