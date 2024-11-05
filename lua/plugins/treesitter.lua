if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    opt = {
      foldenable = false,
      foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
      foldmethod = "expr",
    },
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
