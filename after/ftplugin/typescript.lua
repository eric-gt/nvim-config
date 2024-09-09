vim.opt.et = true
vim.opt.ts = 2
vim.opt.sw = 2
vim.opt.sts = -1

local dap = require("dap")

vim.keymap.set("n", "<leader>to", "<Cmd>TSToolsOrganizeImports<CR>", { desc = "[T]ypescript: [O]rganize Imports" })
vim.keymap.set("n", "<leader>ts", "<Cmd>TSToolsSortImports<CR>", { desc = "[T]ypescript: [S]ort Imports" })
vim.keymap.set("n", "<leader>tr", "<Cmd>TSToolsRemoveUnused<CR>", { desc = "[T]ypescript: [R]emove Unused Imports" })
vim.keymap.set("n", "<leader>ta", "<Cmd>TSToolsAddMissingImports<CR>", { desc = "[T]ypescript: [A]dd Missing Imports" })
vim.keymap.set("n", "<leader>tf", "<Cmd>TSToolsFixAll<CR>", { desc = "[T]ypescript: [F]ix All Errors" })
vim.keymap.set("n", "<leader>tc", "<Cmd>TSToolsRenameFile<CR>", { desc = "[T]ypescript: [C]hange Filename" })

dap.adapters["pwa-node"] = {
	type = "server",
	port = "${port}",
	executable = {
		command = "js-debug-adapter",
		args = { "${port}" },
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Mocha Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/mocha/bin/mocha.js",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end
