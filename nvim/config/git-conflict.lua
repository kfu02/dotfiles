-- See: https://github.com/akinsho/git-conflict.nvim
require('git-conflict').setup {
    default_mappings = false
}

-- make these keymaps global + use leader
vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', '<leader>ck', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', '<leader>cj', '<Plug>(git-conflict-next-conflict)')
vim.keymap.set('n', '<leader>cl', '<cmd>GitConflictListQf<CR>')
