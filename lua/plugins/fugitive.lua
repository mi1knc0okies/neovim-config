-- Git integration with fugitive
return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G" },
  keys = {
    { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
    { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
    { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
    { "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git diff" },
  },
}
