return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = require("catppuccin.palettes").get_palette()

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.crust, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      insert = {
        a = { bg = colors.green, fg = colors.crust, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      visual = {
        a = { bg = colors.mauve, fg = colors.crust, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      command = {
        a = { bg = colors.peach, fg = colors.crust, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      replace = {
        a = { bg = colors.red, fg = colors.crust, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      inactive = {
        a = { bg = colors.mantle, fg = colors.surface1, gui = "bold" },
        b = { bg = colors.mantle, fg = colors.surface1 },
        c = { bg = colors.mantle, fg = colors.surface1 },
      },
    }

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.sky },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
