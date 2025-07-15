return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    
    -- Set random header from multiple options
    local headers = {
      {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      },
      {
        "                               __                ",
        "  ___     ___    ___   __  __ /\\_\\    ___ ___    ",
        " / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\  ",
        "/\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\ ",
        "\\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/ \\ \\_\\ \\_\\ \\_\\ \\_\\",
        " \\/_/\\/_/\\/____/\\/___/  \\/__/   \\/_/\\/_/\\/_/\\/_/",
        "                                                ",
      },
      {
        "    ██╗   ██╗██╗███╗   ███╗    ",
        "    ██║   ██║██║████╗ ████║    ",
        "    ██║   ██║██║██╔████╔██║    ",
        "    ╚██╗ ██╔╝██║██║╚██╔╝██║    ",
        "     ╚████╔╝ ██║██║ ╚═╝ ██║    ",
        "      ╚═══╝  ╚═╝╚═╝     ╚═╝    ",
        "                               ",
      }
    }
    
    -- Select random header
    math.randomseed(os.time())
    dashboard.section.header.val = headers[math.random(#headers)]
    
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>Neotree toggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }
    
    -- Send config to alpha
    alpha.setup(dashboard.opts)
    
    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
