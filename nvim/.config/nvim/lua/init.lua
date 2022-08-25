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

-- TODO:
-- Git blame tool: APZelos/blamer.nvim
-- Lspsaga setup

-- Plugin registration
return require('packer').startup(function()
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine').setup()
    end
  }

  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  -- Trouble
  use {
    'folke/trouble.nvim',
    config = function()
      require('config.trouble').setup()
    end
  }

  -- hop.nvim
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require("config.hop").setup()
    end
  }

  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'sainnhe/everforest'
  use 'nlknguyen/papercolor-theme'
  use 'catppuccin/nvim'

  -- Auto closing brackets, spaces, etc.
  use 'cohama/lexima.vim'

  -- Git status annotation in buffer
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("config.gitsigns").setup()
    end
  }

  -- Tpope goodies
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'

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


  -- File tree
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
      "jose-elias-alvarez/null-ls.nvim",
      {
        "j-hui/fidget.nvim",
        config = function() require("fidget").setup {} end,
      },
    },
  }

  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("config.lsp.lspsaga").setup()
    end
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
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
