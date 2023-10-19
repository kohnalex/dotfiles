local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Packer manages itself

  -- Misc
  use("nvim-treesitter/nvim-treesitter") -- Better highlight
  use("nvim-lua/plenary.nvim") -- Plugin helper
  use("kyazdani42/nvim-web-devicons") -- Nvim Icons
  use("catppuccin/nvim") -- Colortheme
  use("NLKNguyen/papercolor-theme") -- Colortheme
  use("morhetz/gruvbox") -- Colortheme
  use("Mofiqul/vscode.nvim") -- Colortheme
  use("kyazdani42/nvim-tree.lua") -- Nvim Tree
  use("lewis6991/gitsigns.nvim") -- Git status
  use("tpope/vim-sleuth") -- Smart tabs & spaces
  use("tpope/vim-commentary") -- Quick code commenting
  use("tpope/vim-surround") -- Quick quote editing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use("windwp/nvim-ts-autotag") -- autoclose tags
  use("christoomey/vim-tmux-navigator") -- Seemless Vim and Tmux navigator
  use("nvim-lualine/lualine.nvim") -- Status line
  use("folke/which-key.nvim") -- Keymap hints
  use("rmagatti/auto-session") -- Session manager. TODO: replace with folkes persist.nvim
  use("kohnalex/symbols-outline.nvim") -- Symbol outline
  use("folke/trouble.nvim") -- Like Telescope but with open buffers
  use("voldikss/vim-floaterm") -- Floating terminal
  use("f-person/auto-dark-mode.nvim") -- OS Mode detection
  use("github/copilot.vim") -- Copilot
  use("stevearc/dressing.nvim") -- Better UI
  use({ "akinsho/toggleterm.nvim", tag = "*" }) -- Toggleterm
  use({ "karb94/neoscroll.nvim" }) -- Smooth C-d/C-u scrolling

  -- LSP
  use("williamboman/mason.nvim") -- LSP Server manager
  use("williamboman/mason-lspconfig.nvim") -- Mason-lspconfig helper
  use("neovim/nvim-lspconfig") -- LSP Configuration
  use("jose-elias-alvarez/typescript.nvim") -- Better TypeScript integration
  use("onsails/lspkind.nvim") -- Lsp icons
  use("jose-elias-alvarez/null-ls.nvim") -- formatting, linting, ...
  use("jayp0521/mason-null-ls.nvim") -- Mason-Null-ls helper

  -- Code completion
  use("hrsh7th/nvim-cmp") -- Main plugin
  use("hrsh7th/cmp-buffer") -- Buffer Completions
  use("hrsh7th/cmp-path") -- Path Completions
  use("hrsh7th/cmp-cmdline") -- Cmdline Completions
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("hrsh7th/cmp-nvim-lsp") -- LSP Completions
  use("saadparwaiz1/cmp_luasnip") -- Snippet Engine. Required by cmp to run
  use("rafamadriz/friendly-snippets") -- A collection of fine snippets

  -- Fuzzy finder
  use("nvim-telescope/telescope-ui-select.nvim") -- telescope fancy ui select
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- use fzf as fuzzyfinder engine
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- actual fuzzy finder
end)
