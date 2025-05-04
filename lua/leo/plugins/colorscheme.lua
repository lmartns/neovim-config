return {
  {
    "arzg/vim-colors-xcode",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("xcode")
    end,
  },
}
