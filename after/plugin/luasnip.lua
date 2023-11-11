local ls = require("luasnip");

local types = require("luasnip.util.types");
ls.setup({
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" }},
            }
        }
    }
})

local s = ls.s
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
ls.add_snippets("all", {
    ls.parser.parse_snippet("expand", "-- this is what was expanded")
})

ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", { i(1), rep(1)})),
})

vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

vim.keymap.set({"i", "s"}, "<c-j>", function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, {silent = true})

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)



vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
