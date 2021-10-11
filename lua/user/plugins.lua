local M = {}

local autoPairsSettings = function()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, autopairs_completion = pcall(require, "nvim-autopairs.completion.cmp")
    if not (present1 or present2) then
        return
    end
    autopairs.setup()
    autopairs_completion.setup({
        map_complete = true,
        map_cr = true,
    })
end

M.config = function()
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
        {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
        },
        { "tpope/vim-surround" },
        { "folke/tokyonight.nvim" },
        { "sudormrfbin/cheatsheet.nvim", cmd = { "Cheatsheet" } },
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
--         {
--             "tzachar/cmp-tabnine",
--             config = function()
--                 local tabnine = require("cmp_tabnine.config")
--                 tabnine:setup({
--                     max_lines = 1000,
--                     max_num_results = 20,
--                     sort = true,
--                 })
--             end,
--             run = "./install.sh",
--             requires = "hrsh7th/nvim-cmp",
--         },
        {
            "IndianBoy42/hop.nvim",
            event = "BufRead",
            config = function()
                require("user.hop").config()
            end,
        },
        { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
    }
    autoPairsSettings()
end
return M
