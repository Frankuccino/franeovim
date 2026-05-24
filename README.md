# Franeovim

My personal Neovim configuration, built for **Rust systems programming**, **distributed microservices development**, and **AI-augmented coding workflows**.

## 🛠 Tech Stack & Architecture
- **Language:** Neovim (Lua)
- **Plugin Management:** Manual package management (no `lazy.nvim`)
- **Philosophy:** Modular, high-density, and AI-native.

## 📦 Plugin Inventory
| Plugin File | Purpose |
| :--- | :--- |
| `code.lua` | Treesitter, syntax highlighting, and general editing utilities. |
| `conform.lua` | Lightweight, opinionated code formatting. |
| `file-explorer.lua` | Project file navigation and hierarchy management. |
| `git.lua` | Git integration, gutter signs, and status tracking. |
| `lsp.lua` | Core Language Server Protocol configuration. |
| `navigation.lua` | Fuzzy finding and deep project traversal (Telescope). |
| `rustaceanvim.lua` | Specialized Rust ecosystem integration. |
| `scroll.lua` | Smooth, fluid scrolling behavior. |
| `smear.lua` | Smooth, trailing cursor effects. |
| `theme.lua` | Visual aesthetics and colorscheme management. |
| `ui.lua` | Statusline, notifications, and interface polishing. |

## 📁 Project Structure
```text
~/.config/nvim
├── init.lua           # Main entry point
└── lua/custom/plugins/ # Modular plugin directory
```

# ⌨️ Complete Neovim Keybinding Reference

## 🔍 LSP (Language Server Protocol)

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Go to Definition | `gd` | Jump to definition |
| Go to Declaration | `gD` | Jump to declaration |
| Go to References | `gr` / `grd` | Show all references |
| Hover Documentation | `K` | Show hover information |
| Signature Help | `<C-k>` | Show signature help (insert mode) |
| Rename Symbol | `<leader>rn` | Incremental rename |
| Code Action | `<leader>ca` | Show code actions |
| Format | `<leader>f` | Format document/selection |

## 🧭 Navigation & Jumps

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Jump Back | `<C-o>` | Jump to previous location |
| Jump Forward | `<C-i>` / `<Tab>` | Jump to next location |
| Flash Jump | `s` | Flash jump to location |
| Flash Treesitter | `S` | Flash treesitter selection |
| Scroll Down | `<C-d>` | Half page down |
| Scroll Up | `<C-u>` | Half page up |

## 📁 File Explorer (Neo-tree)

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Toggle Neo-tree | `<leader>e` | Toggle file explorer |
| Reveal Current File | `\` | Reveal current file in tree |
| Change to File Dir | `:cd %:h` | Set CWD to current file's directory |
| **Inside Neo-tree:** | | |
| Open/Close Folder | `<Space>` or `<Enter>` | Toggle folder |
| Open File | `<Enter>` | Open file |
| Open Split | `s` | Open in horizontal split |
| Open Vsplit | `v` | Open in vertical split |
| Delete | `d` | Delete file/folder |
| Rename | `r` | Rename file/folder |
| Create | `a` | Create new file/folder |
| Copy | `c` | Copy file/folder |
| Paste | `p` | Paste file/folder |
| Cut | `x` | Cut file/folder |
| Refresh | `R` | Refresh tree |

## ✏️ Editing

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Yank to End | `Y` | Yank from cursor to end of line |
| Visual Line | `<S-v>` / `V` | Enter visual line mode |
| Visual Block | `<C-v>` | Enter visual block mode |
| Change Inner Word | `ciw` | Change word |
| Change Inner Quote | `ci"` / `ci'` | Change inside quotes |
| Delete Line | `dd` | Delete current line |
| Undo | `u` | Undo |
| Redo | `<C-r>` | Redo |
| Select All | `ggVG` | Select entire file |
| Indent | `>` / `<` | Indent/unindent (visual mode) |
| Join Lines | `J` | Join line below to current |

## 🔎 Search & Replace

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Search Forward | `/` | Search forward |
| Search Backward | `?` | Search backward |
| Next Match | `n` | Next search result |
| Previous Match | `N` | Previous search result |
| Clear Highlight | `<leader>nh` | Clear search highlight |

## 💾 File Operations

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Save | `:w<Enter>` | Save file |
| Save & Quit | `:wq<Enter>` | Save and quit |
| Quit | `:q<Enter>` | Quit |
| Force Quit | `:q!<Enter>` | Quit without saving |
| Save All | `:wa<Enter>` | Save all buffers |

