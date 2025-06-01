vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-commentary'
  use 'tpope/vim-endwise'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use 'wbthomason/packer.nvim'
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use{
    "olimorris/codecompanion.nvim",
    config = function()
      require("codecompanion").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    options = { theme = 'gruvbox' },
  }
  use {
    'dense-analysis/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-tree/nvim-tree.lua'
  }
  use 'tjdevries/colorbuddy.vim'
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  })
  use {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim_sticky'
      vim.g['test#neovim#term_position'] = 'vert botright'
    end
  }

  -- codecompanion
  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "anthropic",
      },
      inline = {
        adapter = "anthropic",
      },
    },
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op read op://personal/Anthropic/credential --no-newline",
          },
        })
      end,
    },
  })

  -- nvim tree
  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    }
  })

  -- endwise to complete brackets etc
  require('nvim-treesitter.configs').setup {
    auto_install = true,
    indent = {
      enable = true
    },
    endwise = {
      enable = true
    }
  }

  -- Lualine for nice status bar
  require('lualine').setup()

  -- Get Telescope to quit on single escape
  local actions = require("telescope.actions")
  require("telescope").setup({
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
  })
end)
