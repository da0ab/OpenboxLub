"--------------------------------------------- ОСНОВНОЕ
set nocompatible "Несовместимость с vi
set encoding=utf-8 "Базовая кодировка
set fileencodings=utf-8,koi8-r,cp1251,cp866 "Список используемых кодировок для автоматического их определения
filetype plugin on "Включить плагины
set helplang=ru "Русский хелп
set guioptions-=T "Отключить гуи
set clipboard=unnamed  "Системный буфер обмена в качестве своего буфера по умолчанию (поэтому любая команда x , y , p и т. Д. Использует буфер обмена

"--------------------------------------------- ФИКС РУССКОЙ РАСКЛАДКИ
filetype indent on
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?

"--------------------------------------------- ОФОРМЛЕНИЕ
set shm+=I "Пустой стартовый экран
set guifont=DejaVu\ Sans\ Mono\ 13 "Размер шрифта
set lines=75 "Высота
set columns=210 "Ширина
set ch=1 "Сделать строку команд высотой в одну строку
hi Pmenu guibg=#666666 guifg=#eeeeec
colorscheme desert
"--------------------------------------------- КУРСОР
"Классичемкий курсор
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set cursorline
hi CursorLine ctermbg=235 cterm=none
set ruler "Текущее положение курсора

"Линия курсора только в активном окне, и только в режиме вставки
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set mousemodel=popup
set mouse=a "Включаем мышку
set mousehide "Скрывать мышку при печати
"--------------------------------------------- СТРОКА СОСТОЯНИЯ
set showmode "Включить строкe состояния
set wildmenu
set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %o\ %P

"--------------------------------------------- ПОИСК
set hlsearch "Подсветка все совпадения результатов поиска
set ignorecase "Игнорировать регистр букв при поиске
set incsearch "При поиске перескакивать на найденный текст в процессе набора строки
set smartcase "Игнорировать предыдущую опцию если в строке поиска есть буквы разного регистра
set nowrapscan "Поиск до первого совпадения
set infercase "Предлагать авто-дополнение на основе уже введённого регистра

"--------------------------------------------- БЕКАП
"set nobackup "Не бекапить
set noswapfile "Убить свапфайл
"set undolevels=100 "Память отмен
"История изменений
if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"--------------------------------------------- СОДЕРЖИМОГО ФАЙЛА
syntax on "Подсветка синтаксиса
set wrap "Перенос строк
set linebreak "Не рвать строку
set nu "Нумерация строк
set smartindent "Умные отступы
"set list  "Показывать непечатные символы

"Преобразование таба в пробелы
set tabstop=4
set shiftwidth=4
set expandtab

"Отключить автосворачивание длинных строк
set nofoldenable
autocmd Filetype svg setlocal nofoldenable
autocmd Filetype html setlocal nofoldenable

