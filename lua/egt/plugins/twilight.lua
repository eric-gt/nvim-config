return {
	{
		"folke/twilight.nvim",
		lazy = true,
		keys = { "<leader>zm", "<leader>tw" },
		config = function()
			vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle [T][w]ilight.nvim" })
		end,
	},
}
