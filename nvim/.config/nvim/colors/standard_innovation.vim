" Standard Innovation Vim Color Scheme
" Based on Dracula Pro with custom modifications

" Initialization
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "standard_innovation"

" Define colors
let s:black = "#000000"
let s:black_nearly = "#0A0A0A"
let s:gray_light = "#F8F8F2"
let s:gray_blue = "#D9EEF6"
let s:green_teal = "#173A3F"
let s:green_lime = "#C9FF86"
let s:green_neon = "#00FFCB"
let s:green_camo = "#689481"
let s:dracula_blade_bg = "#212C2A"

" Standard Innovation Colors
let s:bg = s:dracula_blade_bg
let s:bglight = s:green_lime
let s:comment = s:green_camo
let s:selection = s:green_teal
let s:subtle = "#424450"
let s:cyan = s:green_neon
let s:green = s:green_lime
let s:orange = "#FFCA80"
let s:pink = "#FF80BF"
let s:purple = "#9580FF"
let s:red = "#FF9580"
let s:yellow = "#FFFF80"

" Basic UI
exe "hi Normal guifg=" . s:gray_light . " guibg=" . s:bg
exe "hi CursorLine guibg=" . s:bglight . " cterm=NONE"
exe "hi CursorColumn guibg=" . s:bglight
exe "hi ColorColumn guibg=" . s:green_camo
exe "hi LineNr guifg=" . s:comment . " guibg=NONE"
exe "hi CursorLineNr guifg=" . s:yellow . " guibg=" . s:bglight
exe "hi VertSplit guifg=" . s:comment . " guibg=NONE"
exe "hi StatusLine guifg=" . s:black_nearly . " guibg=" . s:green_camo . " gui=bold"
exe "hi StatusLineNC guifg=" . s:black_nearly . " guibg=" . s:bglight
exe "hi Pmenu guifg=" . s:gray_light . " guibg=" . s:green_camo
exe "hi PmenuSel guifg=" . s:gray_light . " guibg=" . s:selection
exe "hi PmenuSbar guibg=" . s:green_camo
exe "hi PmenuThumb guibg=" . s:selection

" Search and matching
exe "hi Search guifg=" . s:bg . " guibg=" . s:green
exe "hi IncSearch guifg=" . s:bg . " guibg=" . s:orange
exe "hi MatchParen guifg=" . s:green . " guibg=NONE gui=underline"

" Messages
exe "hi ErrorMsg guifg=" . s:red . " guibg=NONE gui=bold"
exe "hi WarningMsg guifg=" . s:orange . " guibg=NONE gui=bold"
exe "hi MoreMsg guifg=" . s:green . " guibg=NONE"
exe "hi Question guifg=" . s:cyan . " guibg=NONE"

" Syntax highlighting
exe "hi Comment guifg=" . s:comment . " gui=italic"
exe "hi Constant guifg=" . s:purple
exe "hi String guifg=" . s:yellow
exe "hi Character guifg=" . s:pink
exe "hi Number guifg=" . s:purple
exe "hi Boolean guifg=" . s:purple
exe "hi Float guifg=" . s:purple

exe "hi Identifier guifg=" . s:gray_light
exe "hi Function guifg=" . s:green_neon

exe "hi Statement guifg=" . s:pink . " gui=bold"
exe "hi Conditional guifg=" . s:pink . " gui=bold"
exe "hi Repeat guifg=" . s:pink . " gui=bold"
exe "hi Label guifg=" . s:pink . " gui=bold"
exe "hi Operator guifg=" . s:pink
exe "hi Keyword guifg=" . s:pink . " gui=bold"
exe "hi Exception guifg=" . s:pink . " gui=bold"

exe "hi PreProc guifg=" . s:pink
exe "hi Include guifg=" . s:pink
exe "hi Define guifg=" . s:pink
exe "hi Macro guifg=" . s:pink
exe "hi PreCondit guifg=" . s:pink

exe "hi Type guifg=" . s:green_neon . " gui=NONE"
exe "hi StorageClass guifg=" . s:pink . " gui=bold"
exe "hi Structure guifg=" . s:pink
exe "hi Typedef guifg=" . s:pink

