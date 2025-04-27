return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      disable_completion = true,
    },
    config = function()
      vim.g.copilot_enabled = 0

      vim.api.nvim_create_user_command("CopilotToggle", function()
        if vim.g.copilot_enabled == 0 then
          vim.g.copilot_enabled = 1
          print("Copilot ativado")
        else
          vim.g.copilot_enabled = 0
          print("Copilot desativado")
        end
      end, {})
    end,
  },
}
