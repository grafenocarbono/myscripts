call plug#begin('~/.vim/plugged')
	let g:typescript_compiler_binary = 'tsc'
	let g:typescript_compiler_options = ''
	autocmd QuickFixCmdPost [^l]* nested cwindow
	autocmd QuickFixCmdPost    l* nested lwindow
	Plug 'https://github.com/leafgarland/typescript-vim'
	Plug 'https://github.com/Quramy/vim-js-pretty-template'
	Plug 'https://github.com/pangloss/vim-javascript'
	Plug 'preservim/nerdtree' 
call plug#end()
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces


