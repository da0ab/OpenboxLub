" Visually select and press Ctrl-h to escape HTML
"                     press Ctrl-u to unescape
" 
" see http://vim.wikia.com/wiki/HTML_entities
"
function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/"/\&quot;/eg
  silent s/'/\&apos;/eg
endfunction

function HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
  silent s/&quot;/"/eg
  silent s/&apos;/'/eg
endfunction

map <silent> <c-h> :call HtmlEscape()<CR>
map <silent> <c-u> :call HtmlUnEscape()<CR>
