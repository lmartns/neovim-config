return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      size = 50,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
      shell = "fish",
      -- Adicione esta configuração para facilitar a navegação
      on_open = function(term)
        -- Configurar atalhos quando o terminal estiver aberto
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-h>", [[<C-\><C-n><C-W>h]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-j>", [[<C-\><C-n><C-W>j]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-k>", [[<C-\><C-n><C-W>k]], { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", [[<C-\><C-n><C-W>l]], { noremap = true, silent = true })
        -- Esc para entrar no modo normal dentro do terminal
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
      end,
    })

    -- Mapeamentos globais para navegar entre janelas (incluindo terminal)
    vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
  end
}
