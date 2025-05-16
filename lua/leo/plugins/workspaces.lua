return {

  "natecraddock/workspaces.nvim",
  config = function()
    local workspaces = require("workspaces")

    workspaces.setup({
      -- Caminho para salvar os dados dos workspaces (padrão)
      path = vim.fn.stdpath("data") .. "/workspaces",

      -- Tipo de mudança de diretório: "global", "local" ou "tab"
      cd_type = "global",

      -- Ordenar workspaces por uso recente
      sort = true,
      mru_sort = true,

      -- Hooks para rodar após abrir workspace
      hooks = {
        open = {
          "Telescope find_files", -- abre o finder de arquivos
          "Telescope live_grep", -- abre busca por texto
        },
      },

      -- Notificações ao adicionar/remover workspace
      notify_info = true,
    })

    -- Keymaps para gerenciar workspaces
    vim.keymap.set("n", "<leader>wo", workspaces.open, { desc = "Abrir workspace" })
    vim.keymap.set("n", "<leader>wa", function()
      -- Adiciona workspace com nome e caminho atuais
      local name = vim.fn.input("Nome do workspace: ")
      local path = vim.fn.input("Caminho do workspace: ", vim.fn.getcwd(), "dir")
      if name ~= "" and path ~= "" then
        workspaces.add(path, name)
        print("Workspace '" .. name .. "' adicionado.")
      else
        print("Nome ou caminho inválido.")
      end
    end, { desc = "Adicionar workspace" })
    vim.keymap.set("n", "<leader>wr", function()
      local name = vim.fn.input("Nome do workspace para remover: ")
      if name ~= "" then
        workspaces.remove(name)
        print("Workspace '" .. name .. "' removido.")
      else
        print("Nome inválido.")
      end
    end, { desc = "Remover workspace" })
  end,
}
