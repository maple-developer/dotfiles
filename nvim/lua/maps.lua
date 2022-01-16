vim.g.mapleader = ";"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 复制当前行文本
map('n', 'Y', 'y$', opts)
-- 向上或向下跳转到搜索文本处，并将其置于屏幕中心
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
-- 映射保存或退出neovim操作
map('n', '<A-s>', '<cmd>w<cr>', opts)
map('n', '<A-q>', '<cmd>q<cr>', opts)
map('n', '<A-Q>', '<cmd>q!<cr>', opts)
-- 取消高亮
map('n', '<ESC><ESC>', '<cmd>nohlsearch<cr>', opts)
-- 光标窗口间移动
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)
map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-l>', '<C-w>l', opts)
--  文本多行或多字符间跳转
map('n', 'J', '7j', opts)
map('n', 'K', '7k', opts)
map('n', 'H', '7h', opts)
map('n', 'L', '7l', opts)
map('v', 'J', '7j', opts)
map('v', 'K', '7k', opts)
map('v', 'H', '7h', opts)
map('v', 'L', '7l', opts)
-- 切换标签页
map('n', '<leader>tp', '<cmd>tabp<cr>', opts)
map('n', '<leader>tn', '<cmd>tabn<cr>', opts)
map('n', '<leader>tp', '<cmd>tabc<cr>', opts)
map('n', '<leader>to', '<cmd>tabo<cr>', opts)
-- buffer间跳转
map('n', '<A-,>', '<cmd>bp<cr>', opts)
map('n', '<A-.>', '<cmd>bn<cr>', opts)
map('n', '<A-Tab>', '<cmd>b#<cr>', opts)
map('n', '<A-d>', '<cmd>bdelete<cr>', opts)
-- 映射方向键
map('i', '<C-j>', '<Down>', opts)
map('i', '<C-k>', '<Up>', opts)
map('i', '<C-p>', '<Left>', opts)
map('i', '<C-l>', '<Right>', opts)
-- 缩进或后退一个tab键长度
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)
