if !has('python')
	echo "Error: Required vim compiled with +python"
	finish
endif

"Check load
if exists('g:vim_gtranslate_load')
	finish
endif

let g:vim_gtranslate_load = 1

function! GTranslate()
	python << EOF

		from gtranslate import main
		main()

	EOF
		
	setlocal nomodifiable
	setlocal buftype=nofile

endfunction

if !exists(":GTranslate")
	command GTranslate :call GTranslate()
endif
