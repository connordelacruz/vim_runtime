func! rsth#Heading()
    let l:curPos = getpos(".")

    let l:row = l:curPos[1]
    let l:col = l:curPos[2]

    if s:MatchHeadLine(l:row, 2)
        " echom "Matched head line"
        if s:IsUnderlined(l:row - 1)
            " echom "I am the underline"
            call s:CompleteHeading(l:row - 1)
        else
            " echom "I am the overline"
            call s:CompleteHeading(l:row + 1)
        endif
    else
        " echom "I am the heading itself"
        call s:CompleteHeading(l:row)
    endif
endfunc

func! s:CompleteHeading(row)
    let l:row = a:row

    if s:IsHeading(l:row)
        let l:headLen = s:StringLength(getline(l:row))

        if (l:headLen < 1)
            " Avoid deletion of head lines if heading is still empty
            return
        endif

        if s:IsOverlined(l:row)
            let l:headChar = s:GetLineChar(l:row - 1)
        elseif s:IsUnderlined(l:row)
            let l:headChar = s:GetLineChar(l:row + 1)
        endif

        let l:headLine = repeat(l:headChar, l:headLen)

        if s:IsOverlined(l:row)
            call setline(l:row - 1, l:headLine)
        endif
        if s:IsUnderlined(l:row) || s:IsOverlined(l:row)
            call setline(l:row + 1, l:headLine)
        endif
    endif
endfunc

func! s:GetLineChar(row)
    return matchstr(getline(a:row), '^.')
endfunc

func! s:IsHeading(row)
    return s:IsOverlined(a:row) || s:IsUnderlined(a:row)
endfunc

func! s:IsUnderlined(row)
    return s:StringLength(getline(a:row)) > 0 && s:MatchHeadLine(a:row + 1, 1)
endfunc

func! s:IsOverlined(row)
    return s:StringLength(getline(a:row)) > 0 && s:MatchHeadLine(a:row - 1, 1)
endfunc

func! s:MatchHeadLine(row, minLen)
    return match(getline(a:row), '^\([=#^-]\)\1\{' . (a:minLen - 1) . ',\}$') > -1
endfunc

func! s:StringLength(text)
    return strlen(substitute(a:text, ".", "x", "g"))
endfunc
