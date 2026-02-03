-- Auto pairs for brackets, quotes, etc.

return {
  "windwp/nvim-autopairs",
  lazy = false, -- Load on startup
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr"
      },
    })

    -- Make sure cmp is available before trying to configure it
    local has_cmp, cmp = pcall(require, "cmp")
    if has_cmp then
      -- Integration with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    end
  end,
}
