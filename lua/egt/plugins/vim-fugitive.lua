return {
	{
		"tpope/vim-fugitive",
		event = { "VimEnter" },
		config = function()
			vim.keymap.set("n", "<leader>gs", "vim.cmd.Git", { desc = "start a [G]it command" })
		end,
	},
}
