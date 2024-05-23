return {
  {
    "martinda/Jenkinsfile-vim-syntax",
    ft = { "jenkinsfile" },
  },
  {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  codeium_no_map_tab = false,
  config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
  },
  {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
  },
  cmd = {
    -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
    "Subs",
    "TextCaseOpenTelescope",
    "TextCaseOpenTelescopeQuickChange",
    "TextCaseOpenTelescopeLSPChange",
    "TextCaseStartReplacingCommand",
  },
  -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
  -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
  -- available after the first executing of it or after a keymap of text-case.nvim has been used.
  },
  {
    "ThePrimeagen/vim-be-good",
     cmd = {"VimBeGood"}
  },
  {
    "LunarVim/bigfile.nvim",
    filesize = 1,
    pattern = { "*" },
    features = { -- features to disable
      "indent_blankline",
      "illuminate",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    }
  },
  {
      "gbprod/yanky.nvim",
      lazy=false,
      opts = {
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
      ring = {
      history_length = 100,
      storage = "shada",
      sync_with_numbered_registers = true,
      cancel_event = "update",
    },
    picker = {
      select = {
        action = nil, -- nil to use default put action
      },
      telescope = {
        use_default_mappings = true, -- if default mappings should be used
      },
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    }
  },
  {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  },
  {
    "epwalsh/obsidian.nvim",
     event = { "BufReadPre Users/lorranrodrigues/gupy/lorran_obsidian/**.md" },
     cmd = { "ObsidianToday", "ObsidianSearch" },
     dependencies = {"nvim-lua/plenary.nvim"},
     opts = {
        dir = "~/gupy/lorran_obsidian",
        daily_notes = {
          folder = "daily",
          date_format = "%Y-%m-%d"
        },
        templates = {
          subdir = "templates/daily",
          date_format = "%Y-%m-%d-%a",
          time_format = "%H:%M",
        },
        mappings = { 
          -- ["gf"] = require("obsidian.mapping").gf_passthrough(),
          },
      },
  },
  {
    "towolf/vim-helm",
    event = { "BufRead *.yaml", "BufRead *.tpl" },
  },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "90",
      disabled_filetypes = { "help" },
    },
  },
  {
    "nvim-neotest/neotest",
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      })
      require("neotest").setup {
        -- your neotest config here
        adapters = {
          require "neotest-elixir",
          require "neotest-python",
        },
      }
    end,
    ft = { "elixir", "python" },
    dependencies = {
      "jfpedroza/neotest-elixir",
      "nvim-neotest/neotest-python",
    },
  },
  {
    'cappyzawa/trim.nvim',
    opts = {
      trim_on_write = true,
    }
  },
  { "mbbill/undotree", event = "User AstroFile" },
  {
    'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' ,lazy=false },
  {
      'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end
  },
  { "nvim-neotest/nvim-nio" },
  { 'https://codeberg.org/esensar/nvim-dev-container',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = {
      "DevcontainerStart",
      "DevcontainerAttach",
      "DevcontainerExec",
      "DevcontainerStop",
      "DevcontainerStopAll",
      "DevcontainerRemoveAll",
      "DevcontainerLogs",
      "DevcontainerEditNearestConfig",

    }
  },
  {
    "tpope/vim-dotenv",
    cmd = {"Dotenv"}
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
  },
  {
    'lukoshkin/highlight-whitespace',
    opts = {
      tws = '\\s\\+$',
      clear_on_winleave = false,
      palette = {
        markdown = {
          tws = 'RosyBrown',
        },
        other = {
          tws = 'PaleVioletRed',
        }
      }
    }
  },
  {
    'ur4ltz/surround.nvim',
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "surround", map_insert_mode = false }
    end,
  }
}
