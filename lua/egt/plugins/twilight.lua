return {
	{
		"folke/twilight.nvim",
		config = function()
			vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>", { desc = "Toggle [T][w]ilight.nvim" })
		end,
	},
}
