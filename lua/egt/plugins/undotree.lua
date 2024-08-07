return {
	{
		"mbbill/undotree",
		lazy = true,
		keys = { "<leader>u" },
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle the [U]ndoTree window" })
		end,
	},
}
