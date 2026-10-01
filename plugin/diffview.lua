local ok, diffview = pcall(require, 'diffview')
if not ok then
  return
end

diffview.setup {
  enhanced_diff_hl = true,
}

vim.keymap.set('n', '<Leader>gd', ':DiffviewOpen<CR>')
vim.keymap.set('n', '<Leader>gD', ':DiffviewClose<CR>')
vim.keymap.set('n', '<Leader>gh', ':DiffviewFileHistory %<CR>')
vim.keymap.set('n', '<Leader>gH', ':DiffviewFileHistory<CR>')
