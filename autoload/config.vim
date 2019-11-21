" TODO:
" useful key bindings
" nnoremap Q: q:
" nnoremap Q/ q/



""" let g:spacevim_disabled_plugins = []

" BUG: All custom plugins no longer working?!
let g:spacevim_custom_plugins = [
      \['tpope/vim-eunuch'],
      \['tpope/vim-rhubarb'],
      \['lambdalisue/gina.vim'],
      \['jreybert/vimagit'],
      \['dahu/vimple'],
      \['justinmk/vim-sneak'],      
      \['chaoren/vim-wordmotion'],
      \['psliwka/vim-smoothie'],
      \['AndrewRadev/linediff.vim'],
      \['takac/vim-hardtime'],
      \['jyscao/vim-greprtpscr'],
      \]
      " \['guns/vim-sexp']
      " \['tpope/vim-sexp-mappings-for-regular-people']
      " \['sillybun/vim-repl']
      " \['norcalli/nvim-colorizer.lua']
      " \['neovim/nvimdev.nvim']
      " \['terryma/vim-smooth-scroll'],



" sneak.vim settings
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 1
" let g:sneak#label = 1     " what is sneak-label-mode?
" g:sneak#label_esc
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S



" Hardtime settings
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "<DEL>"] ", '<Backspace>/<BS>'
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 1000
" let g:hardtime_showmsg = 1
" let g:hardtime_ignore_buffer_patterns = [ 'CustomPatt[ae]rn', 'NERD.*' ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2
"""TODO: configure HardTimeOn for git, terminal, SpaceVim special buffers, etc.



" " vim-smooth-scroll mappings
" noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
" noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
" noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
" noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
" let g:smoothie_base_speed = 15


" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-x': 'split',
  " \ 'ctrl-v': 'vsplit' }





"TODO: split before and after bootstraps to be in different files to separate
"out sourcing
"NOTE: does moving all commands from inside my_config#after outside still work???
"NOTE: bootstrap functions <= does removing reference to this in init.toml stop custom_plugins from being sourced?

function! my_config#before() abort
  " TODO: add debug level logging for SpaceVim; then log using SpaceVim#logger#debug
  call SpaceVim#logger#info("bootstrap_before called")
endfunction

function! my_config#after() abort
  call SpaceVim#logger#info("bootstrap_after called")
  set inccommand=split            " display result of incremental commands (ex. :%s/pat1/pat2/g)
  set updatetime=500              " used by GitGutter as its update interval 
  set formatprg=par               " program used to reflow
  set showtabline=1               " only show tabline with >1 tabs
  set guicursor+=a:blinkon0       " disable cursor blinking in all modes
  """ Terminal tweaks
  tnoremap jk <C-\><C-n>                            " allow jk to exit into normal mode
  autocmd TermOpen term://* startinsert             " enter terminal buffer in Insert instead of Normal mode
  autocmd! Terminal WinEnter,BufWinEnter term://*   " remove term://* startinsert autocmd set in .SpaceVim/config/neovim.vim
                                                    " for both WinEnter & BufWinEnter events
endfunction



" Adding this plugin last, as specified in project README
" call add(g:spacevim_custom_plugins, ['ryanoasis/vim-devicons'])
