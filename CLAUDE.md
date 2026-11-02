# Neovim Configuration

## Overview
LazyVim-based Neovim configuration for Neovim 0.11+. Uses lazy.nvim for plugin management.

## Structure
- `init.lua` — Entry point, bootstraps lazy.nvim via `config.lazy`
- `lua/config/lazy.lua` — lazy.nvim setup, plugin spec imports, LazyVim extras
- `lua/config/options.lua` — Vim options (leader, encoding, indentation, etc.)
- `lua/config/keymaps.lua` — Custom keymaps (splits, navigation, quickfix, clipboard)
- `lua/config/autocmds.lua` — Autocommands (currently empty, LazyVim defaults apply)
- `lua/plugins/` — Plugin specs organized by category:
  - `arduino.lua` — arduino-language-server (system pkg), arduino/c/cpp treesitter, `<leader>a*` compile/upload/monitor via arduino-cli
  - `colorscheme.lua` — tokyonight (active), gruvbox/sonokai/nord (commented out)
  - `editor.lua` — Telescope + file browser + fzf-native, mini.hipatterns
  - `integrations.lua` — rest.nvim for HTTP requests
  - `lsp.lua` — Mason, nvim-lspconfig (TS, CSS, Tailwind, Lua, C, Python), completion
  - `refactoring.lua` — inc-rename, ThePrimeagen/refactoring
  - `testing.lua` — neotest with jest + plenary adapters
  - `treesitter.lua` — Treesitter with JS/TS/CSS/SQL/Lua/Vim parsers
  - `ui.lua` — bufferline, incline, noice, notify, lazygit, dadbod, nvim-tree

## Key Conventions
- Leader key: Space
- Plugin specs use LazyVim's `opts` merging pattern (opts function receives parent opts)
- Keymaps: `;` prefix for telescope/test operations, `s` prefix for splits/navigation
- Tab/S-Tab for buffer cycling via bufferline
- Lualine and dashboard are disabled; minimal UI with `cmdheight=0`, `laststatus=0`

## Important Notes
- This config uses LazyVim as a base — many settings come from LazyVim defaults
- Both nvim-tree and neo-tree (from LazyVim) are present — potential conflict
- Completion: blink.cmp (LazyVim default) and nvim-cmp both in lock file
- Windsurf/Codeium plugin provides AI completion with `<C-g>` accept binding
- External tools expected: tmux (tmux-sessionizer), jq, tidy, lazygit
- Arduino: `arduino-cli`, `arduino-language-server`, `avr-gcc`, `avr-libc`, `avrdude` from pacman; `arduino:avr` core installed; user in `uucp` group for serial. Board via `vim.g.arduino_fqbn` (default arduino:avr:uno). Libraries in `~/Arduino/libraries`. Neovim 0.12: restart LSP with `:lsp restart` (no `:LspRestart`)

## When Editing This Config
- Plugin specs in `lua/plugins/` are auto-imported by lazy.nvim
- Test changes with `nvim --startuptime /tmp/startup.log` to catch regressions
- LazyVim extras are imported in `lazy.lua` (not managed via lazyvim.json)
- Use `:checkhealth` after changes to verify plugin/LSP/treesitter health
