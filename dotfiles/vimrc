set nocompatible                                        " be iMproved, required
filetype off                                            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
" Plugin 'wellle/targets.vim'
" Plugin 'kshenoy/vim-signature'
" Plugin 'hongqn/vim-osx-ime'

" All of your Plugins must be added before the following line
call vundle#end()                                       " required
filetype plugin indent on                               " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set background=dark                                     " 하이라이팅 lihgt / dark
set nocompatible                                        " 오리지날 VI와 호환하지 않음
set splitright                                          " 창 분할시 우측에 새창 배치
set splitbelow                                          " 창 분할시 하단에 새창 배치
set nobackup                                            " 백업 파일을 안만듬
set visualbell                                          " 키를 잘못눌렀을 때 화면 프레시
set ruler                                               " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set number                                              " 행번호 표시, set nu 도 가능
set fencs=ucs-bom,utf-8,euc-kr.latin1                   " 한글 파일은 euc-kr로, 유니코드는 유니코드로
set fileencoding=utf-8                                  " 파일저장인코딩 
set tenc=utf-8                                          " 터미널 인코딩
set expandtab                                           " softtab 사용 
set shiftwidth=4                                        " >>, << 등을 사용했을때 들여쓰기 간격
set softtabstop=4                                       " tab키를 사용했을때 들여쓰기 간격
set autoindent                                          " 이전 줄의 들여쓰기 간격을 새줄에서 유지
set smartindent                                         " automatically inserts indentation in some cases
set cindent                                             " like smartindent, but stricter and more customisable
set autoread                                            " 파일이 변경되었다면 자동으로 다시 읽음
set hlsearch                                            " 검색어 강조, set hls 도 가능
set ignorecase                                          " 검색시 대소문자 무시, set ic 도 가능
set smartcase                                           " 검색어에 대문자 포함시 case sensitive 검색
set incsearch                                           " 키워드 입력시 점진적 검색
set cursorline                                          " 커서가 있는 줄 강조
set laststatus=2                                        " 상태줄이 항상 나옴 
set title                                               " 편집하는 파일명을 창의 제목으로 사용
set backspace=eol,start,indent                          " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000                                        " vi 편집기록 기억갯수 .viminfo에 기록

syntax on                                               " 구문강조 사용
filetype indent on                                      " 파일 종류에 따른 구문강조
colorscheme jellybeans                                  " vi 색상 테마 설정

" macvim에서 insert mode를 나올때 영문상태로 전환함
set noimd
set imi=1
set ims=-1

" edit ~/.vimrc
map <leader>ev :e! ~/.vimrc<cr>

" Function keys
nnoremap <F2> :NERDTreeToggle<CR>                       " NERDTree 보이기/감추기
" nnoremap <F7> :SyntasticCheck<CR>                     " 문법(Syntastic) 체크
" nnoremap <F11> :tabprev<CR>                           " 이전 탭으로 이동
" nnoremap <F12> :tabnext<CR>                           " 다음 탭으로 이동
" nnoremap <F10> :bd<CR>                                " 버퍼 삭제
nnoremap <F11> :bN<CR>                                  " 이전 버퍼를 현재 윈도우에 표시
nnoremap <F12> :bn<CR>                                  " 다음 버퍼를 현재 윈도우에 표시

" Delete buffer
map <leader>d :bd<CR>

" Go to previous  window
nnoremap <tab> <c-w><c-p>

" Go to previous tab 
au TabLeave * let g:previoustab = tabpagenr()
nnoremap <silent> <s-tab> :exe "tabn ".g:previoustab<cr>
vnoremap <silent> <s-tab> :exe "tabn ".g:previoustab<cr>

" Open a new tab with NERDTree
map <leader>T :tabnew <CR>
map <leader>t :tabnew .<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Resize current window 
map <silent> + :vertical resize +5<cr>
map <silent> - :vertical resize -5<cr>
map <silent> <leader>+ :resize +5<cr>
map <silent> <leader>- :resize -5<cr>
map <silent> = <c-w>=

" helpers for dealing with other people's code
" nmap \t :set ts=4 sts=4 sw=4 noet<cr>
" nmap \s :set ts=4 sts=4 sw=4 et<cr>

" make search appears in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Plugin vim-airline
let g:airline#extensions#tabline#enabled = 1            " 탭 사용시 상단에 탭목록 표시
let g:airline#extensions#tabline#tab_nr_type = 1        " 탭 번호를 표시
let g:airline#extensions#tabline#fnamemod = ':t'        " 탭 제목에 파일이름만 표시

" Plugin delimitMate
let delimitMate_excluded_ft = "vim"                     " .vimrc 편집시 주석쓰기 불편해서 delimimate 사용안함

" Plugin Numbers
map <leader>ln :NumbersToggle<CR>                       " 행번호를 절대/상대 번호로 표시

" Plugin ctrl-p
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_dotfiles=1
let g:ctrlp_custom_ignore = {
        \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$|\.png$'
        \ }
map <leader>o :CtrlPBuffer<cr>
 
" Plugin NERDTree
" let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1

" Plugin TComment
nmap <leader>c :TComment<cr>
vmap <leader>c :TComment<cr>

" Plugin syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

" Plugin YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
