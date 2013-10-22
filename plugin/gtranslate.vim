if !has('python')
	echo "Error: Required vim compiled with +python"
	finish
endif

"Check load
if exists('g:vim_gtranslate_load')
	finish
endif

if !exists('g:vim_gtranslate_root') || g:vim_gtranslate_root == ''
	let g:vim_gtranslate_root = expand("<sfile>:p:h")
endif

let g:vim_gtranslate_load = 1

python << EOF
import sys, vim
sys.path.append(vim.eval("g:vim_gtranslate_root"))
EOF

function! GTranslate()
let s:word = expand("<cword>") 
python << EOF
from gtranslate import main
main()
EOF
unlet s:word
endfunction


if !exists(":GTranslate")
	command GTranslate :call GTranslate()
endif
