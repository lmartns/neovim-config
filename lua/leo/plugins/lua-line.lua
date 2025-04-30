return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      background = "#282828", -- fundo escuro do gruvbox
      black = "#3c3836",      -- preto do gruvbox
      darkgray = "#504945",   -- cinza escuro do gruvbox
      gray = "#665c54",       -- cinza do gruvbox
      lightgray = "#bdae93",  -- cinza claro do gruvbox
      white = "#ebdbb2",      -- branco/bege do gruvbox
      red = "#fb4934",        -- vermelho do gruvbox
      orange = "#fe8019",     -- laranja do gruvbox
      yellow = "#fabd2f",     -- amarelo do gruvbox
      green = "#b8bb26",      -- verde do gruvbox
      cyan = "#8ec07c",       -- ciano/aqua do gruvbox
      blue = "#83a598",       -- azul do gruvbox
      purple = "#d3869b",     -- roxo/magenta do gruvbox
      pink = "#d3869b",       -- rosa (mesmo que roxo no gruvbox)
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
