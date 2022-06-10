require 'plugins'
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require'packer'.install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require'packer'.update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require'packer'.sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require'packer'.clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require'packer'.compile()]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])



----
