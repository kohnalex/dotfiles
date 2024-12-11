-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then return end

lazy.setup({
  -- Misc
  "xiyaowong/transparent.nvim", -- Transparent BG
  "nvim-treesitter/nvim-treesitter", -- Better highlight
  "nvim-lua/plenary.nvim", -- Plugin helper
  "kyazdani42/nvim-web-devicons", -- Nvim Icons
  "kyazdani42/nvim-tree.lua", -- Nvim Tree
  "lewis6991/gitsigns.nvim", -- Git status
  "tpope/vim-sleuth", -- Smart tabs & spaces
  "tpope/vim-commentary", -- Quick code commenting
  "tpope/vim-surround", -- Quick quote editing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
  "windwp/nvim-ts-autotag", -- autoclose tags
  "christoomey/vim-tmux-navigator", -- Seemless Vim and Tmux navigator
  "nvim-lualine/lualine.nvim", -- Status line
  "folke/which-key.nvim", -- Keymap hints
  "rmagatti/auto-session", -- Session manager. TODO: replace with folkes persist.nvim
  "kohnalex/symbols-outline.nvim", -- Symbol outline
  "folke/trouble.nvim", -- Like Telescope but with open buffers
  "f-person/auto-dark-mode.nvim", -- OS Mode detection
  "github/copilot.vim", -- Copilot
  "stevearc/dressing.nvim", -- Better UI
  { "akinsho/toggleterm.nvim", tag = "*" }, -- Toggleterm
  { "karb94/neoscroll.nvim" }, -- Smooth C-d/C-u scrolling

  -- Color Schemes
  "catppuccin/nvim",
  "NLKNguyen/papercolor-theme",
  "morhetz/gruvbox",
  "Mofiqul/vscode.nvim",
  "folke/tokyonight.nvim",
  "projekt0n/github-nvim-theme",

  -- LSP
  "williamboman/mason.nvim", -- LSP Server manager
  "williamboman/mason-lspconfig.nvim", -- Mason-lspconfig helper
  "neovim/nvim-lspconfig", -- LSP Configuration
  "onsails/lspkind.nvim", -- Lsp icons
  "jose-elias-alvarez/null-ls.nvim", -- formatting, linting, ...
  "jayp0521/mason-null-ls.nvim", -- Mason-Null-ls helper

  -- Code completion
  "hrsh7th/nvim-cmp", -- Main plugin
  "hrsh7th/cmp-buffer", -- Buffer Completions
  "hrsh7th/cmp-path", -- Path Completions
  "hrsh7th/cmp-cmdline", -- Cmdline Completions
  "L3MON4D3/LuaSnip", -- snippet engine
  "hrsh7th/cmp-nvim-lsp", -- LSP Completions
  "saadparwaiz1/cmp_luasnip", -- Snippet Engine. Required by cmp to run
  "rafamadriz/friendly-snippets", -- A collection of fine snippets

  -- Fuzzy finder
  "nvim-telescope/telescope-ui-select.nvim", -- telescope fancy ui select
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- use fzf as fuzzyfinder engine
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- actual fuzzy finder
})
