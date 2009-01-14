function! NoseTest()
    let nose_output = system('nosetests')
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command!  NoseTest          call NoseTest()


function! NoseTestwc()
    let nose_output = system('nosetests --with-coverage --cover-package=reformed')
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command!  NoseTestwc          call NoseTestwc()











