local ok, conform = pcall(require, 'conform')
if not ok then
  return
end

conform.setup {
  formatters_by_ft = {
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    vue = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    markdown = { 'prettier' },
    html = { 'prettier' },
  },
}

vim.keymap.set('n', '<Leader>p', function()
  conform.format { lsp_format = 'never' }
end)
