" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'          " 화면 상하단에 상태바(버퍼, 탭, 입력상태) 표시 (커스터마이징 가능)
Plug 'jh0x4s/vim-numbers'             " 라인 번호를 상대, 절대, 표시안함 순서로 변경함 
Plug 'scrooloose/nerdtree'            " 파일탐색기 (윈도우탐색기와 같은 화면과 북마크, 탭열기, 루트 디렉토리 변경하기 등의 기능) 
Plug 'ctrlpvim/ctrlp.vim'             " 파일, 버퍼 탐색기 (일부의 문자만 입력하더라도 파일을 찾아주는 Full path fuzzy 검색 용도) 
Plug 'kshenoy/vim-signature'          " 북마크 확장 - 자동 알파벳팅, 순회, 등?
Plug 'mileszs/ack.vim'                " the_silver_search를 이용하여 (ack, grep 처럼) 파일내용 검색
Plug 'airblade/vim-gitgutter'         " git으로 관리되는 파일의 변동상태를 줄번호 화면 옆에 표시 
Plug 'wellle/targets.vim'             " 다양한 text object 지정 방법
Plug 'tomtom/tcomment_vim'            " 주석(comment) 기능으로 사용하며, 파일타입에 따라 알맞은 주석방식을 자동으로 지원함 
Plug 'tpope/vim-surround'             " '', {}, [], <p></p>와 같은 구문들을 편리하게 입력, 수정 할 수 있음
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/syntastic'

Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'             " git 플러그인
" Plug 'jelera/vim-javascript-syntax'
" Plug 'marijnh/tern_for_vim'
" Plug 'hongqn/vim-osx-ime'
" christoomey/vim-tmux-navigator

au BufRead,BufNewFile *.ts setlocal filetype=typescript

"
set background=light                            " 하이라이팅 lihgt / dark
set nocompatible                                " 오리지날 VI와 호환하지 않음
set splitright                                  " 창 분할시 우측에 새창 배치
set splitbelow                                  " 창 분할시 하단에 새창 배치
set nobackup                                    " 백업 파일을 안만듬
set novisualbell                                " To turn off error flashing
set ruler                                       " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set number                                      " 행번호 표시(nu)
set relativenumber                              " 행번호를 상대번호로 표시(rnu)
set fencs=ucs-bom,utf-8,euc-kr.latin1           " 한글 파일은 euc-kr로, 유니코드는 유니코드로
set fileencoding=utf-8                          " 파일저장인코딩 
set tenc=utf-8                                  " 터미널 인코딩
set expandtab                                   " softtab 사용(et) (탭 사용: noet|noexpandtab)   
set shiftwidth=4                                " 들여쓰기(>>, <<) 간격(sw)
set softtabstop=4                               " tab키를 사용했을때 들여쓰기간격(sts)
set autoindent                                  " 이전 줄의 들여쓰기 간격을 새줄에서 유지
set smartindent                                 " automatically inserts indentation in some cases
set cindent                                     " like smartindent, but stricter and more customisable
set autoread                                    " 파일이 변경되었다면 자동으로 다시 읽음
set hlsearch                                    " 검색어 강조, set hls 도 가능
set ignorecase                                  " 검색시 대소문자 무시, set ic 도 가능
set smartcase                                   " 검색어에 대문자 포함시 case sensitive 검색
set incsearch                                   " 키워드 입력시 점진적 검색
set nocursorline                                " 커서가 있는 줄 강조하지 않음
set showtabline=2                               " tab line 이 항상 나옴
set laststatus=2                                " status line 이 항상 나옴 
set title                                       " 편집하는 파일명을 창의 제목으로 사용
set backspace=eol,start,indent                  " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000                                " vi 편집기록 기억갯수 .viminfo에 기록
set hidden                                      " 저장안된 버퍼도 화면 전환이 가능하도록 함
set noimd imi=1 ims=-1                          " macvim에서 insert mode 종료시 자동으로 영문상태로 전환

syntax on                                       " 구문강조 사용
filetype indent on                              " 파일 종류에 따른 구문강조

" .vimrc 수정이 편리하게 단축키를 할당하고, 저장하면 재시작 필요없이 바로 적용되도록 한다
" 파일 수정시에는 Git branch 이름이 표시되도록 절대경로 접근함
autocmd! BufWritePost .vimrc,vimrc nested source $MYVIMRC
map <leader>ev :exe "e! ".resolve(expand($MYVIMRC))<cr>

" 종료시 열려있던 파일들을 시작시 복원함 
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim
autocmd VimEnter source ~/.vim/shutdown_session.vim<cr>
set viminfo+=%

" Make search appears in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Go to previous window
nnoremap <tab> <c-w><c-p>

" Go to previous tab 
au TabLeave * let g:previoustab = tabpagenr()
nnoremap <s-tab> :exe "tabn ".g:previoustab<cr>
vnoremap <s-tab> :exe "tabn ".g:previoustab<cr>

" Function keys
nnoremap <f2> :call NERDTreeFindToggle()<cr>    " NERDTree 보이기/감추기
nnoremap <f3> :GitGutterSignsToggle<cr>         " vim-gitgutter (git 변경 상태) 보이기/감추기
nnoremap <f4> :NumbersCirculator<cr>            " vim-numbers로 라인번호 상태 변경 (상대, 절대, 표시안함 순)
nnoremap <f7> :SyntasticCheck<cr>               " 문법(Syntastic) 체크
nnoremap <s-f10> :%bd!<cr>                      " 모든 버퍼를 닫음 (닫기 전 모든 버퍼의 변경사항을 저장하고 싶다면 :wa 입력)
nnoremap <f10> :bd<cr>                          " 버퍼 닫기
nnoremap <f11> :bN<cr>                          " 이전 버퍼를 현재 윈도우에 표시
nnoremap <f12> :bn<cr>                          " 다음 버퍼를 현재 윈도우에 표시

