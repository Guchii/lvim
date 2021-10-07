lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"
-- lvim.transparent_window = true

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-y>"] = "y$"
lvim.keys.normal_mode["<F9>"] = "y$"
lvim.keys.normal_mode["<F5>"] = ":TermExec cmd='clear; g++ % &&./a.out && rm a.out'<cr>"

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
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linter
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.lua.formatters = { { exe = "stylua", args = { "--indent-type", "Spaces" } } }

require("user.builtin").config()
require("user.plugins").config()
require("user.neovim").config()
require("user.cmp").config()
require("luasnip").filetype_extend("javascriptreact", { "html" })
require("luasnip/loaders/from_vscode").lazy_load({ paths = "~/.config/lvim/snippets" })
require("user.lualine").config()
