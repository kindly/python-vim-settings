function! Jslint()
    execute 'w'
    let nose_output = system('js ~/.vim/mylintrun.js ' . expand('%')  )
    "let nose_output = system('/home/david/libraries/v8-trunk/shell_g ~/.vim/mylintrun.js ' . expand('%')  )
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command! Jslint   call Jslint()

