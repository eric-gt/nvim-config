return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = { "F1", "F2", "F3", "F4", "F5" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"folke/neodev.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			require("neodev").setup({})
			local dap = require("dap")

			vim.keymap.set("n", "<F1>", function()
				dap.continue()
			end, { desc = "DAP Continue" })
			vim.keymap.set("n", "<F2>", function()
				dap.step_over()
			end, { desc = "DAP Step Over" })
			vim.keymap.set("n", "<F3>", function()
				dap.step_into()
			end, { desc = "DAP Step Into" })
			vim.keymap.set("n", "<F4>", function()
				dap.step_out()
			end, { desc = "DAP Step Out" })
			vim.keymap.set("n", "<F5>", function()
				dap.close()
			end, { desc = "DAP Close" })
			vim.keymap.set("n", "<F6>", function()
				require("dapui").open()
				require("dap.ext.vscode").load_launchjs()
			end, { desc = "load from launch.json" })
			vim.keymap.set("n", "<leader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "toggle [b]reakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "set [B]reakpoint condition" })
			vim.keymap.set("n", "<leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "[l]og [p]oint message" })
			vim.keymap.set("n", "<leader>dr", function()
				dap.repl.open()
			end, { desc = "open [d]ap [r]epl" })

			require("nvim-dap-virtual-text").setup({})
			require("dapui").setup()
			vim.keymap.set("n", "<leader>o", function()
				require("dapui").toggle()
			end, { desc = "toggle [o]pen DAP  UI" })

			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
