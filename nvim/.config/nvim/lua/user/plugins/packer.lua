local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

packer.startup(function(use)
  -- Very Important
  use("wbthomason/packer.nvim") -- Packer manages itself
  use("nvim-treesitter/nvim-treesitter") -- Better highlight

  -- Misc
  use("nvim-lua/plenary.nvim") -- Plugin helper
  use("kyazdani42/nvim-web-devicons") -- Nvim Icons
  use("catppuccin/nvim") -- Colortheme
  use("NLKNguyen/papercolor-theme") -- Colortheme
  use("kyazdani42/nvim-tree.lua") -- Nvim Tree
  use("lewis6991/gitsigns.nvim") -- Git status
  use("tpope/vim-sleuth") -- Smart tabs & spaces
  use("tpope/vim-commentary") -- Quick code commenting
  use("tpope/vim-surround") -- Quick quote editing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use("windwp/nvim-ts-autotag") -- autoclose tags
  use("christoomey/vim-tmux-navigator") -- Seemless Vim and Tmux navigator
  use("nvim-lualine/lualine.nvim") -- Status line
  use({ "phaazon/hop.nvim", branch = "v2" }) -- Faster motion
  use("folke/which-key.nvim") -- Keymap hints

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- Lspsaga
  use("jose-elias-alvarez/typescript.nvim") -- Better TypeScript integration
  use("onsails/lspkind.nvim") -- Lsp icons

  -- Formatting & Linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

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
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- use fzf as fuzzy finder
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- actual finder
end)
