" Vim Color File
" Name:       starlight.vim
" License:    The MIT License (MIT)

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="starlight"

" Set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
if !exists("g:starlight_termcolors")
  let g:starlight_termcolors = 256
endif

" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:starlight_terminal_italics")
  let g:starlight_terminal_italics = 0
endif

" This function is based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:starlight_terminal_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif
  if g:starlight_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  endif
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"public {{

function! starlight#set_highlight(group, style)
  call s:h(a:group, a:style)
endfunction

"public end }}

" +-----------------+
" | Color Variables |
" +-----------------+
let s:red = { "gui": "#E06C75", "cterm": "204", "cterm16": "1" } " Alternate cterm: 168
let s:orange = { "gui": "#BE5046", "cterm": "196", "cterm16": "9" }
let s:dark_green = { "gui": "#638f63", "cterm": "2", "cterm16": "2" }
let s:green = { "gui": "#98C379", "cterm": "114", "cterm16": "10" }
let s:yellow = { "gui": "#E5C07B", "cterm": "180", "cterm16": "11" }
let s:brown = { "gui": "#D19A66", "cterm": "173", "cterm16": "3" }
let s:dark_blue = { "gui": "#59798f", "cterm": "4", "cterm16": "4" }
let s:blue = { "gui": "#61AFEF", "cterm": "39", "cterm16": "12" } " Alternate cterm: 75
let s:dark_purple = { "gui": "#85678f", "cterm": "5", "cterm16": "5" } " Alternate cterm: 176
let s:purple = { "gui": "#C678DD", "cterm": "170", "cterm16": "13" } " Alternate cterm: 176
let s:dark_cyan = { "gui": "#56B6C2", "cterm": "6", "cterm16": "6" } " Alternate cterm: 73
let s:cyan = { "gui": "#56B6C2", "cterm": "38", "cterm16": "14" } " Alternate cterm: 73
let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "15" }
let s:black = { "gui": "#282C34", "cterm": "234", "cterm16": "0" }
let s:visual_black = { "gui": "NONE", "cterm": "NONE", "cterm16": "NONE" } " Black out selected text in 16-color visual mode
let s:light_grey = { "gui": "#5C6370", "cterm": "59", "cterm16": "7" }
let s:dark_grey = { "gui": "#636D83", "cterm": "238", "cterm16": "8" }
let s:primary = s:blue
let s:secondary = s:dark_blue

" +---------------------------------------------------------+
" | Syntax Groups (descriptions and ordering from `:h w18`) |
" +---------------------------------------------------------+

call s:h("Comment", { "fg": s:light_grey, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:cyan }) " any constant
call s:h("String", { "fg": s:green }) " a string constant: 'this is a string'
call s:h("Character", { "fg": s:green }) " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:brown }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:brown }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:brown }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:red }) " any variable name
call s:h("Function", { "fg": s:blue }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:purple }) " any statement
call s:h("Conditional", { "fg": s:purple }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:purple }) " for, do, while, etc.
call s:h("Label", { "fg": s:purple }) " case, default, etc.
call s:h("Operator", { "fg": s:dark_purple }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:red }) " any other keyword
call s:h("Exception", { "fg": s:purple }) " try, catch, throw
call s:h("PreProc", { "fg": s:yellow }) " generic Preprocessor
call s:h("Include", { "fg": s:blue }) " preprocessor #include
call s:h("Define", { "fg": s:purple }) " preprocessor #define
call s:h("Macro", { "fg": s:purple }) " same as Define
call s:h("PreCondit", { "fg": s:yellow }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:yellow }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:yellow }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:yellow }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:yellow }) " A typedef
call s:h("Special", { "fg": s:blue }) " any special symbol
call s:h("SpecialChar", {}) " special character in a constant
call s:h("Tag", {}) " you can use CTRL-] on this
call s:h("Delimiter", {}) " character that needs attention
call s:h("SpecialComment", {}) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", {}) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:red }) " any erroneous construct
call s:h("Todo", { "fg": s:purple }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" +----------------------------------------------------------------------+
" | Highlighting Groups (descriptions and ordering from `:h hitest.vim`) |
" +----------------------------------------------------------------------+

call s:h("ColorColumn", { "bg": s:dark_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:black, "bg": s:blue }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:dark_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:h("CursorLine", { }) " the screen line that the cursor is in when 'cursorline' is set
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green }) " diff mode: Added line
call s:h("DiffChange", { "bg": s:orange }) " diff mode: Changed line
call s:h("DiffDelete", { "fg": s:red }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:dark_grey, "fg": s:yellow }) " diff mode: Changed text within a changed line
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:dark_grey }) " the column separating vertically split windows
call s:h("Folded", { "fg": s:light_grey }) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:black, "bg": s:orange }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:dark_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", { "fg": s:primary }) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", { "fg": s:primary }) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:dark_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:white }) " normal text
call s:h("Pmenu", { "bg": s:visual_black }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:visual_black, "bg": s:secondary }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:secondary }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:primary }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:purple }) " hit-enter prompt and yes/no questions
call s:h("Search", { "fg": s:visual_black, "bg": s:dark_grey }) " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
call s:h("SpecialKey", { "fg": s:dark_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:brown }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:brown }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:brown }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:secondary })  "status line of current window
call s:h("StatusLineNC", { "fg": s:dark_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("TabLine", { "fg": s:secondary }) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:white, "bg": s:secondary }) " tab pages line, active tab page label
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "fg": s:black, "bg": s:purple }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:dark_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:primary }) " current match in 'wildmenu' completion

