set nocompatible
let s:dein_base = '/Users/koyama.sojiro/.cache/dein'
let s:dein_src = '/Users/koyama.sojiro/.cache/dein/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_src
call dein#begin(s:dein_base)
let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
let s:toml      = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/lazy.toml'
call dein#add(s:dein_src)
call dein#add('nvim-treesitter/nvim-treesitter-textobjects')
call dein#add('nvim-treesitter/nvim-treesitter',{'merged' : 0})
call dein#load_toml(s:toml, {'lazy' : 0})
call dein#load_toml(s:lazy_toml, {'lazy' : 1})
call dein#end()

filetype plugin indent on 
syntax enable
if dein#check_install()
   call dein#install()
endif
autocmd VimEnter * call dein#call_hook('post_source') " End dein Scripts-----------------------
" TreeSitter

set matchpairs& matchpairs+=<:>
hi MatchParen cterm=bold ctermbg=201 ctermfg=0
set nobackup
nnoremap <C-Left>w <C-Left>wc 
nnoremap <Leader>v <cmd>Telescope neoclip a<CR>
nnoremap <Leader>[ <cmd>bnext<CR>
nnoremap <Leader>] <cmd>bprev<CR>
nnoremap <Leader><tab> <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap <silent><c-t> <Cmd>lua require('FTerm').toggle()<CR>
nnoremap <Leader><leader>p <cmd>lua require'telescope'.extensions.project.project{}<CR>
nnoremap <Leader><leader>z <cmd>Twilight<CR>
nnoremap gg gg0
nnoremap G G$
nnoremap q vegyy
nnoremap tn <cmd>$tabnew<CR>
nnoremap t] <cmd>tabn<CR>
nnoremap t[ <cmd>tabp<CR>
nnoremap td <cmd>tabclose<CR>
nnoremap <CR> G
nnoremap <leader>r <cmd>lua require('spectre').open_visual({select_word=true})<CR>
nnoremap <leader>ra <cmd>lua require('spectre.actions').run_replace()<CR>
nnoremap <leader>rc <cmd>lua require('spectre.actions').run_current_replace()<CR>

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
highlight Blamer guifg=#90EE90 guibg=none
"autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
let g:blamer_enabled = 1
let g:blamer_delay =400
set completeopt=menuone,noinsert,noselect
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
nmap s <Plug>(easymotion-s)
map  w <Plug>(easymotion-w)
map  b <Plug>(easymotion-b)
map  e <Plug>(easymotion-lineforward)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='12345asdfqwegzxc'
"dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <F9> :lua require'dap'.toggle_breakpoint()<CR>

"goto-preview
nnoremap <leader>pr <cmd>lua require('goto-preview').goto_preview_references()<CR>
nnoremap <leader>ps <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap <leader>pi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap <leader>pc <cmd>lua require('goto-preview').close_all_win()<CR>
"symbols-outline
nnoremap <leader>a :SymbolsOutline<CR>
"nvim-tree
nnoremap <leader>z :NvimTreeFindFileToggle <CR>
"lazygit
nnoremap lgt :LazyGit <CR>
let g:lazygit_floating_window_winblend = 0
let g:lazygit_floating_window_use_plenary = 0
"resize
let g:winresizer_start_key = '<leader>1'


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
imap <expr> <S-Tab> vsnip#jumpable(-1)  ?  '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop']
\}

let g:ale_linters_explicit = 1


" Let's leave a column for the signs so that the left side of the window doesn't move
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1
set guicursor=a:blinkon100
set spelllang=en_us
set spell
