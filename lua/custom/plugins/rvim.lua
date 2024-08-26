return {
  {
    'R-nvim/R.nvim',
    config = function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<Enter>', '<Plug>RDSendLine', {})
      vim.api.nvim_buf_set_keymap(0, 'v', '<Enter>', '<Plug>RSendSelection', {})

      -- Remap run selection (clash with Telescope)
      vim.keymap.set('v', '<leader>sss', '<Plug>RSendSelection')

      -- Map assignment operator '<-'
      assignment_keymap = '__'

      -- Create a table with the options to be passed to setup()
      local opts = {
        R_args = { '--quiet', '--no-save' },
        min_editor_width = 72,
        rconsole_width = 78,
        disable_cmds = {
          'RClearConsole',
          'RCustomStart',
          'RSPlot',
          'RSaveClose',
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == 'true' then
        opts.auto_start = 1
        opts.objbr_auto_start = true
      end
      require('r').setup(opts)
    end,
    lazy = false,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'markdown', 'markdown_inline', 'r', 'rnoweb', 'yaml' },
      }
    end,
  },
  'R-nvim/cmp-r',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('cmp').setup { sources = { { name = 'cmp_r' } } }
      require('cmp_r').setup {}
    end,
  },
}