" +--------------------------------+
" | Language-Specific Highlighting |
" +--------------------------------+

" CSS
call s:h("cssAttrComma", { "fg": s:purple })
call s:h("cssAttributeSelector", { "fg": s:green })
call s:h("cssBraces", { "fg": s:white })
call s:h("cssClassName", { "fg": s:brown })
call s:h("cssClassNameDot", { "fg": s:brown })
call s:h("cssDefinition", { "fg": s:purple })
call s:h("cssFontAttr", { "fg": s:brown })
call s:h("cssFontDescriptor", { "fg": s:purple })
call s:h("cssFunctionName", { "fg": s:blue })
call s:h("cssIdentifier", { "fg": s:blue })
call s:h("cssImportant", { "fg": s:purple })
call s:h("cssInclude", { "fg": s:white })
call s:h("cssIncludeKeyword", { "fg": s:purple })
call s:h("cssMediaType", { "fg": s:brown })
call s:h("cssProp", { "fg": s:white })
call s:h("cssPseudoClassId", { "fg": s:brown })
call s:h("cssSelectorOp", { "fg": s:purple })
call s:h("cssSelectorOp2", { "fg": s:purple })
call s:h("cssTagName", { "fg": s:red })

" HTML
call s:h("htmlTitle", { "fg": s:white })
call s:h("htmlArg", { "fg": s:brown })
call s:h("htmlEndTag", { "fg": s:white })
call s:h("htmlH1", { "fg": s:white })
call s:h("htmlLink", { "fg": s:purple })
call s:h("htmlSpecialChar", { "fg": s:brown })
call s:h("htmlSpecialTagName", { "fg": s:red })
call s:h("htmlTag", { "fg": s:white })
call s:h("htmlTagName", { "fg": s:red })

" JavaScript
call s:h("javaScriptBraces", { "fg": s:white })
call s:h("javaScriptFunction", { "fg": s:purple })
call s:h("javaScriptIdentifier", { "fg": s:purple })
call s:h("javaScriptNull", { "fg": s:brown })
call s:h("javaScriptNumber", { "fg": s:brown })
call s:h("javaScriptRequire", { "fg": s:cyan })
call s:h("javaScriptReserved", { "fg": s:purple })
" https://github.com/pangloss/vim-javascript
call s:h("jsArrowFunction", { "fg": s:purple })
call s:h("jsClassKeyword", { "fg": s:purple })
call s:h("jsClassMethodType", { "fg": s:purple })
call s:h("jsDocParam", { "fg": s:blue })
call s:h("jsDocTags", { "fg": s:purple })
call s:h("jsExport", { "fg": s:purple })
call s:h("jsExportDefault", { "fg": s:purple })
call s:h("jsExtendsKeyword", { "fg": s:purple })
call s:h("jsFrom", { "fg": s:purple })
call s:h("jsFuncCall", { "fg": s:blue })
call s:h("jsFunction", { "fg": s:purple })
call s:h("jsGlobalObjects", { "fg": s:yellow })
call s:h("jsImport", { "fg": s:purple })
call s:h("jsModuleAs", { "fg": s:purple })
call s:h("jsModuleWords", { "fg": s:purple })
call s:h("jsModules", { "fg": s:purple })
call s:h("jsNull", { "fg": s:brown })
call s:h("jsOperator", { "fg": s:purple })
call s:h("jsStorageClass", { "fg": s:purple })
call s:h("jsSuper", { "fg": s:red })
call s:h("jsTemplateBraces", { "fg": s:orange })
call s:h("jsTemplateVar", { "fg": s:green })
call s:h("jsThis", { "fg": s:red })
call s:h("jsUndefined", { "fg": s:brown })
" https://github.com/othree/yajs.vim
call s:h("javascriptArrowFunc", { "fg": s:purple })
call s:h("javascriptClassExtends", { "fg": s:purple })
call s:h("javascriptClassKeyword", { "fg": s:purple })
call s:h("javascriptDocNotation", { "fg": s:purple })
call s:h("javascriptDocParamName", { "fg": s:blue })
call s:h("javascriptDocTags", { "fg": s:purple })
call s:h("javascriptEndColons", { "fg": s:white })
call s:h("javascriptExport", { "fg": s:purple })
call s:h("javascriptFuncArg", { "fg": s:white })
call s:h("javascriptFuncKeyword", { "fg": s:purple })
call s:h("javascriptIdentifier", { "fg": s:red })
call s:h("javascriptImport", { "fg": s:purple })
call s:h("javascriptMethodName", { "fg": s:white })
call s:h("javascriptObjectLabel", { "fg": s:white })
call s:h("javascriptOpSymbol", { "fg": s:cyan })
call s:h("javascriptOpSymbols", { "fg": s:cyan })
call s:h("javascriptPropertyName", { "fg": s:green })
call s:h("javascriptTemplateSB", { "fg": s:orange })
call s:h("javascriptVariable", { "fg": s:purple })

