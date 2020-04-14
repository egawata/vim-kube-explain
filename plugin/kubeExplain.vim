" vim-kube-explain - show a result of kube explain
" Version: 0.0.1
" Author: egawata
" License: Vim license

if exists('g:loaded_kube_explain')
  finish
endif
let g:loaded_kube_explain = 1

let s:save_cpo = &cpo
set cpo&vim

command! KubeExplain call kubeExplain#Explain()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
