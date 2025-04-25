return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      background = "#222222", -- fundo escuro
      black = "#282828", -- preto
      darkgray = "#3a3a3a", -- cinza escuro
      gray = "#767676", -- cinza
      lightgray = "#b2b2b2", -- cinza claro
      white = "#dadada", -- branco
      red = "#af5f5f", -- vermelho
      orange = "#d78787", -- laranja
      yellow = "#d7d7af", -- amarelo
      green = "#87af87", -- verde
      cyan = "#87afaf", -- ciano
      blue = "#87afd7", -- azul
      purple = "#afafd7", -- roxo
      pink = "#d7afd7", -- rosa
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
