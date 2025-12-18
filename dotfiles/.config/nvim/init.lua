-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- 'd' deletes without affecting clipboard (black hole register)
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("x", "d", '"_d', { noremap = true })

-- 'x' cuts to clipboard (default behavior)
vim.keymap.set("n", "x", "x", { noremap = true }) -- This is redundant but explicit
vim.keymap.set("x", "x", "x", { noremap = true })
vim.keymap.set("n", "<D-S-C-M-CR>", ":wq<CR>", { noremap = true })
