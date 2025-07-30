-- local group = vim.api.nvim_create_augroup("terraform_opts", { clear = true })

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = group,
-- 	pattern = { "*.tf" },
-- 	command = ":silent! !terraform validate -json > ./tmp/validation.json",
-- })
