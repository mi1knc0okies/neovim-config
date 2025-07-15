

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "jose-elias-alvarez/null-ls.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- Mason setup
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
    
    -- Mason LSP config
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls", -- TypeScript/JavaScript Language Server
        "zls", -- Zig Language Server
        "jsonls",
        "yamlls",
        "bashls",
        "cssls",
        "html",
        "tailwindcss",
      },
      automatic_installation = true,
    })
    
    -- Mason null-ls setup
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier",
        "black",
        "isort",
        "flake8",
        "eslint_d",
        "stylua",
      },
      automatic_installation = true,
    })
    
    -- LSP configuration
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    -- Define on_attach function
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      
      -- Keybindings
      vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.keymap.set("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
      vim.keymap.set("n", "<leader>dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
      vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    end
    
    -- Configure LSP servers
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
    
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.zls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.bashls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.html.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- Completion setup
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      })
    })
    
    -- Null-ls setup for formatting and linting
    local null_ls = require("null-ls")
    
    null_ls.setup({
      sources = {
        -- Formatting
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.stylua,
        
        -- Linting
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.eslint_d,
      },
    })
    
    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
    
    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
