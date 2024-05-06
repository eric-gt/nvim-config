-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- open file tree
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>", { desc = "open file tree" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- update Lazy packages
vim.keymap.set("n", "<leader>LU", "<cmd>Lazy update<CR>", { desc = "Check and [U]pdate packages managed by [L]azy" })

--  paste and persist in buffer, aka ThePrimeagen's "greatest remap ever"
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste and preserve buffer" })

-- yank to OS clipboard, aka next greatest remap ever, from asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank line into OS clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to end of line into OS clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete to null buffer" })
-- goto last buffer
vim.keymap.set("n", "<leader>lb", "<cmd>b#<CR>", { desc = "goto [L]ast [B]uffer" })

-- run the last executed Command Mode command. Very useful if you don't want your :s regexes to get out of hand
vim.keymap.set("n", "<leader>lc", "@:", { desc = "execute [L]ast [C]ommand" })

-- move and re-format in Visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move highlighted line up one line and reformat" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move highlighted line down one line and reformat" })

-- don't move cursor after appending bottom line
vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]ump line below up to current line and preserve cursor position" })

-- page up/down and center on cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page [u]p and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page [d]own and center" })

-- center on cursor when iterating through search results
vim.keymap.set("n", "n", "nzzzv", { desc = "move forward to [n]ext result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "move backwards to [N]ext result and center" })

-- start a find/replace on the word under the cursor
vim.keymap.set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "[s]ubstitute current word under cursor" }
)
-- add executable permissions to current buffer
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "make current file e[X]ecutable" })
-- source the current file
vim.keymap.set("n", "<leader>rc", "<cmd>!source %<CR>", { desc = "[R]eload [C]urrent file" })

-- format JSON files
vim.keymap.set("n", "<leader>jq", function()
	vim.cmd("%!jq '.'")
	vim.cmd.write()
end, { desc = "Format [J]SON with J[Q]" })
