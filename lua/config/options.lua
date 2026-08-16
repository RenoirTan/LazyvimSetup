-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = false
vim.o.conceallevel = 0

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pylsp"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- LSP Server to use for TypeScript.
---@type "vtsls" | "tsgo"
vim.g.lazyvim_ts_lsp = "tsgo" -- currently the default
-- To use the newer, much faster `tsgo` LSP server, either:
-- * enable the `tsgo` extra, or
-- * set `vim.g.lazyvim_ts_lsp = "tsgo"` in your `options.lua`
