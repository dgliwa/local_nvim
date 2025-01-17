-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    -- features = {
    --   large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    --   autopairs = true, -- enable autopairs at start
    --   cmp = true, -- enable completion at start
    --   diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
    --   highlighturl = true, -- highlight URLs at start
    --   notifications = true, -- enable notifications at start
    -- },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    -- diagnostics = {
    --   virtual_text = true,
    --   underline = true,
    -- },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        -- relativenumber = true, -- sets vim.opt.relativenumber
        -- number = true, -- sets vim.opt.number
        -- spell = false, -- sets vim.opt.spell
        -- signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        -- wrap = false, -- sets vim.opt.wrap
        relativenumber = false,
        clipboard = "",
      },
      g = { -- vim.g.<key>
        copilot_no_tab_map = true,
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    commands = {
      Cppath = {
        function()
          local path = vim.fn.expand("%:.")
          vim.fn.setreg("+", path)
          vim.notify('Copied "' .. path .. '" to the dumb clipboard!')
        end
      }
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ['<c-Enter>'] = { 'copilot#Accept("")', expr = true, replace_keycodes = false },
      },
      n = {
        ['<Leader>gG'] = { '<cmd>OpenInGHFileLines<CR>', desc = 'Open file in GitHub' },
        ['<Leader>go'] = { '<cmd>Git<CR>', desc = 'Open fugitive' },
        ['<Leader>be'] = { '<cmd>Neotree toggle show buffers<CR>', desc = 'Toggle buffer explorer' },
        ['<Leader>bn'] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = 'Next buffer' },
        ['<Leader>bm'] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = 'Next buffer' },
        ['<Leader>vs'] = { '<cmd>VenvSelect<cr>', desc = 'Open venv selector' },
        ['<c-y>c'] = { '<cmd>Cppath<cr>', desc = 'Copy the current file path' }
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        --
        -- -- mappings seen under group name "Buffer"
        -- ["<Leader>bd"] = {
        --   function()
        --     require("astroui.status.heirline").buffer_picker(
        --       function(bufnr) require("astrocore.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Close buffer from tabline",
        -- },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      t = {
        ['<esc>'] = { '<C-\\><C-n>' },
      },
    },
  },
}
