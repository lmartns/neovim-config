return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      background = "#282828", -- fundo Gruvbox dark
      black = "#1d2021",
      darkgray = "#3c3836",
      gray = "#504945",
      lightgray = "#bdae93",
      white = "#ebdbb2",
      red = "#fb4934",
      orange = "#fe8019",
      yellow = "#fabd2f",
      green = "#b8bb26",
      cyan = "#8ec07c",
      blue = "#83a598",
      purple = "#d3869b",
      pink = "#d3869b",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.green, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      visual = {
        a = { bg = colors.purple, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      replace = {
        a = { bg = colors.red, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      inactive = {
        a = { bg = colors.black, fg = colors.gray, gui = "bold" },
        b = { bg = colors.black, fg = colors.gray },
        c = { bg = colors.black, fg = colors.gray },
      },
    }

    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
