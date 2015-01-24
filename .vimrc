set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测
set backspace=2


" Vundle 插件管理
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" 使用Vundle来管理插件，这个必须要有。
Plugin 'gmarik/vundle'
     
Plugin 'bufexplorer.zip'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'AutoClose'
Plugin 'EasyMotion'
Plugin 'matchit.zip'
Plugin 'mattn/emmet-vim'
Plugin 'jutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'honza/vim-snippets'
Plugin 'Lokaltog/vim-powerline'

call vundle#end()            " required

set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

filetype on                                          "启用文件类型侦测
filetype plugin on                                   "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
setlocal noswapfile
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4
set shiftwidth=4                                      "设置Tab键的宽度，可以更改，如：宽度为2
set smarttab					                      "指定按一次backspace就删除shiftwidth宽度
set foldenable                                        "启用折叠
set foldmethod=manual                                 "indent 折叠方式

set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
set wrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set mouse=a                                           "在任何模式下启用鼠标
set t_Co=256                                          "在终端启用256色

syntax on

colorscheme molokai                                   "终端配色方案

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

set ignorecase                                        "搜索模式里忽略大小写
set smartcase
"如果搜索模式包含大写字符，不使用 'ignorecase'
"选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set hlsearch        "高亮搜索
set incsearch       "在输入要搜索的文字时，实时匹配

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" 常规模式下输入 F2 调用插件
nmap <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree
wincmd w
autocmd vimenter * wincmd w
" 按键映射
"

" nmap <F8> :TagbarToggle<CR>
nmap tb :TlistClose<CR>:TagbarToggle<CR>

let g:tagbar_width=30                       "设置窗口宽度"

