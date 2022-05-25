-- Protected call so we don't error out on first use
local ok, packer = pcall(require, 'packer')
if not ok then
  print 'packer not ok'
  return
end

-- Have packer use a floating window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  }
}

-- Plugin registration
return require('packer').startup(function()
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Status line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'sainnhe/everforest'
  use 'nlknguyen/papercolor-theme'

  -- Auto closing brackets, spaces, etc.
  use 'cohama/lexima.vim'

  -- Git status annotation in buffer
  use 'mhinz/vim-signify'

  -- Tpope goodies
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'

  -- Better highlighting and parsing
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require("config.treesitter").setup()
    end
  }

  -- Code completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      'hrsh7th/cmp-buffer', -- Buffer completions
      'hrsh7th/cmp-path', -- Path completions
      'hrsh7th/cmp-cmdline', -- Cmdline completions
      'hrsh7th/cmp-nvim-lsp', -- LSP completions
      'saadparwaiz1/cmp_luasnip', -- Snippet completions
      'L3MON4D3/LuaSnip', -- Snippet Engine. Required by cmp to run.
      'rafamadriz/friendly-snippets', -- A collection of fine snippets.
    },
    config = function()
      require('config.cmp').setup()
    end,
  }


  use {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("config.nvimtree")
    end
  }


  -- LSP and LSP installer
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
    },
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("config.telescope").setup()
    end
  }

  -- Whichkey
  use {
    "folke/which-key.nvim",
    config = function()
      require("config/which-key").setup()
    end
  }
end)
