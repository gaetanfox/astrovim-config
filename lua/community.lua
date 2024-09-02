-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua", opts = {} },
  { import = "astrocommunity.colorscheme.tokyonight-nvim", opts = {} },
  { import = "astrocommunity.pack.html-css", opts = {} },
  { import = "astrocommunity.pack.godot", opts = {} },
  { import = "astrocommunity.pack.sql", opts = {} },
  { import = "astrocommunity.pack.python", opts = {} },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline", opts = {} },

  -- import/override with your plugins folder
}
