" vim-kube-explain - show a result of kube explain
" Version: 0.0.1
" Author: egawata
" License: Vim license

let s:save_cpo = &cpo
set cpo&vim

function! kubeExplain#Explain()
  let keys = []
  let originLine = line('.')
  let currentLine = originLine
  let minIndent = 99999

  while currentLine >= 0 && minIndent > 0
    let l = getline(currentLine)
    let idt = matchstr(l, '^[ -]\+')
    if strlen(idt) < minIndent
      let minIndent = strlen(idt)

      let subkey = matchstr(l, '\w\+:')
      if len(subkey) > 0
        let subkey = substitute(subkey, ':', '', 'g')
        call insert(keys, subkey)
      else
        echoerr 'No match'
        return
      endif
    endif
    let currentLine = currentLine - 1
  endwhile

  let kind = ''
  for ln in range(1, line('$'))
    let line = getline(ln)
    if match(line, '^kind:') == 0
      let kind = matchstr(line, '\w\+$')
      break
    endif
  endfor

  if strlen(kind) == 0
    echoerr 'kind not found'
    return
  endif

  exec 'new'
  let cmd = 'kubectl explain ' . kind . '.' . join(keys, '.')
  call termopen(cmd)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
