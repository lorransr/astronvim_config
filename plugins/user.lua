return {
  {
    "martinda/Jenkinsfile-vim-syntax",
    ft = { "jenkinsfile" },
  },
  {
    "godlygeek/tabular",
  },
  {
    "ThePrimeagen/vim-be-good",
     cmd = {"VimBeGood"}
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
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
      lazy = false,
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
        mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
      },
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    }
  },
  {
    "epwalsh/obsidian.nvim",
     lazy = false,
     event = { "BufReadPre Users/lorranrodrigues/gupy/lorran_obsidian/**.md" },
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
    lazy = false,
    opts = {
      trim_on_write = true,
    }
  },
  { "mbbill/undotree", event = "User AstroFile" },
  {
    'lukoshkin/highlight-whitespace',
    lazy = false,
    opts = {
      tws = '\\s\\+$',
      clear_on_winleave = false,
      user_palette = {
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
