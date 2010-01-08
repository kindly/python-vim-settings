function! NoseTest()
    let nose_output = system('nosetests')
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command!  NoseTest          call NoseTest()

function! Nose(args)
    let nose_output = system('nosetests '. a:args )
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command! -nargs=*  Nose          call Nose(<q-args>)

function! NoseThis(args)
    execute 'w'
    let nose_output = system('nosetests '. a:args . ' -- ' . s:Expand('%'))
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command! -nargs=*  NoseThis          call NoseThis(<q-args>)

function! NoseTestwc()
    let nose_output = system('nosetests --with-coverage --cover-package=reformed')
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command!  NoseTestwc          call NoseTestwc()


function! s:Expand(expr)
    if has('win32')
        return substitute(expand(a:expr), '\', '/', 'g')
    else
        return expand(a:expr)
    endif
endfunction









