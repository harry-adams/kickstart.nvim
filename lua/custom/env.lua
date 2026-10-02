-- lua/custom/env.lua
vim.env.PATH = vim.env.PATH .. ':/Users/harryadams/.local/bin'

-- Disable unused remote-host providers.
--
-- `python3` here resolves to a pyenv shim (~400-650ms per spawn) and pynvim is
-- not installed, so nvim's python3 provider probed every candidate interpreter
-- (python3, python3.13, ..., python) on every Python file open and failed each
-- time: ~3.9s of the ~4.1s it took to open a .py buffer. No plugin needs these
-- and ~/.local/share/nvim/rplugin.vim is empty, so turn them all off.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
