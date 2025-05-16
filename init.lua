require("leo.core")
require("leo.lazy")

vim.diagnostic.config({
  virtual_text = true, -- Desativa texto virtual no final da linha
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.keymap.set("n", "<space>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end)
