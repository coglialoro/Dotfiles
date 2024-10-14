-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night",     -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--       light_style = "day", -- The theme is used when the background is set to light
--       transparent = true,  -- Enable this to disable setting the background color
--     })
--
--     vim.cmd [[colorscheme tokyonight]]
--   end
-- }

return {
  "marko-cerovac/material.nvim",
  config = function()
    vim.cmd "colorscheme material"
    vim.g.material_style = "darker"

    require("material").setup({
      lualine_style = "default"
    })

    vim.keymap.set("n", "<leader>th", function()
      require("material.functions").find_style()
    end, { desc = "Change theme" })
  end,
  priority = 100
}
