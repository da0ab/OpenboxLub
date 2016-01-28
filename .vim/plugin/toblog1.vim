" Vim plugin for converting a syntax highlighted file to HTML.
" author: Leonid "PhoeniX" Ponomarev
" original idea by: Bram Moolenaar

"adjust necessary settings
let html_number_lines =0 
let html_ignore_folding = 1
"let html_use_css = 0
let html_no_pre = 1
let html_start_line = line("'<")
let html_end_line = line("'>")

" Don't do this when:
" - when 'compatible' is set
" - this plugin was already loaded
" - user commands are not available.
if !&cp && !exists(":TOblog") && has("user_commands")
  command -range=% TOblog :call Convert2blog(<line1>, <line2>)

  func Convert2blog(line1, line2)
    if a:line2 >= a:line1
      let g:html_start_line = a:line1
      let g:html_end_line = a:line2
    else
      let g:html_start_line = a:line2
      let g:html_end_line = a:line1
    endif

    runtime syntax/2html.vim

    unlet g:html_start_line
    unlet g:html_end_line
	" change body to div vith inline style
    :silent :%s/<body[^<]*>/<div id="code" style="background-color:#00000; color:#f5f5f5f">/
    :silent :%s/<\/body>/<\/div>/
    :silent :%s/<br>$//
	" and delete crap around it
	:exe "normal gg"
    :call search("<div id=\"code\"[^>]*>")
	:exe "normal kdggw%jdGggJyG"
  endfunc

endif
