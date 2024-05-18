return {
	{
		"leoluz/nvim-dap-go",
		lazy = true,
		ft = { "go" },
		config = function()
			require("dap-go").setup({})
			vim.keymap.set("n", "<leader>dgt", function()
				require("dap-go").debug_test()
			end, { desc = "[D]ebug [G]o [T]est" })
		end,
	},
}
