
function! JsTest()
    execute 'w'
    let nose_output = system('java -jar /home/david/.vim/JsTestDriver-1.2.jar --tests all --captureConsole')
    execute 'tabnew'
    setlocal buftype=nofile readonly modifiable
    silent put=nose_output
    keepjumps 0d
    setlocal nomodifiable
endfunction

command! JsTest   call JsTest()
