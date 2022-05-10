set nocompatible
set runtimepath+=/home/koyam/.cache/dein/repos/github.com/Shougo/dein.vim
call dein#load_state('/home/koyam/.cache/nvim/dein')
  call dein#begin('/home/koyam/.cache/nvim/dein')
   let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
   let s:toml      = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/lazy.toml'
  call dein#add('/home/koyam/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('nvim-treesitter/nvim-treesitter', { 'merged': 0 })
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  autocmd VimEnter * call dein#call_hook('post_source')
  call dein#end()
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif
autocmd VimEnter * call dein#call_hook('post_source')

" End dein Scripts-----------------------
" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  }
}
EOF
let g:python3_host_prog = '/usr/bin/python3'
colorscheme hatsunemiku
hi! Normal ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
hi! LineNr ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
set showmatch
set termguicolors
set matchtime=1
set matchpairs& matchpairs+=<:>
hi MatchParen cterm=bold ctermbg=201 ctermfg=0
set nobackup
set noswapfile
let mapleader=" "
nnoremap <SPACE> <Nop>
set noshowmode
autocmd BufWritePost  ~/.config/nvim/init.vim  so ~/.config/nvim/init.vim
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set encoding=utf-8
scriptencoding utf-8
noremap <silent> jj <Esc>
set backspace=indent,eol,start
nnoremap <C-Left>w <C-Left>wc 
nnoremap <C-p> :DeniteProjectDir file/rec -start-filter <CR>
nnoremap <C-g> :DeniteProjectDir grep<CR>
nnoremap <leader>dt :lua require"dapui".toggle()<CR>
nnoremap <leader>ds :lua require"dapui".eval()<CR>
nnoremap <leader><leader>e <cmd>TroubleToggle<cr>
nnoremap <Leader>. :lua require("trouble").next({skip_groups = true, jump = true})<CR>
nnoremap <Leader>, :lua require("trouble").previous({skip_groups = true, jump = true})<CR>
nnoremap <Leader>[ :bnext<CR>
nnoremap <Leader>] :bprev<CR>
nnoremap <Leader><tab> :Denite buffer<CR>
nnoremap <Leader>d "_dd
nnoremap x "_x
vnoremap x "_x

:nmap <c-s> :w<CR>
inoremap <Esc> <Esc>lh
:tnoremap <Esc> <C-\><C-n>
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
command! -nargs=* Tv split | wincmd L | terminal <args>
autocmd TermOpen * startinsert
set clipboard+=unnamedplus
let g:rustfmt_autosave = 1
filetype plugin indent on
highlight Blamer guifg=lightred guibg=none
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
let g:blamer_enabled = 1
let g:blamer_delay =400
set completeopt=menuone,noinsert,noselect
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
nmap s <Plug>(easymotion-overwin-f2)
map  w <Plug>(easymotion-w)
map  b <Plug>(easymotion-b)
let g:EasyMotion_smartcase = 1

"dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <F9> :lua require'dap'.toggle_breakpoint()<CR>

"ultest
nnoremap <leader>tf <cmd>Ultest <CR> 
nnoremap <leader>tl <cmd>UltestLast <CR>
nnoremap <leader>ts <cmd>UltestSummary <CR>
nnoremap <leader>tn <cmd>UltestNearest <CR>
nnoremap <leader>tc <cmd>UltestClear <CR>

"goto-preview
nnoremap <leader>ps <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pc <cmd>lua require('goto-preview').close_all_win()<CR>
"symbols-outline
nnoremap <leader>a :SymbolsOutline<CR>
"nvim-tree
nnoremap <leader>z :NvimTreeFindFileToggle<CR>
"lazygit
nnoremap lgt :LazyGit <CR>


" Change file/rec command.
call denite#custom#var('file/rec', 'command',
  \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
call denite#custom#var('grep', {
		\ 'command': ['rg'],
		\ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
		\ 'recursive_opts': [],
		\ 'pattern_opt': ['--regexp'],
		\ 'separator': ['--'],
		\ 'final_opts': [],
		\ })

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> d
	  \ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')
	nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
endfunction
let s:denite_win_width_percent = 0.75
let s:denite_win_height_percent = 0.64
call denite#custom#option('default', 'statusline', v:false)
call denite#custom#map('insert', '<esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<esc>', '<denite:quit>', 'noremap')
call denite#custom#map('insert', '<C-j>', '<denite:do_action:split>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:do_action:vsplit>', 'noremap')
noremap <leader>g :DeniteCursorWord grep<CR>
if exists('g:loaded_lightline')
  call denite#custom#option('default', 'statusline', v:false)
endif
function! MyMode()
  if &ft == 'denite'
    let mode_str = substitute(denite#get_status_mode(), "-\\| ", "", "g")
    call lightline#link(tolower(mode_str[0]))
    return mode_str
  else

    return winwidth('.') > 60 ? lightline#mode() : ''
  endif
endfunction


" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_matched_char': 'WildMenu',
    \ 'highlight_matched_range': 'Visual',
    \ 'highlight_window_background': 'Visual',
    \ 'highlight_filter_background': 'StatusLine',
    \ 'highlight_prompt': 'StatusLine',
    \ })

autocmd VimEnter * call dein#call_hook('post_source')

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})
augroup END

lua <<EOF
  function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end
EOF
" VSnip
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

autocmd BufWritePre *.go lua OrgImports(1000)
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" GitGutter
let g:gitgutter_sign_added = 'a'
let g:gitgutter_sign_modified = 'm'
let g:gitgutter_sign_removed = 'd'
"highlight CursorLine guibg=#144e52 ctermbg=22
set mouse+=a
let g:webdevicons_enable_denite = 1

