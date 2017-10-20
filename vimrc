" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

colorscheme molokai				" 设置主题
set guifont=Courier:h15			" 字体
syntax on						" 语法高亮
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul	" 用浅色高亮当前行
set smartindent					" 智能对齐
set autoindent					" 自动对齐
set confirm							" 在处理未保存或只读文件的时候，弹出确认
set tabstop=4						" Tab键的宽度
set softtabstop=4
set shiftwidth=4				"  统一缩进为4
set expandtab						" 不要用空格代替制表符
set number							" 显示行号
set hlsearch
set incsearch					" 搜索逐字符高亮
set gdefault					" 行内替换
set encoding=utf-8				" 编码设置
set fileencodings=utf-8,ucs-bom,shift-jis,g18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
set langmenu=zn_CN.UTF-8
set helplang=cn					" 语言设置
set cmdheight=2					" 命令行（在状态行）的高度，默认为1,这里是2
set ruler						" 在编辑过程中，在右下角显示光标位置的状态行
set laststatus=2				" 总是显示状态行
set showcmd						" 在状态行显示目前所执行的命令
set scrolloff=3					" 光标移动到buffer的顶部和底部时保持3行距离
set showmatch					" 高亮显示对应的括号
set matchtime=5					" 对应括号高亮的时间（单位是十分之一秒）
set lines=70
set columns=150        " 设置默认大小
set ruler              "设置标尺
set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor "光标变细
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"autocmd VimEnter * NERDTree

"pythin代码i全
"let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'
" " 按下 F2 调出/隐藏 NERDTree
map  :silent! NERDTreeToggle

"新建python文件自动调用模板
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# author: bymost")
    call append(3, "# email: bymost@yeah.net")
    call append(4, "# Bytime: @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()


"==================自定义的键映射======================

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
" 括号自动生成

map <F7> :if exists("syntax_on") <BAR>
\    syntax off <BAR><CR>
\  else <BAR>
\syntax enable <BAR>
\  endif
" 单键<F7>控制syntax on/off。原因是有时候颜色太多会妨碍阅读。

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc
" <F5>编译和运行C程序


set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required! 
"这是vundle本身的设置
 Bundle 'gmarik/vundle'  
 
 " My Bundles here:
 "这里是设置你自己自定义的插件的设置vundle设置，注意：下载的插件git为：https://github.com/godlygeek/tabular.git，则设置为Bundle 'godlygeek/tabular';https://github.com/gmarik/vundle.git设置则为 Bundle 'gmarik/vundle'  
 " original repos on github
 Bundle 'godlygeek/tabular'

 " vim-scripts repos，vim-scripts的访问地址，格式则如下：
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos ，非git的访问地址的，格式如下：
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'The-NERD-tree'
 Bundle 'The-NERD-Commenter'
" Bundle 'command-t'
 Bundle 'vim-powerline'
 Bundle 'word_complete'
 Bundle 'SuperTab'
 "Bundle 'pythoncomplete'
 "Bundle 'Pydiction'
 Bundle 'Valloric/YouCompleteMe'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 
 
 "YouComplete配置
 ""YouComplete 代码补全
 let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
 "自动补全配置
 set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif "'离开插入模式后自动关闭预览窗口
 inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'	 
 "回车即选中当前项
 "上下左右键的行为 会显示其他信息
 inoremap <expr> <Down>     pumvisible() ? '<C-n>' : '<Down>'
 inoremap <expr> <Up>       pumvisible() ? '<C-p>' : '<Up>'
 inoremap <expr> <PageDown> pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
 inoremap <expr> <PageUp>   pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'

 "oucompleteme  默认tab  s-tab 和自动补全冲突
 "let g:ycm_key_list_select_completion=['<c-n>']
 let g:ycm_key_list_select_completion = ['<Down>']
 "let g:ycm_key_list_previous_completion=['<c-p>']
 let g:ycm_key_list_previous_completion = ['<Up>']
 let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

 let g:ycm_server_python_interpreter='/usr/bin/python'
 let g:ycm_collect_identifiers_from_tags_files=1	"开启 YCM 基于标签引擎
 let g:ycm_min_num_of_chars_for_completion=2	    "从第2个键入字符就开始罗列匹配项
 let g:ycm_cache_omnifunc=0							" 禁止缓存匹配项,每次都重新生成匹配项
 let g:ycm_seed_identifiers_with_syntax=1			"语法关键字补全
 nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	
 "force recomile with syntastic
 "nnoremap <leader>lo :lopen<CR>	'open locationlist
 "nnoremap <leader>lc :lclose<CR>	'close locationlist
 inoremap <leader><leader> <C-x><C-o>
 "在注释输入中也能补全
 let g:ycm_complete_in_comments = 1
 "在字符串输入中也能补全
 let g:ycm_complete_in_strings = 1
 "注释和字符串中的文字也会被收入补全
 let g:ycm_collect_identifiers_from_comments_and_strings = 0
 "跳转到定义处
 nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
