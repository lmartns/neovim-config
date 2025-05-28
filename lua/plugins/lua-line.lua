return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      base = "#1d2021",     -- Gruvbox Material dark0_hard (for fg on colored bg)
      mantle = "#282828",   -- Gruvbox Material dark0 (main bg)
      crust = "#1d2021",    -- Gruvbox Material dark0_hard
      text = "#ddc7a1",     -- Gruvbox Material fg
      subtext = "#bdae93",  -- Gruvbox Material fg_grey
      red = "#ea6962",      -- Gruvbox Material red
      orange = "#e78a4e",   -- Gruvbox Material orange
      yellow = "#d8a657",   -- Gruvbox Material yellow
      green = "#a9b665",    -- Gruvbox Material green
      blue = "#7daea3",     -- Gruvbox Material blue
      purple = "#d3869b",   -- Gruvbox Material purple/magenta
      pink = "#d3869b",     -- Gruvbox Material purple/magenta (no distinct pink, using purple)
      surface0 = "#32302f", -- Gruvbox Material dark1 (component bg)
      surface1 = "#928374", -- Gruvbox Material gray_fg (inactive fg)
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
