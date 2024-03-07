if not pcall(require, "luasnip") then
	return
end
require("luasnip.loaders.from_vscode").lazy_load()
local ls = require("luasnip")
local types = require("luasnip.util.types")
ls.setup({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

local s = ls.s
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("lua", {
	s("req", fmt("local {} = require('{}')", { i(1), rep(1) })),
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/egt/snips/ft/*.lua", true)) do
	loadfile(ft_path)()
end

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
