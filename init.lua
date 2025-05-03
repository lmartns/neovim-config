require("leo.core")
require("leo.lazy")

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = 1,
}

-- No seu init.lua ou arquivo de configuração
vim.diagnostic.config({
  virtual_text = true,   -- Desativa texto virtual no final da linha
  virtual_lines = false, -- Ativa linhas virtuais (requer Neovim 0.10+)
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
