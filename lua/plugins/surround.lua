-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({})
    end
  }
}
