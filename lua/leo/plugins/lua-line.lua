return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      background = "#101010", -- editor.background
      black = "#101010", -- sidebar, tab inactive
      darkgray = "#232323", -- list.inactiveSelectionBackground
      gray = "#505050", -- editorLineNumber.foreground
      lightgray = "#A0A0A0", -- sideBarTitle.foreground
      white = "#FFFFFF", -- editor.foreground
      red = "#FF8080", -- editorError.foreground
      orange = "#FFC799", -- editorWarning.foreground
      yellow = "#FFC799", -- activityBarBadge.background (usado para destaque)
      green = "#99FFE4", -- editorGutter.addedBackground
      cyan = "#99FFE4", -- editorGutter.addedBackground (mesma cor)
      blue = "#A0A0A0", -- editorInlayHint.foreground (cinza claro)
      purple = "#FFC799", -- destaque suave (usado no visual)
      pink = "#FF8080", -- erro / destaque vermelho suave
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.orange, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      insert = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      visual = {
        a = { bg = colors.purple, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.darkgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.lightgray },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
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
