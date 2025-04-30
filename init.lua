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
  virtual_text = false, -- Desativa texto virtual no final da linha
  virtual_lines = true, -- Ativa linhas virtuais (requer Neovim 0.10+)
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Mostra diagnósticos inline quando no modo normal
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "n:i", "i:n" },
  callback = function()
    if vim.fn.mode() == "n" then
      vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
    else
      vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
    end
  end,
})
