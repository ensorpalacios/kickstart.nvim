return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
    config = function()
      vim.fn['mkdp#util#install']()
      vim.keymap.set('n', '<Leader>mp', '<Plug>MarkdownPreview', { desc = 'Markdown Preview' })
    end,
  },
}
