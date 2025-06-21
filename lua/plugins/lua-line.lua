return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    lualine.setup({
      options = {
        theme = "gruvbox-material",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_c = { "diagnostics" },

        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          "encoding",
          "fileformat",
          "filetype",
        },
      },
    })
  end,
}