## 🪟 Window Management

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Split Horizontal | `<C-w>s` or `:split` | Split window horizontally |
| Split Vertical | `<C-w>v` or `:vsplit` | Split window vertically |
| Navigate Left | `<C-w>h` | Move to left window |
| Navigate Down | `<C-w>j` | Move to down window |
| Navigate Up | `<C-w>k` | Move to up window |
| Navigate Right | `<C-w>l` | Move to right window |
| Close Window | `<C-w>q` | Close current window |
| Maximize Toggle | `<C-w>o` | Make current window only window |
| Resize Wider | `<C-w>>` | Increase window width |
| Resize Narrower | `<C-w><` | Decrease window width |
| Resize Taller | `<C-w>+` | Increase window height |
| Resize Shorter | `<C-w>-` | Decrease window height |
| Equal Size | `<C-w>=` | Make all windows equal size |

## 🚀 Git Operations

| Action | Keybinding | Description |
|--------|-----------|-------------|
| LazyGit | `<leader>gg` | Open LazyGit interface |
| Diff View | `<leader>gd` | Open diff view |
| File History | `<leader>gh` | Show file history |
| Next Hunk | `]c` | Jump to next git change |
| Previous Hunk | `[c` | Jump to previous git change |
| Preview Hunk | `<leader>gp` | Preview git hunk |

## 🐛 Debugging (DAP)

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Start/Continue | `<F5>` | Start debugging or continue |
| Step Into | `<F1>` | Step into function |
| Step Over | `<F2>` | Step over line |
| Step Out | `<F3>` | Step out of function |
| Toggle Breakpoint | `<leader>b` | Toggle breakpoint |
| Conditional Breakpoint | `<leader>B` | Set conditional breakpoint |
| Toggle Debug UI | `<F7>` | Toggle debug UI |

## 🔧 Diagnostics

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Trouble Diagnostics | `<leader>xx` | Toggle diagnostics (Trouble) |
| Buffer Diagnostics | `<leader>xX` | Buffer diagnostics only |
| Next Diagnostic | `]d` | Go to next diagnostic |
| Previous Diagnostic | `[d` | Go to previous diagnostic |
| Show Diagnostic | `<leader>d` | Show diagnostic float |

## 📋 Buffers

| Action | Keybinding | Description |
|--------|-----------|-------------|
| List Buffers | `<leader>bb` | Telescope buffer list |
| Next Buffer | `:bn<Enter>` | Next buffer |
| Previous Buffer | `:bp<Enter>` | Previous buffer |
| Delete Buffer | `:bd<Enter>` | Delete current buffer |

## 🔍 Telescope (Fuzzy Finder)

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Find Files | `<leader>sf` | Search files |
| Live Grep | `<leader>sg` | Search text in files |
| Buffers | `<leader>bb` | List open buffers |
| Help Tags | `<leader>sh` | Search help |
| Recent Files | `<leader>sr` | Recent files |
| Keymaps | `<leader>sk` | Search keymaps |

## ⌨️ Command Mode Shortcuts

| Action | Keybinding | Description |
|--------|-----------|-------------|
| Change to File Dir | `:cd %:h<Enter>` | CD to current file's directory |
| Show Current Dir | `:pwd<Enter>` | Print working directory |
| Edit File | `:e <file>` | Edit/open file |
| Source File | `:so %<Enter>` | Source current file |

# 🛠️ Plugin Management & Tools

## 📦 Adding Custom Plugins

Because this configuration is modular, adding a new plugin is straightforward:

### Steps to Add a Plugin:

1. **Create a new file** in `lua/custom/plugins/` (e.g., `my-new-plugin.lua`)

2. **Add the plugin requirement and setup logic** within that file

3. **Require the file** in your `init.lua`:
```lua
   require('custom.plugins.my-new-plugin')
```

## 🔧 Managing LSP & Tools (Mason)

Mason provides a graphical interface to install and manage LSP servers, DAP servers, linters, and formatters.

### Mason Commands

| Command | Purpose |
|---------|---------|
| `:Mason` | Open the graphical interface to install/update LSPs, DAPs, linters, and formatters |
| `:MasonLog` | View the log file if a server fails to install |
| `:LspInfo` | Check which LSP servers are currently active for the filetype you are editing |

### Inside Mason Interface

| Key | Action |
|-----|--------|
| `i` | Install package under cursor |
| `u` | Update package under cursor |
| `U` | Update all packages |
| `X` | Uninstall package under cursor |
| `c` | Check for outdated packages |
| `/` | Search/filter packages |
| `g?` | Show help |
| `q` | Close Mason |

## 🔄 Useful Maintenance Commands

| Command | Purpose |
|---------|---------|
| `:checkhealth` | Run this to diagnose configuration or missing dependencies |
| `:TSUpdate` | Update Treesitter parsers manually |
| `:MasonUpdate` | Update the Mason package manager and its managed tools |

## 🚀 Getting Started

### Prerequisites

- Neovim (v0.10+)
- Ripgrep
- Rust Toolchain

### Installation

```bash
git clone https://github.com/Frankuccino/franeovim.git ~/.config/nvim
```

## 🧠 Philosophy

This setup is designed for **AI-native awareness**. It prioritizes:
- High-density information displays
- Fast navigation
- Deep diagnostic capabilities for backend microservices
