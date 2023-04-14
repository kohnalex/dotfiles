local opt = vim.opt
local bo = vim.bo

-- opt.termguicolors = true -- Enable colors in terminal. Disabled, because it breaks cmp themes.
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 300 --	Time in milliseconds to wait for a mapped sequence to complete.
opt.backspace = "indent,eol,start"
opt.errorbells = false
opt.scrolloff = 999
opt.hidden = true
opt.backup = false
opt.writebackup = false
opt.exrc = true
opt.autoread = true
opt.cursorline = true
opt.incsearch = true
opt.laststatus = 3
opt.guifont = "FantasqueSansMono Nerd Font Mono:h17"

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Random notification disable (TODO: fix it lol)
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then return end

  notify(msg, ...)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  border = "double",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "double",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "double",
})
