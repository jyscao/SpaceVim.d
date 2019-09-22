" useful key bindings
" nnoremap Q: q:
" nnoremap Q/ q/



let g:spacevim_custom_plugins = [
      \['dahu/vimple'],
      \['tpope/vim-eunuch'],
      " \['AndrewRadev/linediff'],
      \]



" bootstrap functions
function! my_config#before() abort

endfunction

function! my_config#after() abort
  set inccommand=nosplit      "display result of incremental commands (ex. :%s/pat1/pat2/g)
  tnoremap jk <C-\><C-n>      "allow jk to exit into normal mode
  " autocmd TermOpen term://* startinsert     " enter terminal buffer in Insert instead of Normal
endfunction
