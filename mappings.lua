local tabpre = "<leader><tab>"
local runtest = "<leader>t"

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
      ["<leader>N"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
      -- tabs
      [tabpre] = { desc = "󰓩 Tab Managment" },
      [tabpre .. "l"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
      [tabpre .. "f"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
      [tabpre .. "<tab>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
      [tabpre .. "]"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
      [tabpre .. "["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
      -- tests
      [runtest] = { desc = "󰓩 Tests CMD" },
      [runtest .. "t"] = { '<cmd> lua require("neotest").run.run()<CR>', desc = "Run Nearest Test" },
      [runtest .. "o"] = { '<cmd> lua require("neotest").output.open()<CR>', desc = "Open Test Output" },
      [runtest .. "i"] = { '<cmd>lua require("neotest").summary.toggle()<CR>', desc = 'Open Info Panel' },
      [runtest .. "f"] = {
        '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = 'Run Test on Current File'
      },

      ["<leader>U"] = { vim.cmd.UndotreeToggle, desc = "Undo tree" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