exe "hi Special guifg=" . s:pink
exe "hi SpecialChar guifg=" . s:orange
exe "hi Tag guifg=" . s:cyan
exe "hi Delimiter guifg=" . s:gray_light
exe "hi SpecialComment guifg=" . s:cyan . " gui=italic"
exe "hi Debug guifg=" . s:red

exe "hi Underlined guifg=" . s:cyan . " gui=underline"
exe "hi Error guifg=" . s:red . " guibg=NONE gui=bold"
exe "hi Todo guifg=" . s:bg . " guibg=" . s:cyan . " gui=bold"

" Diff colors
exe "hi DiffAdd guifg=" . s:green . " guibg=" . s:green_camo
exe "hi DiffChange guifg=" . s:orange . " guibg=" . s:green_camo
exe "hi DiffDelete guifg=" . s:red . " guibg=" . s:green_camo
exe "hi DiffText guifg=" . s:bg . " guibg=" . s:orange . " gui=bold"

" Folding
exe "hi Folded guifg=" . s:comment . " guibg=" . s:green_camo
exe "hi FoldColumn guifg=" . s:comment . " guibg=" . s:green_camo

" Signs
exe "hi SignColumn guifg=" . s:comment . " guibg=NONE"

" Visual mode
exe "hi Visual guibg=" . s:selection
exe "hi VisualNOS guibg=" . s:selection

" Tabs
exe "hi TabLine guifg=" . s:comment . " guibg=" . s:green_camo
exe "hi TabLineFill guibg=" . s:green_camo
exe "hi TabLineSel guifg=" . s:gray_light . " guibg=" . s:bg

" NonText
exe "hi NonText guifg=" . s:subtle
exe "hi SpecialKey guifg=" . s:red

" Directory
exe "hi Directory guifg=" . s:purple . " gui=bold"

" Title
exe "hi Title guifg=" . s:green . " gui=bold"

" WildMenu
exe "hi WildMenu guifg=" . s:bg . " guibg=" . s:purple . " gui=bold"

" Cursor
exe "hi Cursor guifg=" . s:bg . " guibg=" . s:gray_light
exe "hi lCursor guifg=" . s:bg . " guibg=" . s:gray_light

" Language specific
" Ruby
exe "hi rubyClass guifg=" . s:pink . " gui=bold"
exe "hi rubyModule guifg=" . s:pink . " gui=bold"
exe "hi rubyDefine guifg=" . s:pink . " gui=bold"
exe "hi rubyFunction guifg=" . s:green_neon
exe "hi rubyClassName guifg=" . s:green_neon . " gui=bold"
exe "hi rubyModuleName guifg=" . s:green_neon . " gui=bold"
exe "hi rubySymbol guifg=" . s:purple
exe "hi rubyConstant guifg=" . s:green_neon
exe "hi rubyStringDelimiter guifg=" . s:yellow
exe "hi rubyBlockParameter guifg=" . s:orange
exe "hi rubyInstanceVariable guifg=" . s:orange
exe "hi rubyInclude guifg=" . s:pink . " gui=bold"
exe "hi rubyGlobalVariable guifg=" . s:orange
exe "hi rubyRegexp guifg=" . s:yellow
exe "hi rubyRegexpDelimiter guifg=" . s:yellow
exe "hi rubyEscape guifg=" . s:orange
exe "hi rubyControl guifg=" . s:pink . " gui=bold"
exe "hi rubyClassVariable guifg=" . s:orange

" Python
exe "hi pythonBuiltin guifg=" . s:cyan
exe "hi pythonBuiltinObj guifg=" . s:green_neon
exe "hi pythonBuiltinFunc guifg=" . s:green_neon
exe "hi pythonFunction guifg=" . s:green_neon
exe "hi pythonDecorator guifg=" . s:orange
exe "hi pythonInclude guifg=" . s:pink . " gui=bold"
exe "hi pythonImport guifg=" . s:pink . " gui=bold"
exe "hi pythonRun guifg=" . s:comment
exe "hi pythonCoding guifg=" . s:comment
exe "hi pythonOperator guifg=" . s:pink
exe "hi pythonException guifg=" . s:red
exe "hi pythonExceptions guifg=" . s:red
exe "hi pythonBoolean guifg=" . s:purple
exe "hi pythonDot guifg=" . s:gray_light
exe "hi pythonConditional guifg=" . s:pink . " gui=bold"
exe "hi pythonRepeat guifg=" . s:pink . " gui=bold"
exe "hi pythonDottedName guifg=" . s:green_neon

