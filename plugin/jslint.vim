function! Jslint()
    execute 'w'
    let nose_output = system('js ~/.vim/mylintrun.js "`cat ' . expand('%') . '`" | python ~/.vim/format_lint_output.py' )
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command! Jslint   call Jslint()

