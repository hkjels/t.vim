" T location
if !exists("g:t")
	let g:tprg="t find -C -G"
endif


" T
function! s:T(cmd, args)
    redraw
    echo "Searching ..."

    " If no pattern is provided, search for the word under the cursor
    if empty(a:args)
        let l:grepargs = expand("<cword>")
    else
        let l:grepargs = a:args
    end

    let g:tformat="%f:%l:%m"
    let grepprg_bak=&grepprg
    let grepformat_bak=&grepformat

    try
        let &grepprg=g:tprg
        let &grepformat=g:tformat
        silent execute a:cmd . " " . l:grepargs
    finally
        let &grepprg=grepprg_bak
        let &grepformat=grepformat_bak
    endtry

    if a:cmd =~# '^l'
        botright lopen
    else
        botright copen
    endif

    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
    exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
    exec "nnoremap <silent> <buffer> o <CR>"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> v <C-W><C-W><C-W>v<C-L><C-W><C-J><CR>"
    exec "nnoremap <silent> <buffer> gv <C-W><C-W><C-W>v<C-L><C-W><C-J><CR><C-W><C-J>"

    redraw!
endfunction

command! -bang -nargs=* -complete=file T call s:T('grep<bang>',<q-args>)