" JavaScript
exe "hi javaScriptBraces guifg=" . s:gray_light
exe "hi javaScriptFunction guifg=" . s:pink . " gui=bold"
exe "hi javaScriptIdentifier guifg=" . s:pink . " gui=bold"
exe "hi javaScriptNull guifg=" . s:purple
exe "hi javaScriptNumber guifg=" . s:purple
exe "hi javaScriptRequire guifg=" . s:cyan
exe "hi javaScriptReserved guifg=" . s:pink . " gui=bold"
exe "hi jsArrowFunction guifg=" . s:pink
exe "hi jsClassKeyword guifg=" . s:pink . " gui=bold"
exe "hi jsClassDefinition guifg=" . s:green_neon
exe "hi jsClassMethodType guifg=" . s:pink . " gui=bold"
exe "hi jsDestructuringAssignment guifg=" . s:orange
exe "hi jsDocParam guifg=" . s:orange
exe "hi jsDocTags guifg=" . s:pink . " gui=bold"
exe "hi jsDocType guifg=" . s:green_neon
exe "hi jsDocTypeBrackets guifg=" . s:cyan
exe "hi jsFuncArgs guifg=" . s:orange
exe "hi jsFuncCall guifg=" . s:green_neon
exe "hi jsFunction guifg=" . s:pink . " gui=bold"
exe "hi jsGlobalObjects guifg=" . s:green_neon
exe "hi jsModuleAs guifg=" . s:pink . " gui=bold"
exe "hi jsModuleWords guifg=" . s:pink . " gui=bold"
exe "hi jsModules guifg=" . s:pink . " gui=bold"
exe "hi jsNull guifg=" . s:purple
exe "hi jsOperator guifg=" . s:pink
exe "hi jsStorageClass guifg=" . s:pink . " gui=bold"
exe "hi jsSuper guifg=" . s:purple . " gui=italic"
exe "hi jsTemplateBraces guifg=" . s:pink
exe "hi jsTemplateVar guifg=" . s:green
exe "hi jsThis guifg=" . s:purple . " gui=italic"
exe "hi jsUndefined guifg=" . s:purple

" HTML
exe "hi htmlTag guifg=" . s:gray_light
exe "hi htmlEndTag guifg=" . s:gray_light
exe "hi htmlTagName guifg=" . s:pink
exe "hi htmlArg guifg=" . s:green . " gui=italic"
exe "hi htmlSpecialChar guifg=" . s:purple
exe "hi htmlTitle guifg=" . s:gray_light
exe "hi htmlH1 guifg=" . s:gray_light . " gui=bold"
exe "hi htmlH2 guifg=" . s:gray_light . " gui=bold"
exe "hi htmlH3 guifg=" . s:gray_light . " gui=bold"
exe "hi htmlH4 guifg=" . s:gray_light . " gui=bold"
exe "hi htmlH5 guifg=" . s:gray_light . " gui=bold"
exe "hi htmlH6 guifg=" . s:gray_light . " gui=bold"

" CSS
exe "hi cssClassName guifg=" . s:green
exe "hi cssClassNameDot guifg=" . s:green
exe "hi cssIdentifier guifg=" . s:cyan
exe "hi cssProp guifg=" . s:cyan
exe "hi cssVendor guifg=" . s:gray_light
exe "hi cssAttrComma guifg=" . s:gray_light
exe "hi cssAttributeSelector guifg=" . s:green . " gui=italic"
exe "hi cssBraces guifg=" . s:gray_light
exe "hi cssFunctionComma guifg=" . s:gray_light
exe "hi cssFunctionName guifg=" . s:green_neon
exe "hi cssNoise guifg=" . s:pink
exe "hi cssPseudoClass guifg=" . s:pink
exe "hi cssPseudoClassId guifg=" . s:green . " gui=italic"
exe "hi cssUnitDecorators guifg=" . s:pink

