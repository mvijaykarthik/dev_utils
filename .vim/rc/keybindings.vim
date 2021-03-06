" Keybindings
" Motion keys:
" (Warning! Can be dangerous for beginners)
" Up - File Browser
" Left - Left buffer 
" Down - Preview Window "TODO: Toggle quickfix
" Right - Right Buffer
" Space - Move down a page
" Backspace - Move up a page

function! Smart_TabComplete()
    let line = getline('.')                        

    let substr = strpart(line, -1, col('.')+1)     


    let substr = matchstr(substr, "[^ \t]*$")       
    if (strlen(substr)==0)                          
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1     
    let has_slash = match(substr, '\/') != -1      
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                        
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         
    else
        return "\<C-X>\<C-O>"                        
    endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

noremap <a-up> <ESC>:Ex<CR><ESC><C-W><C-W> 
imap <C-d> <Esc>maI//<Esc>`alla
imap <C-f> <Esc>^:s/\/*//<Enter>:nohl<Enter>i

noremap <a-left> <ESC>:MBEbp<CR> 
noremap <a-down> <ESC>:Tlist<CR> 
noremap <a-right> <ESC>:MBEbn<CR>
" noremap <Space> <PageDown>
" noremap <Backspace> <PageUp>

" Format the paragraph (or the current selection) at once
nnoremap Q gqap
vnoremap Q gq

" Quickfix
" Ctrl-h  -  Move the previous entry
" Ctrl-l  -  Move the next entry
nnoremap <C-h> :cprev <CR>
nnoremap <C-l> :cnext <CR>

" Hotkeys
"    F2   -  write file without confirmation
"    F3   -  make
"    F4   -  nohl
"    F5   -  toggle paste
"    F6   -  GenTags
"    F7   -  Open tag in preview window
"    F8   -  TagList
"    F9+  -  GNOME <reserved>
"    F12  -  ROT-13 encrypt the file

map   <silent> <F2>    :write<CR>
map   <silent> <F3>    :make<CR>
map   <silent> <F4>    :nohl<CR>
set   pastetoggle=<F5>
nmap  <silent> <F6>    :call GenTags()<CR>
nmap  <silent> <F7>    :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F8>    :TList<CR>
nmap  <silent> <F12>   ggVGg? 

imap  <silent> <F2>    <Esc>:write<CR>
imap  <silent> <F3>    <Esc>:make<CR>
imap  <silent> <F4>    <Esc>:nohl<CR>
imap  <silent> <F6>    <Esc>:call GenTags()<CR>
imap  <silent> <F7>    <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F8>    <Esc>:TList<CR>

" Copy the current position, into previously accessed buffer
map \o                 <Esc>:call CopyCat() <CR>
map ,e                  <Esc>:e <C-R>=expand("%:h")<CR>/
