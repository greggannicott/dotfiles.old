" -----------------------------------------------------------------------------
" The following options are only used when using graphical vim.
" -----------------------------------------------------------------------------

set guioptions-=T " Remove toolbar

" Set the GUI font.
if has("gui_macvim")
	" I need to choose a font, as I can't be sure Consolas exists on the Mac...
	"set guifont=Anonymous\ Pro\ for\ Powerline:h14
	"set linespace=2
elseif has("Win32")
	set guifont=Consolas:h8:cANSI
	au GUIEnter * simalt ~x " Maximize vim on startup
endif
