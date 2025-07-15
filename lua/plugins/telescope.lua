return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
            ["<C-q>"] = "send_selected_to_qflist",
          }
        }
      }
    })
    
    -- Keymaps
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "Find in current buffer" })
    vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "Find symbols" })
    vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls, { desc = "Find incoming calls" })
    vim.keymap.set("n", "<leader>fm", function() builtin.treesitter({default_text = ":method:"}) end, { desc = "Find methods" })
  end,
}


