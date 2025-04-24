return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    
local colors = {
  nord0  = "#2E3440", -- bg dark
  nord1  = "#3B4252", -- bg
  nord2  = "#434C5E", -- bg lighter
  nord3  = "#4C566A", -- fg dark
  nord4  = "#D8DEE9", -- fg
  nord5  = "#E5E9F0", -- fg lighter
  nord6  = "#ECEFF4", -- fg lightest
  nord7  = "#8FBCBB", -- cyan
  nord8  = "#88C0D0", -- blue
  nord9  = "#81A1C1", -- blue dark
  nord10 = "#5E81AC", -- blue darker
  nord11 = "#BF616A", -- red
  nord12 = "#D08770", -- orange
  nord13 = "#EBCB8B", -- yellow
  nord14 = "#A3BE8C", -- green
  nord15 = "#B48EAD", -- purple
}


local my_lualine_theme = {
  normal = {
    a = { bg = colors.nord8, fg = colors.nord0, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord5 },
    c = { bg = colors.nord1, fg = colors.nord4 },
  },
  insert = {
    a = { bg = colors.nord14, fg = colors.nord0, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord5 },
    c = { bg = colors.nord1, fg = colors.nord4 },
  },
  visual = {
    a = { bg = colors.nord15, fg = colors.nord0, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord5 },
    c = { bg = colors.nord1, fg = colors.nord4 },
  },
  command = {
    a = { bg = colors.nord13, fg = colors.nord0, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord5 },
    c = { bg = colors.nord1, fg = colors.nord4 },
  },
  replace = {
    a = { bg = colors.nord11, fg = colors.nord0, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord5 },
    c = { bg = colors.nord1, fg = colors.nord4 },
  },
  inactive = {
    a = { bg = colors.nord1, fg = colors.nord3, gui = "bold" },
    b = { bg = colors.nord1, fg = colors.nord3 },
    c = { bg = colors.nord1, fg = colors.nord3 },
  },
}
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
