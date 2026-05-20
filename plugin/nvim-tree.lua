-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<Leader>nt', ':NvimTreeOpen<CR>')
vim.keymap.set('n', '<Leader>nf', ':NvimTreeFindFile<CR>')

require('nvim-tree').setup {
  filters = {
    dotfiles = false,
  },
  view = {
    width = 55,
  },
}