" JSON
call s:h("jsonCommentError", { "fg": s:white })
call s:h("jsonKeyword", { "fg": s:red })
call s:h("jsonBoolean", { "fg": s:brown })
call s:h("jsonNumber", { "fg": s:brown })
call s:h("jsonQuote", { "fg": s:white })
call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonString", { "fg": s:green })
call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })

" Markdown
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownHeadingDelimiter", { "fg": s:red })
call s:h("markdownRule", { "fg": s:light_grey })
call s:h("markdownHeadingRule", { "fg": s:light_grey })
call s:h("markdownH1", { "fg": s:red })
call s:h("markdownH2", { "fg": s:red })
call s:h("markdownH3", { "fg": s:red })
call s:h("markdownH4", { "fg": s:red })
call s:h("markdownH5", { "fg": s:red })
call s:h("markdownH6", { "fg": s:red })
call s:h("markdownIdDelimiter", { "fg": s:purple })
call s:h("markdownId", { "fg": s:purple })
call s:h("markdownBlockquote", { "fg": s:light_grey })
call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
call s:h("markdownBold", { "fg": s:brown, "gui": "bold", "cterm": "bold" })
call s:h("markdownListMarker", { "fg": s:red })
call s:h("markdownOrderedListMarker", { "fg": s:red })
call s:h("markdownIdDeclaration", { "fg": s:blue })
call s:h("markdownLinkText", { "fg": s:blue })
call s:h("markdownLinkDelimiter", { "fg": s:white })
call s:h("markdownUrl", { "fg": s:purple })

" PHP
call s:h("phpVarSelector", { "fg": s:red })
call s:h("phpOperator", { "fg": s:white })
call s:h("phpParent", { "fg": s:white })
call s:h("phpMemberSelector", { "fg": s:white })
call s:h("phpType", { "fg": s:purple })
call s:h("phpKeyword", { "fg": s:purple })
call s:h("phpClass", { "fg": s:yellow })
call s:h("phpUseClass", { "fg": s:white })
call s:h("phpUseAlias", { "fg": s:white })
call s:h("phpInclude", { "fg": s:purple })
call s:h("phpClassExtends", { "fg": s:green })
call s:h("phpDocTags", { "fg": s:white })
call s:h("phpFunction", { "fg": s:blue })
call s:h("phpFunctions", { "fg": s:cyan })
call s:h("phpMethodsVar", { "fg": s:brown })
call s:h("phpMagicConstants", { "fg": s:brown })
call s:h("phpSuperglobals", { "fg": s:red })
call s:h("phpConstants", { "fg": s:brown })

