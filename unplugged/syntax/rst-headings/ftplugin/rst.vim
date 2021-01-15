if !exists("g:rsth_auto_register") || g:rsth_auto_register != 0
    autocmd CursorMovedI <buffer> call rsth#Heading() 
endif
