-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    'stevearc/quicker.nvim',
    config = function()
      require('quicker').setup()
    end
  }
}
