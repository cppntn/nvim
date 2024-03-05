-------------------------------------- globals -----------------------------------------
vim.g.transparency = false

-------------------------------------- options ------------------------------------------
vim.opt.laststatus = 3 -- global statusline
vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.fillchars = { eob = " ", diff = "╱" }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

vim.g.mapleader = " "


vim.g.python3_host_prog = 'python'
vim.cmd [[set autoread]]
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})
vim.cmd [[autocmd VimLeave * set guicursor=a:ver25]]


-- Insert mode mappings
vim.keymap.set('i', '<C-a>', '<ESC>^i', {})
-- Normal mode mappings
vim.keymap.set('n', ';', ':', { nowait = true })
-- Terminal mode mappings
-- Map space+shift to space
vim.keymap.set('t', '<S-Space>', '<Space>', { nowait = true })
-- Map enter+shift to enter
vim.keymap.set('t', '<S-CR>', '<CR>', { nowait = true })

-- Switch to the next buffer with Tab
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer", nowait = true })
-- Switch to the previous buffer with Shift+Tab
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = "Previous buffer", nowait = true })

-- Open terminal in horizontal split with no wait
vim.keymap.set('n', '<leader>h', ':sp | terminal<CR>', { desc = "Horizontal terminal split", nowait = true })

-- Open terminal in vertical split with no wait
vim.keymap.set('n', '<leader>v', ':vsp | terminal<CR>', { desc = "Vertical terminal split", nowait = true })

vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = "Switch to Normal mode in Terminal", nowait = true })

vim.keymap.set('n', '<leader>x', ':bd!<CR>', { desc = "Force close current buffer" })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew', 'TermOpen' }, {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      -- Set window-local options for the current window
      vim.wo.scrolloff = 0
      vim.wo.number = false
      vim.wo.relativenumber = false
      -- Start in insert mode
      vim.cmd 'startinsert'
    end
  end,
})

vim.api.nvim_create_autocmd("TermClose", {
  pattern = "*",
  callback = function(args)
    -- Optionally, you can check the exit status if needed:
    -- local exit_status = vim.api.nvim_eval('v:shell_error')
    -- Close the buffer that was hosting the terminal
    -- Use ':bd!' to force the buffer to close without prompting
    vim.cmd(string.format("bd! %d", args.buf))
  end,
})

-- Insert mode mappings
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'End of line' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })

-- Normal mode mappings
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'Clear highlights' })
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
