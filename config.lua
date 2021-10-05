lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "storm"
vim.opt.shiftwidth = 4
-- lvim.transparent_window = true
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-y>"] = "y$"
lvim.keys.normal_mode["<F9>"] = "y$"
vim.opt.relativenumber = true
vim.opt.cursorline = false
lvim.keys.normal_mode["<F5>"] = ":TermExec cmd='clear; g++ % &&./a.out && rm a.out'<cr>"
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
lvim.plugins = {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
            vim.g.indent_blankline_filetype_exclude = {
                "log",
                "gitcommit",
                "vimwiki",
                "markdown",
                "json",
                "txt",
                "vista",
                "NvimTree",
                "git",
                "TelescopePrompt",
                "undotree",
                "flutterToolsOutline",
                "org",
                "orgagenda",
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "",
            }
            vim.g.indent_blankline_use_treesitter = true
            vim.g.indent_blankline_show_current_context = true
            vim.g.indent_blankline_context_patterns = {
                "class",
                "return",
                "function",
                "method",
                "^if",
                "^do",
                "^switch",
                "^while",
                "jsx_element",
                "^for",
                "^object",
                "^table",
                "block",
                "arguments",
                "if_statement",
                "else_clause",
                "jsx_element",
                "jsx_self_closing_element",
                "try_statement",
                "catch_clause",
                "import_statement",
                "operation_type",
            }
            vim.wo.colorcolumn = "99999"
        end,
    },
    { "norcalli/nvim-colorizer.lua" },
    { "tpope/vim-surround" },
    { "folke/tokyonight.nvim" },
    { "sudormrfbin/cheatsheet.nvim" },
    { "dsznajder/vscode-es7-javascript-react-snippets" },
    { "p00f/nvim-ts-rainbow" },
    { "mattn/emmet-vim", ft = { "html", "javascriptreact" } },
    {
        "andweeb/presence.nvim",
        event = "BufRead",
        setup = function()
            vim.g.presence_auto_update = 1
            vim.g.presence_main_image = "file"
            vim.g.presence_client_id = "793271441293967371"
            vim.g.presence_debounce_timeout = 10
            vim.g.presence_blacklist = {}
        end,
    },
    { "anburocky3/bootstrap5-snippets" },
    {
        "RishabhRD/nvim-cheat.sh",
        requires = "RishabhRD/popfix",
        cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
        config = function()
            vim.g.cheat_default_window_layout = "vertical_split"
        end,
    },
    {
        "tzachar/cmp-tabnine",
        config = function()
            local tabnine = require("cmp_tabnine.config")
            tabnine:setup({
                max_lines = 1000,
                max_num_results = 20,
                sort = true,
            })
        end,
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
    },
    {
        "IndianBoy42/hop.nvim",
        event = "BufRead",
        config = function()
            require("user.hop").config()
        end,
    },
}

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

vim.cmd([[
    autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
    let g:user_emmet_leader_key=','
    let g:user_emmet_mode='n'
    augroup SaveManualFolds
        autocmd!
        au BufWinLeave, BufLeave ?* silent! mkview
        au BufWinEnter           ?* silent! loadview
    augroup END
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
]])

lvim.lang.html.formatters = { { exe = "prettier" } }
lvim.lang.javascript.formatters = { { exe = "prettier" } }
lvim.lang.javascript.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.linters = { { exe = "eslint" } }
lvim.lang.javascriptreact.formatters = { { exe = "prettier" } }
lvim.lang.lua.formatters = { { exe = "stylua", args = { "--indent-type", "Spaces" } } }

require("luasnip").filetype_extend("javascriptreact", { "html" })
require("user.lualine").config()
require("user.neovim").config()