" Ruby
call s:h("rubyBlockParameter", { "fg": s:red})
call s:h("rubyBlockParameterList", { "fg": s:red })
call s:h("rubyClass", { "fg": s:purple})
call s:h("rubyConstant", { "fg": s:yellow})
call s:h("rubyControl", { "fg": s:purple })
call s:h("rubyEscape", { "fg": s:red})
call s:h("rubyFunction", { "fg": s:blue})
call s:h("rubyGlobalVariable", { "fg": s:red})
call s:h("rubyInclude", { "fg": s:blue})
call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red})
call s:h("rubyInstanceVariable", { "fg": s:red})
call s:h("rubyInterpolation", { "fg": s:cyan })
call s:h("rubyInterpolationDelimiter", { "fg": s:red })
call s:h("rubyInterpolationDelimiter", { "fg": s:red})
call s:h("rubyRegexp", { "fg": s:cyan})
call s:h("rubyRegexpDelimiter", { "fg": s:cyan})
call s:h("rubyStringDelimiter", { "fg": s:green})
call s:h("rubySymbol", { "fg": s:cyan})

" Sass
call s:h("sassAmpersand", { "fg": s:red })
call s:h("sassClass", { "fg": s:brown })
call s:h("sassControl", { "fg": s:purple })
call s:h("sassExtend", { "fg": s:purple })
call s:h("sassFor", { "fg": s:white })
call s:h("sassFunction", { "fg": s:cyan })
call s:h("sassId", { "fg": s:blue })
call s:h("sassInclude", { "fg": s:purple })
call s:h("sassMedia", { "fg": s:purple })
call s:h("sassMediaOperators", { "fg": s:white })
call s:h("sassMixin", { "fg": s:purple })
call s:h("sassMixinName", { "fg": s:blue })
call s:h("sassMixing", { "fg": s:purple })

" TypeScript
call s:h("typescriptReserved", { "fg": s:purple })
call s:h("typescriptEndColons", { "fg": s:white })
call s:h("typescriptBraces", { "fg": s:white })

" XML
call s:h("xmlAttrib", { "fg": s:brown })
call s:h("xmlEndTag", { "fg": s:red })
call s:h("xmlTag", { "fg": s:red })
call s:h("xmlTagName", { "fg": s:red })

" Python
call s:h("pythonInclude", { "fg": s:purple })

" +---------------------+
" | Plugin Highlighting |
" +---------------------+

" airblade/vim-gitgutter
hi link GitGutterAdd    SignifySignAdd
hi link GitGutterChange SignifySignChange
hi link GitGutterDelete SignifySignDelete

" mhinz/vim-signify
call s:h("SignifySignAdd", { "fg": s:green })
call s:h("SignifySignChange", { "fg": s:orange })
call s:h("SignifySignDelete", { "fg": s:red })

" neomake/neomake
call s:h("NeomakeWarningSign", { "fg": s:yellow })
call s:h("NeomakeErrorSign", { "fg": s:red })
call s:h("NeomakeInfoSign", { "fg": s:blue })

" tpope/vim-fugitive
call s:h("diffAdded", { "fg": s:green })
call s:h("diffRemoved", { "fg": s:red })

" +------------------+
" | Git Highlighting |
" +------------------+

call s:h("gitcommitComment", { "fg": s:light_grey })
call s:h("gitcommitUnmerged", { "fg": s:green })
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:purple })
call s:h("gitcommitDiscardedType", { "fg": s:red })
call s:h("gitcommitSelectedType", { "fg": s:green })
call s:h("gitcommitHeader", {})
call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
call s:h("gitcommitDiscardedFile", { "fg": s:red })
call s:h("gitcommitSelectedFile", { "fg": s:green })
call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
call s:h("gitcommitFile", {})
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" +------------------------+
" | Neovim terminal colors |
" +------------------------+

if has("nvim")
  let g:terminal_color_0 =  s:black.gui
  let g:terminal_color_1 =  s:red.gui
  let g:terminal_color_2 =  s:green.gui
  let g:terminal_color_3 =  s:yellow.gui
  let g:terminal_color_4 =  s:blue.gui
  let g:terminal_color_5 =  s:purple.gui
  let g:terminal_color_6 =  s:cyan.gui
  let g:terminal_color_7 =  s:white.gui
  let g:terminal_color_8 =  s:dark_grey.gui
  let g:terminal_color_9 =  s:orange.gui
  let g:terminal_color_10 = s:green.gui " No dark version
  let g:terminal_color_11 = s:brown.gui
  let g:terminal_color_12 = s:blue.gui " No dark version
  let g:terminal_color_13 = s:purple.gui " No dark version
  let g:terminal_color_14 = s:cyan.gui " No dark version
  let g:terminal_color_15 = s:light_grey.gui
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
endif
