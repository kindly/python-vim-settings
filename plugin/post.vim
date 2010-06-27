vnoremap <Leader>e "qy:PostQueryVisual<Enter>
command! PostQueryVisual call PostQueryVisual()

nnoremap <Leader>e :PostQueryNormal<CR>
command! PostQueryNormal call PostQueryNormal()

nnoremap <Leader>de :PostOff<Enter>
nnoremap <Leader>dr :PostOff<Enter>
command! PostOff call PostOff()

nnoremap <Leader>qk :PostKill<Enter>
nnoremap <Leader>dk :PostKill<Enter>
command! PostKill call PostKill()

nnoremap <Leader>tt :PostTables<Enter>
command! PostTables call PostTables()

function! UpdateBuffers()

    if !exists("t:post_original_bufnr")
        let t:post_original_bufnr = bufnr('%')
    endif

    if !exists("t:tables_buffer")
        let t:tables_buffer = 0
    endif

    for bufnum in tabpagebuflist()
        if bufnum != t:post_original_bufnr
            if bufnum != t:tables_buffer
                echo bufnum
                execute  'sb '. bufnum
                execute  'edit'
            endif
        endif
    endfor

    execute  'sb '. t:post_original_bufnr
endfunction
    

function! PostQueryVisual()
    if !exists("t:pid_list")
        let t:pid_list = []
    endif

    let t:post_original_bufnr = bufnr('%')

    if !exists ("b:set_check")
        let b:set_check = 1
        au CursorHold <buffer> call UpdateBuffers() 
        au CursorHoldI <buffer> call UpdateBuffers() 
    endif

    let output_filename = "/home/kindly/.postresults/" . strftime("%y%m%d%T") . "postresults.tmp"
    let query_filename = "/home/kindly/.postresults/" . strftime("%y%m%d%T") . "query.tmp"

    let t:selected = getreg('q')


    let custom_command = getline(1)[2:]

    exec 'rightb new ' . query_filename
    silent put=t:selected
    exec 'wq'

    let proc_id = system('psql -a ' . custom_command . ' -f '. query_filename . ' 1> ' . output_filename . ' 2> ' . output_filename .' & echo $!')

    let proc_id = substitute(proc_id, '\n', '','')

    exec 'rightb new ' . output_filename
    set nowrap

    au BufEnter <buffer> e

    call add(t:pid_list, proc_id)

    set autoread
    setlocal filetype=post_res
    execute  'sb '. t:post_original_bufnr

endfunction



function! PostQueryNormal()

    if !exists("t:pid_list")
        let t:pid_list = []
    endif

    if !exists ("b:set_check")
        let b:set_check = 1
        au CursorHold <buffer> call UpdateBuffers() 
        au CursorHoldI <buffer> call UpdateBuffers() 
    endif
    
    let t:post_original_bufnr = bufnr('%')

    let output_filename = "/home/kindly/.postresults/" . strftime("%y%m%d%T") . "postresults.tmp"

    let custom_command = getline(1)[2:]

    execute 'w'

    let proc_id = system('psql -a ' . custom_command . ' -f '. expand('%')    . ' 1> ' . output_filename . ' 2> ' . output_filename .' & echo $!')



    exec 'rightb new ' . output_filename
    set nowrap

    au BufEnter <buffer> e

    call add(t:pid_list, proc_id)
    
    set autoread
    setlocal filetype=post_res
    execute  'sb '. t:post_original_bufnr

endfunction


function! PostTables()

    if exists("t:tables_buffer")
        if t:tables_buffer != 0
            execute  'sb '. t:tables_buffer
            execute 'q'
            execute  'sb '. t:post_original_bufnr
            let t:tables_buffer = 0
            return
        endif
    endif
            

    let custom_command = getline(1)[2:]

    let table_comand = "SELECT table_schema || '.' || table_name || '.' || column_name columns FROM information_schema.columns"

    let output = system('psql ' . custom_command . " -c " . shellescape(table_comand))
    let t:post_original_bufnr = bufnr('%')

    exec 'rightb vnew'
    set nowrap

    au BufEnter <buffer>  checktime

    setlocal buftype=nofile readonly modifiable

    exec 'vertical res 40'
    silent put=output

    setlocal nomodifiable

    let t:tables_buffer = bufnr('%')
    
    setlocal filetype=post_res
    execute  'sb '. t:post_original_bufnr

endfunction


function! PostOff()

    if !exists("t:tables_buffer")
        let t:tables_buffer =0
    endif

    for bufnum in tabpagebuflist()
        if bufnum != t:post_original_bufnr
            if bufnum != t:tables_buffer
                execute  'sb '. bufnum
                q
            endif
        endif
    endfor

    if exists("t:pid_list")
        for pid in t:pid_list
            let post_proc_cmd = 'ps -p ' . pid . ' -o comm='
            let post_proc_name = system(post_proc_cmd)
            if post_proc_name == "psql"
                system('kill ' . pid) 
            endif
        endfor
        unlet t:pid_list
    endif    

    execute  'sb '. t:post_original_bufnr
endfunction


function! PostKill()
    if exists("t:pid_list")
        for pid in t:pid_list
            let post_proc_cmd = 'ps -p ' . pid . ' -o comm='
            let post_proc_name = system(post_proc_cmd)
            if post_proc_name == "psql"
                system('kill ' . pid) 
            endif
        endfor
        unlet t:pid_list
    endif    
endfunction