"Автоставки для скобок их пар
imap [ []<LEFT>
imap { {}<LEFT>
imap ( ()<LEFT>
set showmatch "Подсветка парных скобок

"Автозавершение слов по tab
function InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<tab>"
 else
 return "\<c-p>"
 endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

"Автоматически удалять окончания строк - Dos-return'ы, пробельные символы
autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter *.php :%s/[ \t\r]\+$//e
autocmd FileType html set wrap
autocmd FileType css set wrap
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"--------------------------------------------- СОЧЕТАНИЯ ГОРЯЧИХ КЛАВИШ
"Выход без сохранения
map <C-Q> <Esc>:q!<cr>

"Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

"< & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

"C-c and C-v -------------------------------------------------- Copy/Paste
vmap <C-C> "+y
imap <C-V> <esc>"+gp

"C-a -------------------------------------------------- Выделить все
nmap <C-a> ggVG<CR>
imap <C-a> <esc>ggVGG<CR>
vmap <C-a> <esc>ggVGG<CR>

"C-d -------------------------------------------------- Дублирование текущей строки
map <C-d> <esc>yyp<CR>
imap <C-d> <esc>yyp<CR>
vmap <C-d> <esc>yyp<CR>

"C-x -------------------------------------------------- Вырезать текущую строку
map <C-x> <esc>S<CR>
imap <C-x> <esc>S<CR>


"--------------------------------------------- ОДИНОЧНЫЕ ГОРЯЧИЕ КЛАВИШИ ---------------------------------------------

"F1 -------------------------------------------------- Save
nmap <F1> :w!<CR>
imap <F1> <Esc>:w!<CR>
vmap <F1> <Esc>:w!<CR>

"F2 -------------------------------------------------- выделить СТРОЧКУ без переноса
nmap <F2> ^vg_
set foldmethod=manual

"F3 -------------------------------------------------- удалить пустые строки
nmap <F3> :g/^s*$/d
set foldmethod=manual

"F4 -------------------------------------------------- удалить множественные пустые строки, оставить одну
nmap <F4> :v/./,/./-j


"F5 -------------------------------------------------- вставка дата времени
imap <F5> <C-R>=strftime("%c")<CR>


"F7 -------------------------------------------------- Редактировать .vimrc
map <F7> :vsp $MYVIMRC<CR>

"F8 -------------------------------------------------- Выбор кодировки
set wildmenu
set wcm=<Tab>
colorscheme  afterglow
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

"F9 -------------------------------------------------- Отобразить/Скрыть меню
set guioptions-=m
    function MyToggleMenu()
        let old_guioptions = &guioptions
        "Если меню в данный момент видимо
        if stridx(old_guioptions, 'm') != -1
            set guioptions-=m
        else
            set guioptions+=m
        endif
    endfunction
    cmap <F9> <ESC>:call MyToggleMenu()<CR>
    imap <F9> <ESC>:call MyToggleMenu()<CR>
    nmap <F9> :call MyToggleMenu()<CR>
    vmap <F9> <ESC>:call MyToggleMenu()<CR>



"--------------------------------------------- HTML/CSS/bash/python вставки
inoremap \sh #!/bin/bash
inoremap \py #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-
inoremap \s <style type="text/css"><cr><cr></style>
inoremap \j <script type="text/javascript" src="js"><cr><cr></script>
inoremap \css <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">

"--------------------------------------------- пустой HTML

inoremap \x0 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr></body><cr></html>

inoremap \x5 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1"><cr><meta name="format-detection" content="telephone=no"><cr><link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script><cr><cr><script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script><cr><cr></body><cr></html>

inoremap \seo <cr><meta name="description" content=""><cr><meta name="keywords" content=""><cr><meta name="author" content=""><cr><meta name="copyright" lang="ru" content=""><cr><meta name="robots" content="all"><cr>

"--------------------------------------------- Быстрая добавка
inoremap <C-Enter> <br>
inoremap \a <a id="" class="anchor"></a>
inoremap \<Space> &nbsp;
inoremap \i <C-Space>id=""
inoremap \c <C-Space>class=""
inoremap \w width:;
inoremap \h height:;
inoremap \l <cr><hr><cr>
inoremap \-  –
inoremap \co &copy;
inoremap \p -webkit-
inoremap \v  var(--);
inoremap \ve  ?v=0.0.1
inoremap \ff color: #fff;
inoremap \b border: 1px solid RED;
inoremap \1  <C-Space>!important
inoremap \fw font-weight: bold;
inoremap \bg background: transparent url(../images/) no-repeat center;
inoremap \cover background-size: cover;
inoremap \ts text-shadow: 0 0 10px #d1d1d1
inoremap \grid display: grid;<cr>grid-template-columns: 1fr 2fr;

"--------------------------------------------- @media
inoremap \mm /*phone*/<cr> @media (max-width: 769px) {<cr><cr>}
inoremap \mt  /*pad*/<cr> @media (min-width: 769px) and (max-width: 1024px){<cr><cr>}
inoremap \mtp /*pad portrait*/<cr> @media  (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait) {<cr><cr>}
inoremap \mn  /*notebook*/<cr> @media only screen and (max-width: 1650px){<cr><cr>}
inoremap \ms /*square*/<cr> @media screen and (min-width: 1025px) and (max-width: 1400px)

"--------------------------------------------- HTML/CSS оберачивание выделенного

vnoremap sd 1"zdi<div><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><cr><C-R>z<cr><C-R> </div><ESC>
"перенесено в файл py-script vnoremap vnoremap <silent> sdd :%!python3 ~/.vim/scripts/div.py<CR>

vnoremap span "zdi<span class=""><C-R>z</span><ESC>
vnoremap spa "zdi<span><C-R>z</span><ESC>

vnoremap section 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap sec 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap secc 1"zdi<section class="main"><cr><C-R>z<cr></section><ESC>

vnoremap nav 1"zdi<nav><cr><C-R>z<cr></nav><ESC>

vnoremap header 1"zdi<header><cr><C-R>z<cr></header><ESC>
vnoremap he 1"zdi<header><cr><C-R>z<cr></header><ESC>
vnoremap hec 1"zdi<header class="header"><cr><C-R>z<cr></header><ESC>

vnoremap article 1"zdi<article><cr><C-R>z<cr></article><ESC>
vnoremap art 1"zdi<article><cr><C-R>z<cr></article><ESC>

vnoremap footer 1"zdi<footer><cr><C-R>z<cr></footer><ESC>
vnoremap fo 1"zdi<footer><cr><C-R>z<cr></footer><ESC>
vnoremap foc 1"zdi<footer class="footer"><cr><C-R>z<cr></footer><ESC>

vnoremap details 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap det 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>

vnoremap small "zdi<small><C-R>z</small><ESC>
vnoremap sup 1"zdi<sup><C-R>z</sup><ESC>
vnoremap sub 1"zdi<sub><C-R>z</sub><ESC>

"--------------------------------------------- Пустой код
vnoremap s, "zdi<<esc>maa><C-R>z</><ESC>`aa

"--------------------------------------------- Формы

inoremap \texter <form><cr><textarea rows="3" placeholder=""></textarea><cr></form>
inoremap \input <form><cr><input type="text" placeholder=""><cr></form>
inoremap \radio <label class="radio"><cr>  <input type="radio"><cr></label>
inoremap \chek <label class="checkbox"><cr><input type="checkbox"><cr></label>
vnoremap so "zdi<option><C-R>z</option><ESC>
"--------------------------------------------- Текст
vnoremap pp 1"zdi<p><C-R>z</p><ESC>
vnoremap sb "zdi<b><C-R>z</b><ESC>
vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap si "zdi<em><C-R>z</em><ESC>
vnoremap sii "zdi<i><C-R>z</i><ESC>
vnoremap sq "zdi«<C-R>z»<ESC>
"перенесено в файл py-script vnoremap <silent> sp :%!python3 ~/.vim/scripts/p.py<CR>

"--------------------------------------------- Заголовки
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s2t "zdi<h2 class="title"><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>

"--------------------------------------------- Ссылки: обычные, target, e-mail, телефон
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap saa "zdi<a href="<C-R>z"><C-R>z</a><ESC>`aa
vnoremap sat "zdi<a href="https://<C-R>z" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap saat "zdi<a href="<esc>maa" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap s@ "zdi<a href="mailto:<C-R>z"><C-R>z</a><ESC>`aa
vnoremap st "zdi<a href="tel:<C-R>z"><C-R>z</a><ESC>`aa

"--------------------------------------------- Списки UL/DL
vnoremap sl 1"zdi<li><C-R>z</li><ESC>
"перенесено в файл py-script vnoremap <silent> su :%!python3 ~/.vim/scripts/li.py<CR>

vnoremap sld 1"zdi<dd><C-R>z</dd><ESC>
vnoremap slt 1"zdi<dt><C-R>z</dt><ESC>
vnoremap sll 1"zdi<dl><cr><C-R>z<cr></dl><ESC>

"--------------------------------------------- Изображения
vnoremap sw "zdi<img src="images/<C-R>z" alt="" title=""><ESC>
vnoremap swl "zdi<a href="images/<C-R>z" class="Pop" data-ipop-group="img-gr"><img src="images/<C-R>z" alt="" title=""></a><ESC>
vnoremap swy "zdi<a href="<C-R>z"class="iPop-tube"></a><ESC>

"--------------------------------------------- Комментарии
vnoremap ss 1"zdi<!--<C-R>z --><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*--------------------<C-R>z--------------------*/<ESC>

"--------------------------------------------- Таблицы
vnoremap stt 1"zdi<table><C-R>z</table><ESC>
vnoremap std 1"zdi<td><C-R>z</td><ESC>
vnoremap str 1"zdi<tr><C-R>z</tr><ESC>
vnoremap sth 1"zdi<th><C-R>z</th><ESC>
inoremap \col colspan="2"
inoremap \row rowspan="2"
"-------------------------------------------------- оборачивание в <p> массива текста
vnoremap <silent> sp :%!python3 ~/.vim/scripts/p.py<CR>

"-------------------------------------------------- оборачивание в <div> массива текста
vnoremap <silent> sdd :%!python3 ~/.vim/scripts/div.py<CR>

"-------------------------------------------------- оборачивание в <li> массива текста
vnoremap <silent> su :%!python3 ~/.vim/scripts/li.py<CR>
"pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"vim-startify https://github.com/mhinz/vim-startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = map(split(system('cowsay'), 'n'), '"   ". v:val') + ['','']
