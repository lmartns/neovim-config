return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            -- Ajustando o padrão para reconhecer arquivos chamados "test.tsx"
            testNamePattern = "(test|spec)\\.(js|jsx|ts|tsx)$",
            -- Modificando para incluir arquivos com nome exato "test.tsx"
            testMatch = {
              "**/__tests__/**/*.[jt]s?(x)",
              "**/?(*.)+(spec|test).[jt]s?(x)",
              "**/test.[jt]s?(x)", -- Adicionando este padrão para seus arquivos
            },
            -- Adicionando opção de depuração
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-go")({
            experimental = {
              test_table = true,
            },
            args = { "-count=1", "-timeout=60s" },
          }),
        },
        -- Adicionando log para depuração
        log_level = vim.log.levels.DEBUG,
        discovery = {
          -- Forçando o neotest a olhar para todos os arquivos com "test" no nome
          enabled = true,
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        },
      })

      -- Mapeamentos de teclas como antes
      vim.keymap.set("n", "<leader>tt", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run current file tests" })

      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })

      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open({ enter = true })
      end, { desc = "Show test output" })

      vim.keymap.set("n", "<leader>tw", function()
        require("neotest").watch.toggle()
      end, { desc = "Toggle watching tests" })

      -- Adicionando um mapeamento para ver o log do neotest
      vim.keymap.set("n", "<leader>tl", function()
        vim.cmd("edit " .. vim.fn.stdpath("cache") .. "/neotest.log")
      end, { desc = "Show neotest log" })
    end,
  },
}
