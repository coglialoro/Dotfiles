-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Flutter Hot Reload",
  group = vim.api.nvim_create_augroup("flutter", { clear = true }),
  pattern = "*.dart",
  callback = function()
    vim.cmd(":silent !kill -SIGUSR1 $(pgrep flutter)")
  end,
})
