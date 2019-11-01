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
      \['AndrewRadev/linediff.vim'],
      \['takac/vim-hardtime'],
      \['jyscao/vim-greprtpscr'],
      \]
      " \['guns/vim-sexp']
      " \['tpope/vim-sexp-mappings-for-regular-people']



" Vim-Sneak settings
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 1
" let g:sneak#label = 1     " what is sneak-label-mode?
" g:sneak#label_esc
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S



" Vim-Hardtime settings
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






" " Self-load CtrlSpace if not active/enabled (due to not being merged into SpaceVim)
" if !SpaceVim#layers#isLoaded('ctrlspace')
"   call add(g:spacevim_custom_plugins, ['vim-ctrlspace/vim-ctrlspace'])
"   " CtrlSpace default settings
"   let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
"   let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"   let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"   let g:CtrlSpaceSaveWorkspaceOnExit = 1
"   let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
" endif





"TODO: split before and after bootstraps to be in different files to separate
"out sourcing
"NOTE: does moving all commands from inside my_config#after outside still work???
"NOTE: bootstrap functions <= does removing reference to this in init.toml stop custom_plugins from being sourced?

function! my_config#before() abort
  call SpaceVim#logger#info("bootstrap_before called")      " log bootstrap_before call
endfunction

function! my_config#after() abort
  call SpaceVim#logger#info("bootstrap_after called")       " log bootstrap_after call
  set inccommand=nosplit          " display result of incremental commands (ex. :%s/pat1/pat2/g)
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
