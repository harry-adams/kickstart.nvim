```
    __  __                     _          _   ___    ________  ___
   / / / /___ _____________  _( )_____   / | / / |  / /  _/  |/  /
  / /_/ / __ `/ ___/ ___/ / / /// ___/  /  |/ /| | / // // /|_/ / 
 / __  / /_/ / /  / /  / /_/ / (__  )  / /|  / | |/ // // /  / /  
/_/ /_/\__,_/_/  /_/   \__, / /____/  /_/ |_/  |___/___/_/  /_/   
                      /____/                                      
```

A modular, Kickstart-inspired Neovim setup focused on:
- Python and Lua development
- LSP-powered navigation and diagnostics
- Transparent, minimal UI with gruvbox theme
- Lazy-loaded, extendable plugin architecture

---

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP integration via `nvim-lspconfig`, `mason`, `pyright`, `lua_ls`
- Autocompletion with `nvim-cmp`, `LuaSnip`, and LSP sources
- Fuzzy finding with `telescope.nvim`, including test-specific searches
- Visual polish with `gruvbox`, `transparent.nvim`, `lualine`
- Formatting and linting using `conform.nvim` and `nvim-lint` with `ruff`
- Floating previews with `goto-preview`
- Test-aware search: exclude or target test files via keybindings

---

## Screenshot

![Statusline + Floating Preview](https://user-images.githubusercontent.com/91059134/placeholder-statusline-preview.png)

---

## Structure

```bash
~/.config/nvim/
├── init.lua                 # Entry point (minimal)
├── lazy-lock.json           # Plugin lockfile
└── lua
    └── custom
        ├── init.lua         # Loads core modules below
        ├── env.lua          # Environment setup (PATH etc.)
        ├── options.lua      # vim.opt settings
        ├── keymaps.lua      # Keymaps
        ├── autocmds.lua     # Autocommands
        ├── lsp-signs.lua    # Gutter diagnostic symbols
        └── plugins/         # Lazy plugin specs
            ├── cmp.lua
            ├── colorscheme.lua
            ├── formatter.lua
            ├── keybinds.lua
            ├── lint.lua
            ├── lsp.lua
            ├── lsp-nav.lua
            ├── oil.lua
            ├── statusline.lua
            ├── telescope.lua
            └── treesitter.lua
```

---

## Getting Started

```bash
git clone https://github.com/yourusername/nvim ~/.config/nvim
nvim
```

- Run `:Mason` to install LSPs and tools
- Run `:Lazy` to manage plugins

---

## Key Bindings (Highlights)

| Keybinding       | Action                           |
|------------------|----------------------------------|
| `<leader>sg`     | Grep (excluding test files)      |
| `<leader>st`     | Grep only in test files          |
| `<leader>e`      | Open Oil file explorer (float)   |
| `<leader>pd`     | Preview LSP definition (float)   |
| `<leader>ca`     | Code actions (LSP)               |
| `<leader>rn`     | Rename (LSP)                     |
| `gd`, `gr`, `gI` | Go to def/ref/impl (Telescope)   |

---

## Tooling

- Python: `pyright`, `ruff`, `black`, `isort`
- Lua: `lua_ls`, `stylua`
- Format-on-save + lint-on-save enabled

---

## Plugins Managed With Lazy

See full list with `:Lazy`

---

## Status

This config is stable, actively used daily, and modular for easy extension. Ideal for a Python/Lua-focused dev setup.

---

## Inspired By

- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

---

PRs and plugin suggestions welcome!


