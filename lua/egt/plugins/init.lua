return { -- I keep these at the top level because they're important/too small for their own file
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ "numToStr/Comment.nvim", opts = {} },
	{
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				transparent = false,
				background = {
					light = "latte",
					dark = "macchiato",
				},
				term_colors = true,
			})
			vim.cmd.colorscheme("catppuccin")

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
