-- Keymaps
-- Global keymaps that aren't plugin-specific

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Tabs
vim.keymap.set('n', 'tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', 'tj', ':tabnext<CR>', { desc = 'Previous tab' })
vim.keymap.set('n', 'tk', ':tabprevious<CR>', { desc = 'Next tab' })
vim.keymap.set('n', 'tc', ':tabclose<CR>', { desc = 'Close tab' })

-- Insert mode escape
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Use jk in input mode as Esc' })

-- Command mode shortcut
vim.keymap.set('n', ';', ':', { desc = 'Use ; as colon' })
