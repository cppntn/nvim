-- Insert mode mappings
vim.keymap.set('i', '<C-a>', '<ESC>^i', { desc = "Beginning of line" })
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'End of line' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })

-- Normal mode mappings
vim.keymap.set('n', ';', ':', { nowait = true })
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer", nowait = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = "Previous buffer", nowait = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'Copy whole file' })
vim.keymap.set('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Toggle line number' })
vim.keymap.set('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative number' })
vim.keymap.set('n', 'j', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = 'Move down' })
vim.keymap.set('n', 'k', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = 'Move up' })
vim.keymap.set('n', '<Up>', 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, desc = 'Move up' })
vim.keymap.set('n', '<Down>', 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, desc = 'Move down' })
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>h', ':sp | terminal<CR>', { desc = "Horizontal terminal split", nowait = true })
vim.keymap.set('n', '<leader>v', ':vsp | terminal<CR>', { desc = "Vertical terminal split", nowait = true })
vim.keymap.set('n', '<leader>x', function()
  if vim.bo.buftype == 'terminal' then
    -- Do nothing if it's a terminal
    return
  end
  local buf_count = vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)'))
  if buf_count > 1 then
    vim.cmd('bp | bd #')
  else
    vim.cmd('enew | bd #')
  end
end, { desc = "Close buffer", noremap = true, silent = true })

-- Terminal mode mappings
vim.keymap.set('t', '<S-Space>', '<Space>', { nowait = true })
vim.keymap.set('t', '<S-CR>', '<CR>', { nowait = true })
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = "Switch to Normal mode in Terminal", nowait = true })
