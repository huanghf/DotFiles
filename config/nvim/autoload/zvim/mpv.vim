let s:playId = 0
function! zvim#mpv#play(file,...) abort
    if has('nvim')
        if s:playId != 0
            call jobstop(s:playId)
            let s:playId = 0
        endif
        let s:playId =  jobstart(['mpv','--vid=no',a:file])
    else
        if s:playId != 0
            call job_stop(s:playId)
            let s:playId =0
        endif
        let s:playId = job_start(['mpv','--vid=no',a:file])
    endif
endfunction