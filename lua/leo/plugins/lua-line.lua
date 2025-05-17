return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      base = "#1e1e2e",
      mantle = "#181825",
      crust = "#11111b",
      text = "#cdd6f4",
      subtext = "#bac2de",
      red = "#f38ba8",
      orange = "#fab387",
      yellow = "#f9e2af",
      green = "#a6e3a1",
      blue = "#89b4fa",
      purple = "#cba6f7",
      pink = "#f5c2e7",
      surface0 = "#313244",
      surface1 = "#45475a",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      insert = {
        a = { bg = colors.green, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      visual = {
        a = { bg = colors.purple, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.base, gui = "bold" },
        b = { bg = colors.surface0, fg = colors.text },
        c = { bg = colors.mantle, fg = colors.subtext },
      },
      replace = {
        a = { bg = colors.red, fg = colors.base, gui = "bold" },
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
            color = { fg = colors.orange },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
