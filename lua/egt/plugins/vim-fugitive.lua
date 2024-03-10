return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", "vim.cmd.Git", { desc = "start a [G]it command" })
		end,
	},
}
