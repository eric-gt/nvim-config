return {
	"folke/zen-mode.nvim",
	lazy = true,
	keys = { "<leader>zm" },
	config = function()
		vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "Toggle [Z]en[M]ode" })
	end,
}
