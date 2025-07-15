-- Automatically install formatters and linters

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "prettier",
        "black",
        "isort", 
        "stylua",
        
        -- Linters
        "flake8",
        "eslint_d",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