" 탭 조작 단축키
noremap <leader>nt :tabnew .<cr>                " 새로운 Nerdtree Tab으로 열기 
noremap <leader>t :tabnew <cr>                  " 새로운 Tab 열기
noremap <leader>0 :tabclose<cr>                 " 현재 탭 닫기
noremap <leader>1 1gt                           " 1번 탭으로 이동
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" 윈도우 크기조절 단축키
" TIP: 확장을 위한 단축키가 <leader>+대문자 조합이라 타이핑이 쉽지 않으므로, 
" 반대편 창으로 이동하여 w,h로 축소시키는 편이 낫다
noremap <leader>W :vertical resize +5<cr>       " 가로(Width) 확장
noremap <leader>w :vertical resize -5<cr>       " 가로 축소
noremap <leader>H :resize +5<cr>                " 세로(Hight) 확장
noremap <leader>h :resize -5<cr>                " 세로 축소
noremap <leader>= <c-w>=                        " 동일한 크기로 자동변경

" 편집하려는 파일의 tab, indent 설정이 다를 수 있으므로,
" 많이 사용되는 값들을 미리 정의하여 vim 환경을 쉽게 변경할 수 있도록 한다
command! HardTab2 set ts=2 sw=2 noet            " noet(tab 문자사용)과et(tab문자대신 space로 채움) 선택, 
command! HardTab4 set ts=4 sw=4 noet            " 들여쓰기(sw) 크기,
command! HardTab8 set ts=8 sw=8 noet            " \t을 사용한다면 \t을 몇 개의 빈 칸으로 표시할지(ts),
command! SoftTab2 set sts=2 sw=2 et             " \t 대신 space를 사용한다면 몇 개로 채울지(sts)
command! SoftTab4 set sts=4 sw=4 et    
command! SoftTab8 set sts=8 sw=8 et

" 입력모드에서도 ctrl+hjkl로 커서 이동 가능하도록 한다
" inoremap <c-k> <up>                             " 입력모드에서 ctrl+hjkl로 커서를 이동
" inoremap <c-j> <down>
" inoremap <c-l> <right>
" inoremap <c-h> <left>
" inoremap <c-b> <pageup>
" inoremap <c-f> <pagedown>
" noremap <c-j> <c-e>                             "  
" noremap <c-k> <c-y>
" noremap <c-h> <c-d>
" noremap <c-l> <c-u>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'charvaluehex', 'fileencoding' ] ],
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

let g:lightline.tabline = {
      \ 'left': [ ['tabs'] ],
      \ 'right': [ ['close'] ]
      \ }

" ctrl-p 설정
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_root_markers = ['.p4ignore']
let g:ctrlp_custom_ignore = {
        \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules|bower_components|dist)$',
        \ 'file': '\v\.(exe|so|dll|class|ppt|png|jpg|jpeg)$',
        \ }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
 
" NERDTree 설정
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NERDTreeFindToggle()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
   endif
endfunction

let NERDTreeShowHidden=1

" tcomment 설정
nmap <leader>c gcc      " 현재 줄을 주석상태를 반전
vmap <leader>c gc       " 선택 영역 주석상태를 반전 (visual-block 주석해제시 주석기호까지 선택해야함)

" vim-easymotion 설정 
nmap <Leader>f <Plug>(easymotion-overwin-f)

" syntastic 설정
" syntastic은 vim의 syntax on 감지결과로 파일타입을 인식한다. (see: h filetype)
" 그런데 typescript 파일을 인식하지 못해서, :SyntasticInfo 해보면 xmllint가
" 적용되어 있는 것을 볼 수 있는데, 이때문에 *.ts에 대해서 강제로 filetype을 
" 지정해주는 처리가 필요하다.
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers=['tsc']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=99"
let g:syntastic_aggregate_errors = 1

let g:syntastic_mode_map = { 
    \ 'mode': 'passive',
    \ 'active_filetypes': ['javascript', 'python'],
    \ 'passive_filetypes': [ ] 
    \ }

" YouCompleteMe 설정
" let g:ycm_key_list_select_completion=['<c-j>', '<down>']
" let g:ycm_key_list_previous_completion=['<c-k>', '<up>']
let g:ycm_autoclose_preview_window_after_completion=1
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview

nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r ::YcmCompleter GoToReferences<CR>

" ack 설정
" silver searcher가 설치되어있다면 사용한다
if executable('ag')                 
    let g:ackprg = 'ag --vimgrep'   
endif

" 명령어모드에서 ack로 입력하면 Ack!로 치환
cnoreabbrev ack Ack!
nnoremap <leader>a :Ack!<space>

" O to preview file, open but maintain focus on ack.vim results
" o to open and close the quickfix window
let g:ack_mappings = { 
    \ "O": "<cr><c-w>j",            
    \ "o": "<cr><c-w><c-w>:ccl<cr>" 
    \ }

" vim-signature 설정
map <leader>p m. 
map <leader>[ '[
map <leader>] ']

" Initialize plugin system
call plug#end()

