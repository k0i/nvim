require('gitsigns').setup{
 current_line_blame = true,
 current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 100,
    ignore_whitespace = false,
  },
 on_attach = function(bufnr)
  local gs = package.loaded.gitsigns
  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end
  map('n', '<leader><leader>g', ':Gitsigns setqflist<cr>')
  vim.cmd[[highlight gitsignscurrentlineblame guibg=#191724 guifg=#32CD32]]
end
}
