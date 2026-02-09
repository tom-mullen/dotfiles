-- Bootstrap lazy.nvim
require('lazy-bootstrap')

-- Setup lazy.nvim
require("lazy").setup({
  -- Basic plugins
  'christoomey/vim-tmux-navigator',
  'tpope/vim-commentary',
  'tpope/vim-endwise',
  'tpope/vim-rails',
  'airblade/vim-localorie',
  'tjdevries/colorbuddy.vim',

  -- Telescope frecency
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('telescope').load_extension('frecency')
    end,
  },

  -- Vim dispatch
  {
    'tpope/vim-dispatch',
    cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
  },

  -- Matchup
  {
    'andymass/vim-matchup',
    event = 'VimEnter'
  },

  -- Lualine status bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              path = 1,  -- Show relative path
            }
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {
            {
              'location',
              fmt = function(str)
                return str  -- Shows line:column
              end
            }
          }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      }
    end
  },

  -- ALE linter
  {
    'dense-analysis/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = function()
      vim.cmd[[ALEEnable]]
    end
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        indent = {
          enable = true
        },
        endwise = {
          enable = true
        }
      }
    end
  },

  -- nvim-tree file explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
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
    end
  },

  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },

  -- Telescope file finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          -- Use fd for file finding (faster than default find)
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          file_ignore_patterns = {
            "vendor/.*",
            "node_modules/.*",
            "%.log",
            "tmp/.*",
            "coverage/.*",
            "%.git/.*"
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
        pickers = {
          oldfiles = {
            cwd_only = true,
          },
        },
        extensions = {
          frecency = {
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = {"*.git/*", "*/tmp/*"},
            disable_devicons = false,
            workspaces = {
              ["CWD"] = vim.fn.getcwd()
            },
            -- Heavily weight recently accessed files
            recency_values = {
              { age = 240,  value = 1000 }, -- last 4 hours (very high weight)
              { age = 1440, value = 500 },  -- last day
              { age = 4320, value = 150 },  -- last 3 days
              { age = 10080, value = 50 },  -- last week
              { age = 43200, value = 10 },  -- last month
              { age = 129600, value = 1 },  -- last 90 days
            },
            -- Filter out deleted files
            filter_deleted_files = true,
            -- Hide the current buffer from results
            hide_current_buffer = true,
            -- Custom path display: show only parent directory + filename
            path_display = function(_, path)
              local Path = require('plenary.path')
              -- Remove workspace prefix if present (e.g., "CWD > path/to/file")
              local clean_path = path:gsub("^%w+ > ", "")
              local parts = vim.split(clean_path, Path.path.sep)
              if #parts > 1 then
                return parts[#parts - 1] .. Path.path.sep .. parts[#parts]
              end
              return clean_path
            end,
          }
        },
      })
    end
  },

  -- vim-test
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim_sticky'
      vim.g['test#neovim#term_position'] = 'vert botright'
    end
  },

  -- Completion plugins
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('completion')
    end
  },
}, {
  -- Configure rocks/luarocks
  rocks = {
    enabled = true,
    hererocks = false,  -- Use system luarocks instead of hererocks
  },
})
