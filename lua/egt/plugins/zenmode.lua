return {
	"folke/zen-mode.nvim",
	config = function()
		vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "Toggle [Z]en[M]ode" })
	end,
}
