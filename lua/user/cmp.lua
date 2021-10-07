local M = {}

M.config = function()
    lvim.builtin.cmp.sources = {
        { name = "nvim_lsp" },
        { name = "cmp_tabnine", max_item_count = 3 },
        { name = "buffer", max_item_count = 5 },
        { name = "path", max_item_count = 5 },
        { name = "luasnip", max_item_count = 3 },
        { name = "nvim_lua" },
    }
    lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
    lvim.builtin.cmp.formatting = {
        format = function(entry, vim_item)
            local cmp_kind = require("user.lsp_kind").cmp_kind
            vim_item.kind = cmp_kind(vim_item.kind)
            vim_item.menu = ({
                buffer = "(Buffer)",
                nvim_lsp = "(LSP)",
                luasnip = "(Snip)",
                treesitter = " ",
                nvim_lua = "(NvLua)",
                spell = " 暈",
                emoji = "  ",
                path = "  ",
                calc = "  ",
                cmp_tabnine = "  ",
            })[entry.source.name]
            vim_item.dup = ({
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
            })[entry.source.name] or 0
            return vim_item
        end,
    }
end

return M
