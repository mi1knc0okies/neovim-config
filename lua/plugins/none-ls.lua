-- None-ls for additional formatters and linters
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    
    null_ls.setup({
      sources = {
        -- Additional formatters not covered by conform.nvim
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.jq,
        
        -- Additional linters not covered by nvim-lint
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.vale,
        
        -- Code actions
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.eslint_d,
      },
    })
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
