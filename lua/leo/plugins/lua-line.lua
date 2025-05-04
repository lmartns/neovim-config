return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      background = "#1e1e1e", -- fundo xcode-dark
      black = "#232526",      -- preto xcode-dark
      darkgray = "#2c2c2c",   -- cinza escuro xcode-dark
      gray = "#3c3c3c",       -- cinza xcode-dark
      lightgray = "#d4d4d4",  -- cinza claro xcode-dark
      white = "#ffffff",      -- branco xcode-dark
      red = "#d16969",        -- vermelho xcode-dark
      orange = "#b89500",     -- laranja xcode-dark
      yellow = "#d7ba7d",     -- amarelo xcode-dark
      green = "#608b4e",      -- verde xcode-dark
      cyan = "#4ec9b0",       -- ciano xcode-dark
      blue = "#569cd6",       -- azul xcode-dark
      purple = "#c586c0",     -- roxo xcode-dark
      pink = "#d16d9e",       -- rosa xcode-dark
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.background, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      insert = {
        a = { bg = colors.green, fg = colors.background, gui = "bold" },
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
