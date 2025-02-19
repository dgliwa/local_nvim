return {
  {
    'nvim-telescope/telescope.nvim',
    opts = function(plugin, opts)
      local astronvim_config = require("astronvim.plugins.configs.telescope")(plugin, opts)
      local lga_actions = require("telescope-live-grep-args.actions")


      local telescope = require("telescope")
      telescope.setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = { -- extend mappings
              i = {
                ["<C-z>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<Tab>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_next,
              },
            },
          },
        },
      }
      telescope.load_extension("live_grep_args")
      
    end,
  }
}
