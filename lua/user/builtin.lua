local M = {}

M.config = function()
    lvim.builtin.telescope.defaults.file_ignore_patterns = { ".git", "node_modules" }
    lvim.builtin.dashboard.active = true
    lvim.builtin.terminal.active = true
    lvim.builtin.nvimtree.setup.view.side = "right"
    lvim.builtin.nvimtree.show_icons.git = 1
    lvim.builtin.treesitter.ensure_installed = "maintained"
    lvim.builtin.treesitter.ignore_install = { "haskell" }
    lvim.builtin.treesitter.highlight.enabled = true
    lvim.builtin.treesitter.rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
        colors = {
            "#f7768e",
            "#9ece6a",
            "#e0af68",
            "#7aa2f7",
            "#bb9af7",
            "#7dcfff",
        },
    }

    lvim.builtin.treesitter.autotag.enable = true

    lvim.builtin.dashboard.custom_header = {
        "                                                       ",
        "                                                       ",
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }
end

return M
