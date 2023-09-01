local hop = require('hop')

vim.keymap.set('n', '<leader><leader>w', function() hop.hint_words() end, { desc = 'Hop to word' })