" Markdown
exe "hi markdownH1 guifg=" . s:purple . " gui=bold"
exe "hi markdownH2 guifg=" . s:purple . " gui=bold"
exe "hi markdownH3 guifg=" . s:purple . " gui=bold"
exe "hi markdownH4 guifg=" . s:purple . " gui=bold"
exe "hi markdownH5 guifg=" . s:purple . " gui=bold"
exe "hi markdownH6 guifg=" . s:purple . " gui=bold"
exe "hi markdownHeadingDelimiter guifg=" . s:purple . " gui=bold"
exe "hi markdownHeadingRule guifg=" . s:purple . " gui=bold"
exe "hi markdownBlockquote guifg=" . s:cyan
exe "hi markdownBold guifg=" . s:orange . " gui=bold"
exe "hi markdownBoldItalic guifg=" . s:orange . " gui=bold,italic"
exe "hi markdownCode guifg=" . s:green
exe "hi markdownCodeBlock guifg=" . s:green
exe "hi markdownCodeDelimiter guifg=" . s:green
exe "hi markdownItalic guifg=" . s:yellow . " gui=italic"
exe "hi markdownLinkText guifg=" . s:pink
exe "hi markdownListMarker guifg=" . s:cyan
exe "hi markdownOrderedListMarker guifg=" . s:cyan
exe "hi markdownRule guifg=" . s:comment
exe "hi markdownUrl guifg=" . s:cyan . " gui=underline"

" YAML
exe "hi yamlBlockMappingKey guifg=" . s:cyan
exe "hi yamlBool guifg=" . s:purple
exe "hi yamlDocumentStart guifg=" . s:pink
exe "hi yamlKey guifg=" . s:cyan
exe "hi yamlString guifg=" . s:yellow

" Git
exe "hi gitCommitOverflow guifg=" . s:red
exe "hi gitCommitSummary guifg=" . s:green
exe "hi gitCommitComment guifg=" . s:comment
exe "hi gitCommitUntracked guifg=" . s:comment
exe "hi gitCommitDiscarded guifg=" . s:comment
exe "hi gitCommitSelected guifg=" . s:comment
exe "hi gitCommitHeader guifg=" . s:purple
exe "hi gitCommitSelectedType guifg=" . s:cyan
exe "hi gitCommitUnmergedType guifg=" . s:cyan
exe "hi gitCommitDiscardedType guifg=" . s:cyan
exe "hi gitCommitBranch guifg=" . s:orange . " gui=bold"
exe "hi gitCommitUntrackedFile guifg=" . s:yellow
exe "hi gitCommitUnmergedFile guifg=" . s:red . " gui=bold"
exe "hi gitCommitDiscardedFile guifg=" . s:red . " gui=bold"
exe "hi gitCommitSelectedFile guifg=" . s:green . " gui=bold"

" GitGutter
exe "hi GitGutterAdd guifg=" . s:green . " guibg=NONE"
exe "hi GitGutterChange guifg=" . s:orange . " guibg=NONE"
exe "hi GitGutterDelete guifg=" . s:red . " guibg=NONE"
exe "hi GitGutterChangeDelete guifg=" . s:orange . " guibg=NONE"

" NERDTree
exe "hi NERDTreeDirSlash guifg=" . s:cyan
exe "hi NERDTreeExecFile guifg=" . s:gray_light
exe "hi NERDTreeOpenable guifg=" . s:orange
exe "hi NERDTreeClosable guifg=" . s:orange
exe "hi NERDTreeDir guifg=" . s:purple . " gui=bold"
exe "hi NERDTreeUp guifg=" . s:gray_light

