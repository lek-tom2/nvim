# Neovim Keybinds Cheatsheet

Leader key: **Space**

## General

| Key | Action | Example |
|-----|--------|---------|
| `<Space>w` | Save file | Save current buffer |
| `<Space>q` | Quit window | Close current split |
| `<Space>Q` | Quit all | Exit nvim entirely |
| `Q` | Quit all (confirm) | Prompts before closing |
| `<C-a>` | Select all | Select entire file for copy/delete |
| `x` | Delete char (no yank) | Delete character without polluting register |

## File Explorer (NvimTree)

| Key | Action | Example |
|-----|--------|---------|
| `<Space>e` | Find current file in tree | Opens tree and highlights current file |
| `<Space>E` | Toggle file tree | Show/hide the sidebar |
| `t` (in tree) | Open in new tab | Open selected file in a new tab |

## Telescope (Search)

| Key | Action | Example |
|-----|--------|---------|
| `;f` | Find files | Search project files (respects .gitignore) |
| `;r` | Live grep | Search file contents across project |
| `\\` | List buffers | Switch between open buffers |
| `;;` | Resume last picker | Re-open previous Telescope results |
| `;e` | Diagnostics | List all LSP errors/warnings |
| `;s` | Treesitter symbols | Browse functions, variables, types |
| `sf` | File browser | Browse files from current file's directory |

### Inside Telescope File Browser (normal mode)

| Key | Action |
|-----|--------|
| `N` | Create new file |
| `h` | Go to parent directory |
| `<C-u>` | Scroll up 10 items |
| `<C-d>` | Scroll down 10 items |

## Splits & Windows

| Key | Action | Example |
|-----|--------|---------|
| `ss` | Horizontal split | Split current file horizontally |
| `sv` | Vertical split | Split current file vertically |
| `sh` | Move to left window | Focus left split |
| `sj` | Move to bottom window | Focus bottom split |
| `sk` | Move to top window | Focus top split |
| `sl` | Move to right window | Focus right split |
| `<C-S-h>` | Shrink width | Make window narrower |
| `<C-S-l>` | Grow width | Make window wider |
| `<C-S-k>` | Grow height | Make window taller |
| `<C-S-j>` | Shrink height | Make window shorter |

## Tabs & Buffers

| Key | Action | Example |
|-----|--------|---------|
| `<Tab>` | Next tab | Cycle to next buffer tab |
| `<S-Tab>` | Previous tab | Cycle to previous buffer tab |
| `te` | New tab | `:tabedit` then type filename |
| `tw` | Close tab | Close current tab |

## Editing & Movement

| Key | Mode | Action | Example |
|-----|------|--------|---------|
| `J` / `<C-Down>` | Visual | Move selection down | Select lines, press `J` to shift them down |
| `K` / `<C-Up>` | Visual | Move selection up | Select lines, press `K` to shift them up |
| `J` | Normal | Join line (cursor stays) | Append next line, cursor doesn't jump |
| `<C-d>` | Normal | Half-page down (centered) | Scroll down, view stays centered |
| `<C-u>` | Normal | Half-page up (centered) | Scroll up, view stays centered |
| `n` / `N` | Normal | Next/prev search (centered) | After `/search`, results stay centered |
| `+` | Normal | Increment number | Cursor on `5`, press `+` -> `6` |
| `-` | Normal | Decrement number | Cursor on `5`, press `-` -> `4` |

## Clipboard & Registers

| Key | Mode | Action | Example |
|-----|------|--------|---------|
| `<Space>y` | Normal/Visual | Yank to system clipboard | `<Space>y` then motion, e.g. `<Space>yy` for line |
| `<Space>Y` | Normal | Yank line to system clipboard | Copy full line to OS clipboard |
| `<Space>p` | Visual | Paste without overwriting register | Select text, paste over it without losing clipboard |
| `<Space>x` | Normal/Visual | Delete to black hole | Delete without affecting yank register |

## Search & Replace

| Key | Action | Example |
|-----|--------|---------|
| `<Space>s` | Replace word under cursor | Cursor on `foo` -> opens `:%s/foo/foo/gI` ready to edit |

## Quickfix & Location List

| Key | Action | Example |
|-----|--------|---------|
| `]q` / `<C-Down>` | Next quickfix item | Jump to next error/result |
| `[q` / `<C-Up>` | Previous quickfix item | Jump to previous error/result |
| `<Space>k` | Next location list item | Jump to next local diagnostic |
| `<Space>j` | Previous location list item | Jump to previous local diagnostic |

## Diagnostics (LSP)

| Key | Action | Example |
|-----|--------|---------|
| `]d` | Go to next diagnostic | Jump to next LSP error/warning |

## Testing (Neotest)

| Key | Action | Example |
|-----|--------|---------|
| `;tt` | Run current file's tests | Run all tests in `user.test.ts` |
| `;tr` | Run nearest test | Cursor inside `it("works")`, runs just that test |
| `;tT` | Run all tests in project | Run entire test suite |
| `;tl` | Re-run last test | Quick re-run after a fix |
| `;ts` | Toggle test summary | Show/hide test results panel |
| `;to` | Show test output | View output of last test run |
| `;tO` | Toggle output panel | Persistent output panel |
| `;tS` | Stop running tests | Cancel in-progress test run |

## Git (LazyGit)

| Key | Action | Example |
|-----|--------|---------|
| `;c` | Open LazyGit | Full git TUI inside nvim |

## REST Client

| Key | Action | Example |
|-----|--------|---------|
| `<Space>rr` | Run HTTP request | In `.http` file, run request under cursor |
| `<Space>rl` | Re-run last request | Repeat previous HTTP request |

## Database (Dadbod)

| Key | Action | Example |
|-----|--------|---------|
| `<Space>D` | Open DB UI | Opens database interface in new tab |

## Claude Code

| Key | Mode | Action |
|-----|------|--------|
| `<Space>ac` | Normal | Toggle Claude Code terminal |
| `<Space>as` | Visual | Send selection to Claude |

## Tmux Integration

| Key | Action | Example |
|-----|--------|---------|
| `<C-f>` | Open tmux-sessionizer | Quick-switch tmux sessions |

## Workflow Examples

### Find and replace a variable name across a file
1. Place cursor on the variable name
2. Press `<Space>s` to open substitution command
3. Edit the replacement text and press Enter

### Run a specific test after editing
1. Edit your test file
2. Place cursor inside the test you changed
3. Press `;tr` to run just that test
4. Press `;to` to see detailed output if it fails
5. After fixing, press `;tl` to re-run it

### Search project for a string and navigate results
1. Press `;r` to open live grep
2. Type your search term
3. Select a result to jump to it
4. Press `;;` to re-open the results if needed

### Move a block of code up or down
1. Select lines with `V` (visual line mode)
2. Press `J` to move selection down or `K` to move up
3. Lines are automatically re-indented

### Copy text to system clipboard for pasting elsewhere
1. In normal mode: `<Space>y` + motion (e.g., `<Space>yap` for paragraph)
2. In visual mode: select text, press `<Space>y`
3. Paste anywhere with Ctrl+V / Cmd+V
