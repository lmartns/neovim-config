require("leo.core")
require("leo.lazy")

-- No seu init.lua ou arquivo de configuração
vim.diagnostic.config({
  virtual_text = true,   -- Desativa texto virtual no final da linha
  virtual_lines = false, -- Ativa linhas virtuais (requer Neovim 0.10+)
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