" Neovim specific
if has('nvim')
  exe "hi NvimInternalError guifg=" . s:red . " guibg=" . s:bg . " gui=bold"
  
  " Treesitter
  exe "hi @function guifg=" . s:green_neon
  exe "hi @function.builtin guifg=" . s:green_neon
  exe "hi @function.macro guifg=" . s:green_neon
  exe "hi @method guifg=" . s:green_neon
  exe "hi @method.call guifg=" . s:green_neon
  exe "hi @constructor guifg=" . s:green_neon
  exe "hi @parameter guifg=" . s:orange . " gui=italic"
  exe "hi @keyword guifg=" . s:pink . " gui=bold"
  exe "hi @keyword.function guifg=" . s:pink . " gui=bold"
  exe "hi @keyword.operator guifg=" . s:pink
  exe "hi @keyword.return guifg=" . s:pink . " gui=bold"
  exe "hi @conditional guifg=" . s:pink . " gui=bold"
  exe "hi @repeat guifg=" . s:pink . " gui=bold"
  exe "hi @label guifg=" . s:purple . " gui=italic"
  exe "hi @include guifg=" . s:pink . " gui=bold"
  exe "hi @exception guifg=" . s:purple
  exe "hi @type guifg=" . s:green_neon
  exe "hi @type.builtin guifg=" . s:pink . " gui=italic"
  exe "hi @type.definition guifg=" . s:green_neon
  exe "hi @type.qualifier guifg=" . s:pink . " gui=bold"
  exe "hi @namespace guifg=" . s:green_neon
  exe "hi @annotation guifg=" . s:yellow
  exe "hi @text guifg=" . s:gray_light
  exe "hi @text.strong guifg=" . s:gray_light . " gui=bold"
  exe "hi @text.emphasis guifg=" . s:gray_light . " gui=italic"
  exe "hi @text.underline guifg=" . s:gray_light . " gui=underline"
  exe "hi @text.title guifg=" . s:purple . " gui=bold"
  exe "hi @text.literal guifg=" . s:yellow
  exe "hi @text.uri guifg=" . s:cyan . " gui=underline"
  exe "hi @string guifg=" . s:yellow
  exe "hi @string.regex guifg=" . s:red
  exe "hi @string.escape guifg=" . s:orange
  exe "hi @string.special guifg=" . s:orange
  exe "hi @character guifg=" . s:pink
  exe "hi @character.special guifg=" . s:orange
  exe "hi @boolean guifg=" . s:purple
  exe "hi @number guifg=" . s:purple
  exe "hi @float guifg=" . s:purple
  exe "hi @variable guifg=" . s:gray_light
  exe "hi @variable.builtin guifg=" . s:purple . " gui=italic"
  exe "hi @constant guifg=" . s:purple
  exe "hi @constant.builtin guifg=" . s:purple
  exe "hi @constant.macro guifg=" . s:pink
  exe "hi @symbol guifg=" . s:purple
  exe "hi @field guifg=" . s:orange
  exe "hi @property guifg=" . s:gray_light
  exe "hi @operator guifg=" . s:pink
  exe "hi @comment guifg=" . s:comment . " gui=italic"
  exe "hi @punctuation.delimiter guifg=" . s:gray_light
  exe "hi @punctuation.bracket guifg=" . s:gray_light
  exe "hi @punctuation.special guifg=" . s:pink
  exe "hi @tag guifg=" . s:pink
  exe "hi @tag.delimiter guifg=" . s:gray_light
  exe "hi @tag.attribute guifg=" . s:green . " gui=italic"
  exe "hi @attribute guifg=" . s:green . " gui=italic"
  exe "hi @error guifg=" . s:red

  " LSP
  exe "hi @lsp.type.class guifg=" . s:green_neon
  exe "hi @lsp.type.function guifg=" . s:green_neon
  exe "hi @lsp.type.method guifg=" . s:green_neon
  exe "hi @lsp.type.parameter guifg=" . s:orange . " gui=italic"
  exe "hi @lsp.type.property guifg=" . s:orange
  exe "hi @lsp.type.enum guifg=" . s:green_neon
  exe "hi @lsp.type.interface guifg=" . s:green_neon
  exe "hi @lsp.type.struct guifg=" . s:green_neon
  exe "hi @lsp.type.namespace guifg=" . s:green_neon
  exe "hi @lsp.type.variable guifg=" . s:gray_light
  
  " Diagnostics
  exe "hi DiagnosticError guifg=" . s:red
  exe "hi DiagnosticWarn guifg=" . s:orange
  exe "hi DiagnosticInfo guifg=" . s:cyan
  exe "hi DiagnosticHint guifg=" . s:cyan
  exe "hi DiagnosticUnderlineError gui=undercurl guisp=" . s:red
  exe "hi DiagnosticUnderlineWarn gui=undercurl guisp=" . s:orange
  exe "hi DiagnosticUnderlineInfo gui=undercurl guisp=" . s:cyan
  exe "hi DiagnosticUnderlineHint gui=undercurl guisp=" . s:cyan
endif
