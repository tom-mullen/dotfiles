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
  -- `main` branch: `master` is frozen and breaks on Neovim 0.12. `main` has no
  -- configs.setup or auto_install; highlighting and indent are switched on per
  -- buffer, and a missing parser is installed the first time its filetype opens.
  -- markdown_inline is only injected, so it never gets a FileType of its own.
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Parsers that the master branch built inside the plugin dir come first
      -- on the runtimepath and shadow the version-matched ones in site/.
      local legacy = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/'
      vim.fn.delete(legacy .. 'parser', 'rf')
      vim.fn.delete(legacy .. 'parser-info', 'rf')

      local ts = require('nvim-treesitter')
      ts.install({ 'markdown', 'markdown_inline' })
      local tried = {}
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          local function start()
            if vim.api.nvim_buf_is_valid(args.buf) and pcall(vim.treesitter.start, args.buf, lang) then
              vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
          if vim.treesitter.language.add(lang) then
            start()
          elseif not tried[lang] and vim.list_contains(ts.get_available(), lang) then
            tried[lang] = true -- one attempt per session, so offline is not noisy
            ts.install(lang):await(vim.schedule_wrap(start))
          end
        end,
      })
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

  -- Peek markdown preview (with mermaid support)
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup({
        theme = 'dark',
      })
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },

  -- In-buffer markdown styling (headings, tables, lists, code blocks)
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown' },
    opts = {},
  },

  -- Inline image rendering (kitty graphics protocol)
  {
    '3rd/image.nvim',
    config = function()
      require('image').setup({
        backend = 'kitty',
        processor = 'magick_cli',
        integrations = {
          markdown = {
            enabled = true,
            only_render_image_at_cursor = false,
          },
        },
      })
    end,
  },

  -- Inline diagram rendering (mermaid via mmdc)
  {
    '3rd/diagram.nvim',
    dependencies = { '3rd/image.nvim' },
    config = function()
      require('diagram').setup({
        integrations = {
          require('diagram.integrations.markdown'),
        },
        renderer_options = {
          mermaid = { theme = 'dark' },
        },
      })
    end,
  },

  -- vim-dadbod: in-editor SQL client (Postgres + SQL Server via sqlcmd)
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_win_position = 'left'
      vim.g.db_ui_winwidth = 35
      -- dracula_pro is loaded with g:dracula_colorterm=0, so `Normal` has no
      -- background (terminal-managed). DBUI derives its float notification
      -- colours from Normal's bg; finding none, it falls back to white-on-white
      -- for info popups. Route notifications through the cmdline instead.
      vim.g.db_ui_force_echo_notifications = 1
      -- Persist saved query buffers across sessions.
      vim.g.db_ui_save_location = vim.fn.stdpath('data') .. '/db_ui'
      -- Optional declarative connections from a file OUTSIDE this repo, so
      -- credentials never live in the dotfiles tree. The file returns a table of
      -- name = URL, e.g. `return { local_pg = 'postgresql://user@localhost/db' }`.
      -- (Alternatively, skip the file and use :DBUIAddConnection at runtime.)
      local conn_file = vim.fn.expand('~/.config/db/connections.lua')
      if vim.fn.filereadable(conn_file) == 1 then
        local chunk = loadfile(conn_file)
        local ok, dbs = pcall(chunk)
        if ok and type(dbs) == 'table' then
          vim.g.dbs = dbs
        else
          vim.notify('dbs: failed to load ' .. conn_file, vim.log.levels.WARN)
        end
      end
    end,
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
      require('completion_config')
    end
  },
}, {
  -- Configure rocks/luarocks
  rocks = {
    enabled = true,
    hererocks = false,  -- Use system luarocks instead of hererocks
  },
})
