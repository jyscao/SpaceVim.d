" useful key bindings
" nnoremap Q: q:
" nnoremap Q/ q/



""" let g:spacevim_disabled_plugins = []


let g:spacevim_custom_plugins = [
      \['tpope/vim-eunuch'],
      \['dahu/vimple'],
      \['AndrewRadev/linediff.vim'],
      \['takac/vim-hardtime'],
      \]

" Hardtime settings
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []
let g:hardtime_timeout = 1000
let g:hardtime_showmsg = 1
" let g:hardtime_ignore_buffer_patterns = [ 'CustomPatt[ae]rn', 'NERD.*' ]
" let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
" let g:hardtime_maxcount = 2


" Self-load CtrlSpace if not active/enabled (due to not being merged into SpaceVim)
if !SpaceVim#layers#isLoaded('ctrlspace')
  call add(g:spacevim_custom_plugins, ['vim-ctrlspace/vim-ctrlspace'])
  " CtrlSpace default settings
  let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
  let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
  let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
  let g:CtrlSpaceSaveWorkspaceOnExit = 1
  let g:CtrlSpaceGlobCommand = 'rg --color=never --files'
endif





" bootstrap functions
function! my_config#before() abort

endfunction


function! my_config#after() abort
  set inccommand=nosplit          " display result of incremental commands (ex. :%s/pat1/pat2/g)

  " Terminal tweaks
  tnoremap jk <C-\><C-n>                            " allow jk to exit into normal mode
  autocmd TermOpen term://* startinsert             " enter terminal buffer in Insert instead of Normal mode
  autocmd! Terminal WinEnter,BufWinEnter term://*   " remove term://* startinsert autocmd set in .SpaceVim/config/neovim.vim
                                                    " for both WinEnter & BufWinEnter events
endfunction



" Adding this plugin last, as specified in project README
call add(g:spacevim_custom_plugins, ['ryanoasis/vim-devicons'])
