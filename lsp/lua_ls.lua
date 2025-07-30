return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	-- capabilities = {},
	Settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				checkThirdParty = false,
				-- Tells luals where to find all the Lua files that you have loaded
				-- for your neovim configuration.
				library = {
					"${3rd}/luv/library",
					unpack(vim.api.nvim_get_runtime_file("lua", true)),
				},
				-- If luals is really slow on your computer, you can try this instead:
				-- library = { vim.env.VIMRUNTIME },
			},
			completion = {
				callSnippet = "Replace",
			},
			-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = { globals = { "vim" }, disable = { "missing-fields" } },
		},
	},
}
