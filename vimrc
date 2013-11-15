set noic   "搜索时忽略大小写
set hlsearch    "搜索高亮
set incsearch   "实时搜索
set ai       "autoindent 自动缩进
set cin     "cindent C自动缩进
set si       "smartindent
set ts=4  "tabstop Tab键宽度
set softtabstop=4
set sw=4 "shiftwidth
set sta     "smart tab
set hi=1000    "remember 1000 command histories 记录历史
set acd           "自动切换到当前文件所在的目录
set bg=dark  "背景颜色
"set gfn=Tahoma   "字体
set smd         "在状态栏显示当前模式
set nu            "显示行号
set ru             "show ruler
syntax on      "语法高亮
set nocp        "关闭vi兼容模式
filetype on      "检测文件类型
filetype plugin on        "允许插件
"set cursorline             "突出显示当前行
set lbr                         "不在单词中间断行
set showmatch          "括号匹配

"set font and color
if has("gui_running")
"set guioptions-=T      "隐藏工具栏
set guioptions-=r       "隐藏右侧滚动条
set t_Co=256
"set background=dark
"set colorscheme peaksea
endif

"F5编译运行C, C++
map <F5> : call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!./%<"
	else if &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!./%<"
	else if &filetype == 'sh'
		:!./%
	endif
endfunc

"F8调试C, C++
map <F8> : call RunGdb()<CR>
func! RunGdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

"Taglist 
let Tlist_Use_Right_Window=1        "taglist在右侧窗口
