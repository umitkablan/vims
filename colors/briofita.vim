" Briofita Colorscheme Heading:
" ====================================================================================
" Name:       Briofita
" Scriptname:  briofita.vim                                                               {{{1
" Author:      Sergio Nobre <sergio.o.nobre@gmail.com>
" License:     The Vim License (this command will show it: ':help copyright')
" Website:     http://www.vim.org/scripts/script.php?script_id=4136
" Last Change: v3.0.5: October 25, 2013
" Note:        Check the companion help file for usage help and the release history.
"              Newer versions may be downloaded from the above mentioned web address.
" ====================================================================================

" Beginning:                                                                              {{{1
let this_color = "briofita"
" if (!has('gui_running')) || (!v:version >= 703)
"     echoerr "Colorscheme " . this_color . " was designed only for Vim versions >= 7.3.0 in GUI mode."
"     finish
" endif

let    s:briofitaversion = ["3.0.5"]
unlet! g:briofitaversion
let    g:briofitaversion = copy(s:briofitaversion)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = this_color
unlet this_color
let save_cpo = &cpo
set cpo&vim

" Hardcoded Configurations:
let s:check_cleared_normal_highlight = 1

" use configuration below = 0 if you have any performance concern; otherwise, use 1
" if 0, only a dict of cycling keys is exported;
" if 1, a dict of cycling keys, each with its highlight names in a list, is exported
let s:export_cycling_highlights = 1

" Configuration Dictionary:  s:dic_cf_options:                                         {{{1
" configuration settings
if !exists("s:dic_cf_options")
        " Note:     both the first element and the second may be changed by the colorscheme;
        "           the first element is the option's default value on startup, or is
        "           the option's current value after processing user's options;
        "           the second element, is its limit, if greater than one;
        " Criteria: (1) if the 2nd list element is 1 it means a "boolean" option
        "           so that any non-zero key value means 'true', zero means 'false', and
        "           (highlight subscript zero will be used, if true).
        "           (2) when the 2nd element is (-1) it means its setting is postponed; in this case
        "               the real limit is computed and moved here, based on the given highlights
        "           (3) if the 1st element >= 0, it is subject to automated cycling by some plugin
        "           (4) if the 1st element <= (-1) it is a special case, not subject to automated cycling
        "           (5) if the 1st element == (-2) it is used for distractionless editing mode
        "           (6) reserved for future use: (a) 1st element if equal to (-1)
        let s:dic_cf_options = {
            \ "warnlevel":          [ 0,  1],
            \ "nodistractionmode":  [ 0,  1],
            \ "statusline":         [ 0,  1],
            \ "localcursorline":    [ 0,  1],
            \ "cursorline":         [ 0, -1],
            \ "colorcolumn":        [ 0, -1],
            \ "search":             [ 0, -1],
            \ "diff":               [ 0, -1],
            \ "normal":             [ 0, -1],
            \ "cursorlinenr":       [ 0, -1],
            \ "foldcolumn":         [ 0, -1],
            \ "folded":             [ 0, -1],
            \ "conceal":            [ 0, -1],
            \ "special":            [ 0, -1],
            \ "mix01":              [ 0, -1],
            \ "matchparen":         [ 0, -1],
            \ }
endif
"
" List Of Allowed Options:  s:briofita_allowed_parms:                                     {{{1
" user selectable choices
if !exists("s:briofita_allowed_parms")
        let s:briofita_allowed_parms = [ "nodistractionmode", "statusline",
                              \          "localcursorline",   "cursorline",
                              \          "colorcolumn",       "search",
                              \          "diff",              "normal",
                              \          "cursorlinenr",      "foldcolumn",
                              \          "folded",            "conceal",
                              \          "special",           "mix01",
                              \          "matchparen" ]
endif

function! s:BuildExportVar(opdict,scope)
    " build global informational variable g:briofita_keys
    if exists("g:briofita_keys")
         unlet g:briofita_keys
    endif
	let g:briofita_keys = {}
	for dic2k in keys(a:opdict)
		let l:k2 = dic2k
		execute 'let g:briofita_keys.' . l:k2 . ' = []'
        if (a:scope == 0)
            continue
        endif
		execute 'let dic2 = a:opdict.' . l:k2
		for dic3k in keys(dic2)
            if dic3k < 0
                continue
            endif
			execute 'let dic3 = dic2.' . dic3k
            " FIXME when there is a negative key, the below len() will be incorrect
			execute 'call add(g:briofita_keys.' .
				  \  l:k2 .
				  \  ',"' .
				  \  len(dic3) .
				  \  '")'
			for hilite in dic3
				if len(hilite[0]) > 0
					let hiname = hilite[0]
				else
					let hiname = l:k2
				endif
				execute 'call add(g:briofita_keys.' .
					  \  l:k2 .
					  \  ',"' .
					  \  hiname .
					  \  '")'
			endfor
			execute 'call sort(g:briofita_keys.' . l:k2 . ')'
			break
		endfor
	endfor
endfunction

" Alternative Highlights Dictionary:  s:dic_hi_options                                    {{{1
" dictionary of highlight options: a dict. of dicts. of lists of highlights lists
if !exists("s:dic_hi_options")
        " NOTE: An ""-entry in foreground position means "fg", in background, "bg" (not NONE!).
        " NOTE:             so if you want  NONE in fg/bg position the entry has to be "NONE"!
        " NOTE: An ""-entry in the gui (rightmost position) means "NONE"
        " NOTE: The numeric keys may have the sequence skipped (example: 0 followed by 2)
        " NOTE: The ZERO KEY (0:) is required for all entries (it is the default)!
        let s:dic_hi_options = {
           \    'conceal': {
           \                    0: [
           \                           [ "conceal",   "BurlyWood2",     "bg",           "bold" ],
           \                           [ "vertSplit", "#71D3B4",        "#1E3B31",      "bold" ],
           \                       ],
           \                    1: [
           \                           [ "conceal",   "LightGrey",      "#1E4959",      "bold" ],
           \                           [ "vertSplit", "CornFlowerBlue", "#1E3B31",      "bold" ],
           \                       ],
           \                    2: [
           \                           [ "conceal",   "AquaMarine",     "#880C0E",      "bold" ],
           \                           [ "vertSplit", "FireBrick",      "Gray5",        "bold" ],
           \                       ],
           \                    3: [
           \                           [ "conceal",   "Green",          "#1E4959",      "bold" ],
           \                           [ "vertSplit", "DarkSlateGray",  "DarkSlateGray","bold" ],
           \                       ],
           \                    4: [
           \                           [ "conceal",   "#CCFFCC",        "bg",           "bold" ],
           \                           [ "vertSplit", "Black",          "Black",        "bold" ],
           \                       ],
           \               },
           \    'special': {
           \                    0: [
           \                           [ "Special",           "#88CB35",        "NONE",    "NONE" ],
           \                           [ "helpSectionDelim",  "DeepSkyBlue3",   "NONE",    "NONE" ],
           \                           [ "helpHypertextEntry","SteelBlue3",      "NONE",    "NONE" ],
           \                           [ "helpHypertextJump", "DodgerBlue",     "",        "italic" ],
           \                           [ "helpHeadline",      "AquaMarine3",    "NONE",    "italic" ],
           \                           [ "helpHeader",        "DeepSkyBlue2",   "NONE",    "italic" ],
           \                           [ "helpCommand",       "#F3C284",        "#880C0E",  "" ],
           \                           [ "manLongOptionDesc", "DarkSeaGreen3",  "",        "" ],
           \                           [ "manOptionDesc",     "DarkSeaGreen3",  "",        "bold" ],
           \                           [ "pythonDot",         "#00FFAF",        "",        "bold" ],
           \                           [ "pythonStatement",   "DeepSkyBlue3",   "",        "" ],
           \                           [ "pythonImport",      "DeepSkyBlue3",   "",        "" ],
           \                       ],
           \                    1: [
           \                           [ "Special",           "#78B37A",        "NONE",    "NONE" ],
           \                           [ "helpSectionDelim",  "#0F450F",        "NONE",    "bold,italic" ],
           \                           [ "helpHypertextEntry","AquaMarine4",    "NONE",    "NONE" ],
           \                           [ "helpHypertextJump", "CadetBlue3",     "",        "italic" ],
           \                           [ "helpHeadline",      "AquaMarine3",    "NONE",    "NONE" ],
           \                           [ "helpHeader",        "#2FBBA6",        "NONE",    "NONE" ],
           \                           [ "helpCommand",       "#88CB35",        "NONE",    "" ],
           \                           [ "manLongOptionDesc", "#DAD085",        "Black",   "" ],
           \                           [ "manOptionDesc",     "#DAD085",        "Black",   "" ],
           \                           [ "pythonDot",         "#F38F00",        "",        "bold" ],
           \                           [ "pythonStatement",   "#2FBBA6",        "",        "" ],
           \                           [ "pythonImport",      "DeepSkyBlue3",   "",        "" ],
           \                       ],
           \                    2: [
           \                           [ "Special",           "Gray50",         "NONE",    "NONE" ],
           \                           [ "helpSectionDelim",  "#869BCC",        "NONE",    "NONE" ],
           \                           [ "helpHypertextEntry","#869BCC",        "NONE",    "NONE" ],
           \                           [ "helpHypertextJump", "DodgerBlue",     "",        "italic" ],
           \                           [ "helpHeadline",      "#6CA0FF",        "NONE",    "italic" ],
           \                           [ "helpHeader",        "#00B780",        "NONE",    "italic" ],
           \                           [ "helpCommand",       "#A191F5",        "NONE",    "" ],
           \                           [ "manLongOptionDesc", "LightSkyBlue",   "",        "" ],
           \                           [ "manOptionDesc",     "LightSkyBlue",   "",        "bold" ],
           \                           [ "pythonDot",         "LimeGreen",      "",        "bold" ],
           \                           [ "pythonStatement",   "#2FBBA6",        "",        "" ],
           \                           [ "pythonImport",      "#2FBBA6",   "",        "" ],
           \                       ],
           \                    3: [
           \                           [ "Special",           "AquaMarine",     "#880C0E", "NONE" ],
           \                           [ "helpSectionDelim",  "Brown3",         "NONE",    "NONE" ],
           \                           [ "helpHypertextEntry","Brown3",         "NONE",    "bold" ],
           \                           [ "helpHypertextJump", "DodgerBlue",     "",        "italic" ],
           \                           [ "helpHeadline",      "#6CA0FF",        "NONE",    "italic" ],
           \                           [ "helpHeader",        "#00B780",        "NONE",    "italic" ],
           \                           [ "helpCommand",       "#71D3B4",        "NONE",    "" ],
           \                           [ "manLongOptionDesc", "Pink1",          "",        "" ],
           \                           [ "manOptionDesc",     "Pink1",          "",        "bold" ],
           \                           [ "pythonDot",         "BurlyWood1",     "",        "bold" ],
           \                           [ "pythonStatement",   "CadetBlue",      "",        "" ],
           \                           [ "pythonImport",      "DeepSkyBlue2",   "",        "" ],
           \                       ],
           \               },
           \    'cursorlinenr': {
           \                    0: [
           \                           [  "CursorLineNr", "Orange",           "bg",              "bold"  ],
           \                           [  "vimNumber",    "#7FA2E6",          "bg",              "NONE"  ],
           \                           [  "vimTodo",      "MediumSeaGreen",   "bg",              "italic"  ],
           \                       ],
           \                    1: [
           \                           [  "CursorLineNr", "Yellow",           "bg",              "bold"  ],
           \                           [  "vimNumber",    "#65C254",          "bg",              "NONE"  ],
           \                           [  "vimTodo",      "LemonChiffon3",    "#345FA8",         "NONE"  ],
           \                       ],
           \                    2: [
           \                           [  "CursorLineNr", "Orange",           "bg",              "bold"  ],
           \                           [  "vimNumber",    "#7FA2E6",          "bg",              "NONE"  ],
           \                           [  "vimTodo",      "LemonChiffon3",    "#345FA8",         "NONE"  ],
           \                       ],
           \                    3: [
           \                           [  "CursorLineNr", "Yellow",           "bg",              "bold"  ],
           \                           [  "vimNumber",    "#65C254",          "bg",              "NONE"  ],
           \                           [  "vimTodo",      "Gray20",           "MediumSeaGreen",  "underline"  ],
           \                       ],
           \               },
           \    'mix01': {
                        \		0:	[
                                    \	[      "javaString",     "#7EB49C",        "NONE",  "NONE", ],
                                    \   [      "javaConditional","#009F6F",        "NONE",  "bold", ],
                                    \   [      "javaRepeat",     "#009F6F",        "NONE",  "bold", ],
                                    \	[      "vimString",      "#9A85FF",        "NONE",  "NONE", ],
                                    \	[      "vimMapRHS",      "LightCyan3",     "NONE",  "NONE", ],
                                    \	[      "vimIsCommand",   "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimEchoHLNone",  "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFilter",      "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFuncBody",    "#779DB2",        "NONE",  "bold", ],
                                \	],
                        \		1:	[
                                    \	[      "javaString",     "CadetBlue3",     "NONE",  "NONE", ],
                                    \   [      "javaConditional","#9A85FF",        "NONE",  "bold", ],
                                    \   [      "javaRepeat",     "#9A85FF",        "NONE",  "bold", ],
                                    \	[      "vimString",      "CadetBlue3",     "NONE",  "NONE", ],
                                    \	[      "vimMapRHS",      "LightCyan3",     "NONE",  "NONE", ],
                                    \	[      "vimIsCommand",   "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimEchoHLNone",  "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimFilter",      "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimFuncBody",    "LightSkyBlue3",  "NONE",  "bold", ],
                                \	],
                        \		2:	[
                                    \	[      "javaString",     "#9A85FF",        "NONE",  "NONE", ],
                                    \   [      "javaConditional","#32C5B0",        "NONE",  "bold", ],
                                    \   [      "javaRepeat",     "#32C5B0",        "NONE",  "bold", ],
                                    \	[      "vimString",      "#9A85FF",        "NONE",  "NONE", ],
                                    \	[      "vimMapRHS",      "#CC4455",        "NONE",  "NONE", ],
                                    \	[      "vimIsCommand",   "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimEchoHLNone",  "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFilter",      "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFuncBody",    "LimeGreen",      "NONE",  "NONE", ],
                                \	],
                        \		3:	[
                                    \	[      "javaString",     "BurlyWood3",     "NONE",  "NONE", ],
                                    \   [      "javaConditional","#8870FF",        "NONE",  "bold", ],
                                    \   [      "javaRepeat",     "#8870FF",        "NONE",  "bold", ],
                                    \	[      "vimString",      "BurlyWood3",     "NONE",  "NONE", ],
                                    \	[      "vimMapRHS",      "#CC4455",        "NONE",  "NONE", ],
                                    \	[      "vimIsCommand",   "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimEchoHLNone",  "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimFilter",      "#32C5B0",        "NONE",  "italic", ],
                                    \	[      "vimFuncBody",    "Coral",          "NONE",  "bold", ],
                                \	],
                        \		4:	[
                                    \	[      "javaString",     "#8870FF",        "NONE",  "NONE", ],
                                    \   [      "javaConditional","#009ACD",        "NONE",  "bold", ],
                                    \   [      "javaRepeat",     "#009ACD",        "NONE",  "bold", ],
                                    \	[      "vimString",      "#8870FF",        "NONE",  "NONE", ],
                                    \	[      "vimMapRHS",      "LightCyan3",     "NONE",  "NONE", ],
                                    \	[      "vimIsCommand",   "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimEchoHLNone",  "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFilter",      "SkyBlue2",       "NONE",  "italic", ],
                                    \	[      "vimFuncBody",    "Plum",           "NONE",  "NONE", ],
                                \	],
           \             },
           \    'folded': {
						\		0:	[
						\               [ "Folded",  "LightSeaGreen",    "DarkSlateGray",  "italic", ],
						\			],
						\		1:	[
						\               [ "Folded",  "PaleGreen2",       "DarkSlateGray",  "italic", ],
						\			],
						\		2:	[
						\               [ "Folded",  "YellowGreen",      "DarkSlateGray",  "italic", ],
						\			],
						\		3:	[
						\               [ "Folded",  "DarkSeaGreen3",    "DarkSlateGray",  "italic", ],
						\			],
						\		4:	[
						\               [ "Folded",  "DarkOliveGreen3",  "DarkSlateGray",  "italic", ],
						\			],
						\		5:	[
						\               [ "Folded",  "#4E7482",          "#062926",        "NONE", ],
						\			],
           \              },
           \    'foldcolumn': {
						\    (-2):	[
						\               [ "",  "NONE",         "#062926",  "NONE", ],
						\			],
						\		0:	[
						\               [ "",  "ForestGreen",  "#082926",  "bold", ],
						\			],
						\		1:	[
						\               [ "",  "DodgerBlue3",  "#082926",  "bold", ],
						\			],
						\		2:	[
						\               [ "",  "#1A8C85",      "#082926",  "bold", ],
						\			],
						\		3:	[
						\               [ "",  "Chocolate",    "#082926",  "", ],
						\			],
						\		4:	[
						\               [ "",  "DarkSlateGray4", "#082926","", ],
						\			],
						\		5:	[
						\               [ "",  "#AA7100",      "#082926",  "", ],
						\			],
           \              },
           \    'normal': {
						\		0:	[
						\               [ "",        "PowderBlue",    "#062926", "", ],
                        \               [ "lineNr",  "DarkSeaGreen4", "#0C2628", "NONE"  ],
						\			],
						\		1:	[
						\               [ "",        "Azure3",        "#062926", "", ],
                        \               [ "lineNr",  "#5D8B9C",       "bg",      "NONE"  ],
						\			],
						\		2:	[
						\               [ "",        "#D6B883",       "#062926", "", ],
                        \               [ "lineNr",  "#7586AA",       "#0C2628", "NONE"  ],
						\			],
						\		3:	[
						\               [ "",        "Gainsboro",     "#062926", "", ],
                        \               [ "lineNr",  "Chartreuse3",   "bg",      "NONE"  ],
						\			],
						\		4:	[
						\               [ "",        "LightSkyBlue2", "#062926", "", ],
                        \               [ "lineNr",  "Gray40",        "bg", "NONE"  ],
						\			],
						\		5:	[
						\               [ "",        "Green2",        "#062926", "", ],
                        \               [ "lineNr",  "OliveDrab",     "bg",      "NONE"  ],
						\			],
						\		6:	[
						\               [ "",        "CadetBlue2",    "#062926", "", ],
                        \               [ "lineNr",  "#D93737",       "Gray5",   "NONE"  ],
						\			],
						\		7:	[
						\               [ "",        "Azure2",        "#062926", "", ],
                        \               [ "lineNr",  "bg",            "SeaGreen", "NONE"  ],
						\			],
						\		8:	[
						\               [ "",        "#C6B6FE",       "#062926",  "", ],
                        \               [ "lineNr",  "bg",            "DarkSeaGreen4", "NONE"  ],
						\			],
						\		9:	[
						\               [ "",        "PowderBlue",    "Black",    "", ],
                        \               [ "lineNr",  "Black",         "#5D8B9C",    "NONE"  ],
						\			],
           \              },
       \    'search': {
                    \		0:	[
                    \               [ "Search",   "#FF88AA",      "bg",           "underline", ],
                    \			],
                    \		1:	[
                    \               [ "Search",   "Green3",       "bg",           "underline", ],
                    \			],
                    \		2:	[
                    \               [ "Search",   "#FF9F00",      "bg",           "underline", ],
                    \			],
                    \		3:	[
                    \               [ "Search",   "FireBrick1",   "bg",           "bold", ],
                    \			],
                    \		4:	[
                    \               [ "Search",   "fg",           "RoyalBlue3",   "underline", ],
                    \			],
                    \		5:	[
                    \               [ "Search",   "#E7F56B",      "#E22A37",      "underline", ],
                    \			],
                    \		6:	[
                    \               [ "Search",   "Black",        "Khaki2",       "underline,bold", ],
                    \			],
                    \		7:	[
                    \               [ "Search",   "#E7F56B",      "#AD2728",      "NONE", ],
                    \			],
                    \		8:	[
                    \               [ "Search",   "Black",        "Red",          "underline,bold", ],
                    \			],
                    \		9:	[
                    \               [ "Search",   "Navy",         "#5FD75F",      "underline", ],
                    \			],
                    \	   10:	[
                    \               [ "Search",   "SlateGray1",   "bg",           "underline,bold,italic", ],
                    \			],
                    \	   11:	[
                    \               [ "Search",   "#0044FF",      "PowderBlue",   "underline,bold", ],
                    \			],
       \              },
           \    'matchparen': {
						\		0:	[
						\               [ "matchParen",  "Linen",          "DarkRed", "bold", ],
						\               [ "ModeMsg",     "OliveDrab4",     "bg",      "NONE", ],
						\               [ "MoreMsg",     "MediumSeaGreen", "bg",      "bold", ],
						\			],
						\		1:	[
						\               [ "matchParen",  "Linen",      "bg",     "bold", ],
						\               [ "ModeMsg",     "Green",      "bg",     "italic", ],
						\               [ "MoreMsg",     "Green",      "bg",     "", ],
						\			],
						\		2:	[
						\               [ "matchParen",  "Green",    "bg",          "bold", ],
						\               [ "ModeMsg",     "bg",       "LimeGreen",   "bold,underline", ],
						\               [ "MoreMsg",     "Black",    "DeepSkyBlue", "", ],
						\			],
						\		3:	[
						\               [ "matchParen",  "Magenta",     "Black", "bold", ],
						\               [ "ModeMsg",     "DeepSkyBlue", "bg",    "bold,italic", ],
						\               [ "MoreMsg",     "FireBrick1",  "Black", "bold,underline", ],
						\			],
						\		4:	[
						\               [ "matchParen",  "Yellow",   "bg",       "bold", ],
						\               [ "ModeMsg",     "White",    "#880C0E",  "bold,underline", ],
						\               [ "MoreMsg",     "Navy",     "#C59F6F",  "", ],
						\			],
						\		5:	[
						\               [ "matchParen",  "Green",   "Blue",        "NONE", ],
						\               [ "ModeMsg",     "Black",   "DeepSkyBlue", "bold,underline", ],
						\               [ "MoreMsg",     "#65C254", "bg",          "bold", ],
						\			],
           \              },
           \    'diff': {
                    \		0:	[
                    \               [ "diffAdd",      "Green2",           "#0D4173",   "NONE", ],
                    \               [ "diffAdded",    "Green2",           "#0D4173",   "NONE", ],
                    \               [ "diffChange",   "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#CC4455",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "#009F6F",          "bg",        "NONE", ],
                    \               [ "diffSubname",  "Bisque3",          "bg",        "bold", ],
                    \               [ "DiffText",     "Gray10",           "SeaGreen",  "bold", ],
                    \			],
                    \		1:	[
                    \               [ "diffAdd",      "#CC4455",          "Black",     "NONE", ],
                    \               [ "diffAdded",    "#CC4455",          "Black",     "NONE", ],
                    \               [ "diffChange",   "DarkSlateGray2",   "#25453D",   "NONE", ],
                    \               [ "diffChanged",  "DarkSlateGray2",   "#25453D",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "italic", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "PaleGoldenRod",    "Black",     "NONE", ],
                    \               [ "diffSubname",  "IndianRed3",       "bg",        "italic", ],
                    \               [ "DiffText",     "BurlyWood1",       "#902E3A",   "NONE", ],
                    \			],
                    \		2:	[
                    \               [ "diffAdd",      "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffAdded",    "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffChange",   "DarkOliveGreen2",  "NONE",      "NONE", ],
                    \               [ "diffChanged",  "DarkOliveGreen2",  "NONE",      "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "italic", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "PaleGoldenRod",    "Black",     "NONE", ],
                    \               [ "diffSubname",  "#8870FF",          "#082926",   "italic", ],
                    \               [ "DiffText",     "Black",            "Tomato3",   "NONE", ],
                    \			],
                    \		3:	[
                    \               [ "diffAdd",      "#88CB35",          "#1E4959",   "underline", ],
                    \               [ "diffAdded",    "#88CB35",          "#1E4959",   "underline", ],
                    \               [ "diffChange",   "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "italic", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "PaleGoldenRod",    "Black",     "NONE", ],
                    \               [ "diffSubname",  "IndianRed3",       "bg",        "italic", ],
                    \               [ "DiffText",     "BurlyWood",        "Gray30",    "bold,italic", ],
                    \			],
                    \		4:	[
                    \               [ "diffAdd",      "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffAdded",    "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffChange",   "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "italic", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "PaleGoldenRod",    "Black",     "NONE", ],
                    \               [ "diffSubname",  "IndianRed3",       "bg",        "italic", ],
                    \               [ "DiffText",     "DarkSlateGrey",    "khaki2",    "underline", ],
                    \			],
                    \		5:	[
                    \               [ "diffAdd",      "IndianRed2",       "bg",        "NONE", ],
                    \               [ "diffAdded",    "IndianRed2",       "bg",        "NONE", ],
                    \               [ "diffChange",   "PaleGoldenRod",    "#25453D",   "NONE", ],
                    \               [ "diffChanged",  "PaleGoldenRod",    "#25453D",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "italic", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "PaleGoldenRod",    "bg",        "NONE", ],
                    \               [ "diffSubname",  "IndianRed3",       "bg",        "italic", ],
                    \               [ "DiffText",     "Wheat3",           "#AD2728",   "NONE", ],
                    \			],
                    \		6:	[
                    \               [ "diffAdd",      "Khaki3",           "bg",        "NONE", ],
                    \               [ "diffAdded",    "Khaki3",           "bg",        "NONE", ],
                    \               [ "diffChange",   "#C59F6F",          "bg",        "NONE", ],
                    \               [ "diffChanged",  "#C59F6F",          "bg",        "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "#88CB35",          "#1E4959",   "NONE", ],
                    \               [ "diffSubname",  "#8870FF",          "#082926",   "NONE", ],
                    \               [ "DiffText",     "Tomato",           "gray20",    "NONE", ],
                    \			],
                    \		7:	[
                    \               [ "diffAdd",      "Green3",           "bg",        "NONE", ],
                    \               [ "diffAdded",    "Green3",           "bg",        "NONE", ],
                    \               [ "diffChange",   "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "#009F6F",          "bg",        "NONE", ],
                    \               [ "diffSubname",  "Bisque3",          "bg",        "bold", ],
                    \               [ "DiffText",     "Red",              "#004700",   "bold", ],
                    \			],
                    \		8:	[
                    \               [ "diffAdd",      "Gray90",           "#05401C",   "NONE", ],
                    \               [ "diffAdded",    "Gray90",           "#05401C",   "NONE", ],
                    \               [ "diffChange",   "LightGreen",       "bg",        "NONE", ],
                    \               [ "diffChanged",  "LightGreen",       "bg",        "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#880C0E",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "LightSkyBlue",     "bg",        "NONE", ],
                    \               [ "diffSubname",  "LightSkyBLue",     "bg",        "NONE", ],
                    \               [ "DiffText",     "Khaki",            "bg",        "NONE", ],
                    \			],
                    \		9:	[
                    \               [ "diffAdd",      "Green2",           "#0D4173",   "NONE", ],
                    \               [ "diffAdded",    "Green2",           "#0D4173",   "NONE", ],
                    \               [ "diffChange",   "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#1E4959",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "#009F6F",          "bg",        "NONE", ],
                    \               [ "diffSubname",  "Bisque3",          "bg",        "bold", ],
                    \               [ "DiffText",     "Gray10",           "#218294",   "bold", ],
                    \			],
                    \	   10:	[
                    \               [ "diffAdd",      "Gray90",           "#05401C",   "NONE", ],
                    \               [ "diffAdded",    "Gray90",           "#05401C",   "NONE", ],
                    \               [ "diffChange",   "LightGreen",       "bg",        "NONE", ],
                    \               [ "diffChanged",  "LightGreen",       "bg",        "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#880C0E",   "NONE", ],
                    \               [ "diffFile",     "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#E68A00",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "LightSkyBlue",     "bg",        "NONE", ],
                    \               [ "diffSubname",  "LightSkyBLue",     "bg",        "NONE", ],
                    \               [ "DiffText",     "#E63A3A",          "bg",        "NONE", ],
                    \			],
                    \	   11:	[
                    \               [ "diffAdd",      "#71D3B4",          "#05401C",   "NONE", ],
                    \               [ "diffAdded",    "#71D3B4",          "#05401C",   "NONE", ],
                    \               [ "diffChange",   "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffChanged",  "Bisque2",          "#1E4959",   "NONE", ],
                    \               [ "diffDelete",   "SlateBlue4",       "#880C0E",   "NONE", ],
                    \               [ "diffFile",     "#CC4455",          "bg",        "NONE", ],
                    \               [ "diffLine",     "#9A85FF",          "bg",        "NONE", ],
                    \               [ "diffNewFile",  "#71D3B4",          "bg",        "NONE", ],
                    \               [ "diffRemoved",  "IndianRed",        "bg",        "NONE", ],
                    \               [ "diffSubname",  "Bisque3",          "bg",        "NONE", ],
                    \               [ "DiffText",     "Wheat3",           "bg",        "NONE", ],
                    \			],
           \              },
           \    'statusline': {
                \		0:	[
                \               [ "StatusLine",    "LemonChiffon2",  "#334680",        "bold", ],
                \               [ "StatusLineNC",  "#A8C2EF",        "DarkSlateGrey",  "NONE", ],
                \			],
           \              },
           \    'cursorline': {
           \                 (-2): [
           \                           [ "CursorLine",   "NONE",  "#880C0E",      "bold" ],
           \                           [ "CursorColumn", "NONE",  "#880C0E",      "NONE" ],
           \                       ],
           \                    0: [
           \                           [ "CursorLine",   "NONE",  "#333399", "bold" ],
           \                           [ "CursorColumn", "NONE",  "#333399", "NONE" ],
           \                       ],
           \                    1: [
           \                           [ "CursorLine",   "NONE",  "#3A5022", "bold" ],
           \                           [ "CursorColumn", "NONE",  "#3A5022", "NONE" ],
           \                       ],
           \                    2: [
           \                           [ "CursorLine",   "NONE",  "#880c0e", "bold" ],
           \                           [ "CursorColumn", "NONE",  "#880c0e", "NONE" ],
           \                       ],
           \                    3: [
           \                           [ "CursorLine",   "NONE",  "#800080", "bold" ],
           \                           [ "CursorColumn", "NONE",  "#800080", "NONE" ],
           \                       ],
           \                    4: [
           \                           [ "CursorLine",   "NONE",  "#1E3140", "bold" ],
           \                           [ "CursorColumn", "NONE",  "#1E3140", "NONE" ],
           \                       ],
           \                    5: [
           \                           [ "CursorLine",   "DarkOliveGreen2",  "Gray40", "bold" ],
           \                           [ "CursorColumn", "NONE",             "Gray40", "NONE" ],
           \                       ],
           \                    6: [
           \                           [ "CursorLine",   "DarkOliveGreen2",  "NavyBlue", "bold" ],
           \                           [ "CursorColumn", "NONE",             "NavyBlue", "NONE" ],
           \                       ],
           \                    7: [
           \                           [ "CursorLine",   "DarkOliveGreen2",  "Gray20", "bold" ],
           \                           [ "CursorColumn", "NONE",  "Gray20",  "NONE" ],
           \                       ],
           \                    8: [
           \                           [ "CursorLine",   "Green",  "bg",      "italic" ],
           \                           [ "CursorColumn", "NONE",   "bg",      "NONE" ],
           \                       ],
           \                    9: [
           \                           [ "CursorLine",   "Green",  "Black",   "underline" ],
           \                           [ "CursorColumn", "NONE",   "Black",   "NONE" ],
           \                       ],
           \               },
           \    'colorcolumn': {
						\	 (-2):	[
						\               [ "ColorColumn",        "NONE",             "NONE",        "NONE",   ],
                        \               [ "asciidocBlockTitle", "#CC4455",          "bg",          "italic", ],
                        \               [ "asciidocQuotedSuperscript", "PaleGreen3","bg",          "NONE",   ],
                        \               [ "htmlCommentPart",    "#6A6A6A",          "bg",          "italic", ],
						\               [ "NonText",            "bg",               "bg",          "NONE",   ],
                        \               [ "xmlCommentPart",     "#6A6A6A",          "bg",          "italic", ],
						\			],
						\		0:	[
						\               [ "ColorColumn",        "PaleGreen2",          "#294C44", "NONE",   ],
                        \               [ "asciidocBlockTitle", "#009F6F",             "bg",      "NONE",   ],
                        \               [ "asciidocQuotedSuperscript", "LightSeaGreen","bg",      "NONE",   ],
                        \               [ "htmlCommentPart",    "#5D8B9C",             "bg",      "italic", ],
						\               [ "NonText",            "#0F450F",             "NONE",    "NONE",   ],
                        \               [ "xmlCommentPart",     "#5D8B9C",             "bg",      "italic", ],
						\			],
						\		2:	[
						\               [ "ColorColumn",        "Linen",            "DarkRed",    "NONE",   ],
                        \               [ "asciidocBlockTitle", "#CC4455",          "bg",         "NONE",   ],
                        \               [ "asciidocQuotedSuperscript", "PaleGreen3","bg",         "NONE",   ],
                        \               [ "htmlCommentPart",    "#6A6A6A",          "bg",         "italic", ],
						\               [ "NonText",            "SlateBlue",        "bg",         "NONE",   ],
                        \               [ "xmlCommentPart",     "#6A6A6A",          "bg",         "italic", ],
						\			],
						\		3:	[
						\               [ "ColorColumn",        "DodgerBlue1",      "#28364D",    "NONE",   ],
                        \               [ "asciidocBlockTitle", "#009F6F",          "bg",         "italic", ],
                        \               [ "asciidocQuotedSuperscript", "PaleGreen2","bg",         "NONE",   ],
                        \               [ "htmlCommentPart",    "#557F8F",          "bg",         "italic", ],
						\               [ "NonText",            "Maroon",           "bg",         "NONE",   ],
                        \               [ "xmlCommentPart",     "#557F8F",          "bg",         "italic", ],
						\			],
						\		4:	[
						\               [ "ColorColumn",        "NONE",            "GoldenRod4",  "NONE", ],
                        \               [ "asciidocBlockTitle", "#8FBFDC",         "bg",          "NONE", ],
                        \               [ "asciidocQuotedSuperscript", "#99AD6A",  "bg",          "NONE",   ],
                        \               [ "htmlCommentPart",    "#77996C",         "bg",          "italic", ],
						\               [ "NonText",            "#408C3F",         "bg",          "NONE", ],
                        \               [ "xmlCommentPart",     "#77996C",         "bg",          "italic", ],
						\			],
           \              },
           \ }
        " Set The Limits: WARN: if limits are not set properly, items may not display as expected
        for key in keys(s:dic_hi_options)
            if  has_key(s:dic_cf_options,key)
                execute 'let hardcodedlimit = s:dic_cf_options.' . key . '[1]'
                " except boolean options which only have one group of highlights per option-key
                if (hardcodedlimit == (-1))
                    execute 'let      s:dic_cf_options.' . key . '[1] = ' .
                        \   'len(keys(s:dic_hi_options.' . key . '))-1'
                endif
            endif
        endfor

        " TODO: check: should below cp be re-enabled (disabled for performance concerns)?
        " let g:briofita_ke ys = copy(s:briofita_allowed_parms)
        call s:BuildExportVar(s:dic_hi_options, s:export_cycling_highlights)

endif


" Utility Functions:                                                                      {{{1

" Function: s:GetUserOptions(): Get User Options                                          {{{2
function! s:GetUserOptions()
    " check/correct all the user input options (parameters in dict g:briofita_parms)
    " if a numeric parm does not exist in the options sequence, try the next existing one
    " wrongly set parameters (less than zero, greater than the limit, etc.) get corrected(0)
    " valid settings are copied into the internal dict s:dic_cf_options

    if exists("g:briofita_parms")
        if !empty(g:briofita_parms)
            let parmkeys = keys(g:briofita_parms)
            let ix = index(parmkeys, 'localcursorline')
            if ix < 0
                " insert required key
                let g:briofita_parms['localcursorline'] = 0
                call add (parmkeys, 'localcursorline')
            endif
            for pkey in parmkeys
                if has_key(s:dic_cf_options, pkey)
                    execute 'let tval  = g:briofita_parms.'    . pkey
                    execute 'let limit = s:dic_cf_options.' . pkey . '[1]'
                    let correctit = 0
                    if type(tval) != type(0)
                        let correctit  = 1
                    else
                        if (tval < 0)
                            let correctit = 1
                        endif
                        if (limit >= 0) && (tval > limit)
                            let correctit = 1
                        endif
                    endif
                    if correctit
                        let tval = 0
                        execute 'let g:briofita_parms.' . pkey    . ' = ' . tval
                    endif " if correct it
                    let keyhasoptions = 0
                    execute 'let keyhasoptions = has_key(s:dic_hi_options,"' . pkey . '")'
                    if keyhasoptions
                        let dictexpression = 's:dic_hi_options.' . pkey
                        let letcmd2        = 'let hasnumkey = has_key(' . dictexpression . ', ' . tval . ')'
                        try
                            execute letcmd2
                        catch
                            let tval = 0
                        endtry
                        if (! hasnumkey) && (tval != 0) && ((pkey!='colorcolumn')&&(tval!=1))
                            " fix: skip dict's non-existing value
                            if (limit > 1)
                                " TODO check performance at this branch (user parm wrongly set)
                                execute 'let lstdkeys = keys(s:dic_hi_options.' . pkey . ')'
                                if len(lstdkeys) >= 3
                                    " TODO verify the below copy()...
                                    let dickeys = copy(lstdkeys)
                                    let correctit = 0
                                    " TODO verify the below conditional...
                                    if len(dickeys) >= 3
                                        try
                                            let lstkeys = sort(dickeys)
                                        catch /^Vim\%((\a\+)\)\=:E/
                                            let correctit = 1
                                        endtry
                                        let filterexpr = printf('(v:val > %d)&&(v:val > 0)',
                                                       \ tval)
                                        try
                                            call filter(lstkeys, filterexpr)
                                        catch /^Vim\%((\a\+)\)\=:E/
                                            let correctit = 1
                                        endtry
                                        if len(lstkeys) > 0
                                            " the 1st one brings us an increased value
                                            let tval = lstkeys[0]
                                        else   " cannot increase value, goback to default zero
                                            let correctit = 1
                                        endif
                                    else
                                        let correctit = 1
                                    endif
                                    if correctit
                                        let tval = 0
                                    endif " if correct it
                                else
                                    let tval = 0
                                endif
                            else
                                " TODO: re-check: boolean (with options?) falling here?
                                let tval = 0
                            endif
                            execute 'let g:briofita_parms.' . pkey    . ' = ' . tval
                        endif
                    endif
                    execute 'let s:dic_cf_options.'  . pkey    . ' = ' .
                        \        "[" . tval . ',' . limit . ']'
                endif  " if it has the same key
            endfor
        endif
    endif
endfunction

function! s:SetNormalIfCleared()
    " checks if the "Normal" highlight is cleared
    " rationale: before any further action, we need to get assured of such BASIC highlight item
    " --------------------------------------------------------------------------------------------------------
    " NOTE: The below code circumvents some "weird, unlikely errors" detected while debugging the colorscheme.
    " NOTE: The cause of these errors is yet undetermined; but, surely, it is triggered by something outside
    " NOTE: the colorscheme's scope of action (interference from extraneous redir? Vim 7.3/7.4 bug?).
    " NOTE: Without this circumvention I sometimes got the below Vim message:
    " "Error detected while processing function <SNR>206_HighlightPerOptionsDic..<SNR>206_SetNormalIfCleared:"
    "     "line ...:" (here comes a line number inside the scope of the below redir command)
    "        "E121: Undefined variable: ..." (here comes a variable name which is NOT used in the colorscheme)
    " --------------------------------------------------------------------------------------------------------
    try
        " TODO: check: should the below redir var be function-local instead of script-local?
        " TODO: check: should the below redir variable be replaced by a register?
        let s:briofita_normal_state=''
        redir => s:briofita_normal_state
            hi normal
        redir END
        if exists("s:briofita_normal_state")
            if     s:briofita_normal_state =~ 'cleared'
                highlight Normal  guifg=PowderBlue guibg=#062926 gui=NONE
            endif
        endif
    catch
        highlight Normal  guifg=PowderBlue guibg=#062926 gui=NONE
    endtry
endfunction


" Function: s:HighlightPerOptionsDic(.): Highlight Item Per Options Dictionary            {{{1
function!   s:HighlightPerOptionsDic(item1)
    " example: parm1 (item1): 'conceal'

    if s:check_cleared_normal_highlight
        silent call s:SetNormalIfCleared()
    endif

    if exists("s:dic_hi_options")
        if has_key(s:dic_cf_options,a:item1)
            execute 'let dictmax = s:dic_cf_options.' . a:item1 . '[1]'
            if dictmax >= 0
                if ((a:item1 == 'cursorline') && (s:dic_cf_options.localcursorline[0]) &&
                 \  (exists('t:briofita_choice_for_cursorline')))
                    " local coupled highlights
                    if    (t:briofita_choice_for_cursorline >  dictmax) ||
                       \  (t:briofita_choice_for_cursorline <  0)
                       " correct it
                       let t:briofita_choice_for_cursorline = 0
                    endif
                    " get current value from the local variable
                    let curdickey = t:briofita_choice_for_cursorline
                else
                    execute 'let curdickey = s:dic_cf_options.' . a:item1 . '[0]'
                endif
                if (curdickey > dictmax)
                    " correct global dict value
                    execute 's:dic_cf_options.' . a:item1 . '[0] = 0'
                    let curdickey = 0
                endif
                execute 'let dicLstLst = s:dic_hi_options["' . a:item1 . '"]'
                if dictmax != 1  " if non-boolean option
                    if ! has_key(dicLstLst,curdickey)
                        if (curdickey == 0)
                            " internal dict construction error: default should always exist!
                            if (has_key(s:dic_cf_options,'warnlevel') && s:dic_cf_options.warnlevel == 1)
                                echomsg "Briofita colorscheme: WARN: " .
                                      \ "internal dict for entry(" . a:item1 .
                                      \ ") missing default(0) key; got alternate highlight"
                            endif
                            " alternate highlight used in case of errors
                            execute 'highlight ' . a:item1 . ' guifg=#71D3B4 guibg=#062926'
                            return
                        endif
                        " NOTE: return(below) allows the item to NOT have a specific key,
                        " NOTE: so that that it might be processed by another entry (like cc=1).
                        return
                    endif
                else
                    " boolean option
                    if ! has_key(dicLstLst, 0)
                        if (curdickey == 0)
                            " internal dict construction error: default should always exist!
                            if (has_key(s:dic_cf_options,'warnlevel') && s:dic_cf_options.warnlevel == 1)
                                echomsg "Briofita colorscheme: WARN: " .
                                      \ "internal dict for boolean option " . a:item1 .
                                      \ ") missing default(0) key; got alternate highlight"
                            endif
                            " alternate highlight used in case of errors
                            execute 'highlight ' . a:item1 . ' guifg=#71D3B4 guibg=#062926'
                            return
                        endif
                        " NOTE: return(below) allows the item to NOT have a specific key,
                        " NOTE: so that that it might be processed by another entry (like cc=1).
                        return
                    endif
                endif
                if (curdickey >= 0)  " if < 0, it is an exceptional case, not processed here

                    if dictmax != 1  " if non-boolean option
                        let lstLst = dicLstLst[curdickey]
                    else " boolean option
                        let lstLst = dicLstLst[0]
                    endif
                    for [grpname, hifg, hibg, guiattr] in lstLst
                        if len(grpname) > 0
                            let groupname = grpname
                        else
                            let groupname = a:item1
                        endif
                        if len(hifg) == 0
                            let hifg='fg'
                        endif
                        if len(hibg) == 0
                            let hibg='bg'
                        endif
                        if len(guiattr) == 0
                            let guiattr='NONE'
                        endif
                        if (a:item1 == 'cursorline') && (grpname=='cursorline')
                            if has_key(s:dic_cf_options,"colorcolumn")
                                if     s:dic_cf_options.colorcolumn[0]==1
                                    " special case: coupled cc
                                    let cmd = 'highlight ColorColumn '   .
                                           \  'guifg=NONE'         . ' ' .
                                           \  'guibg='     . hibg  . ' ' .
                                           \  'gui=NONE'
                                    execute cmd
                                    " special case: coupled nontext
                                    highlight NonText gui=NONE guifg=#197019 guibg=bg
                                endif
                            endif
                        endif
                        let cmd = 'highlight ' . groupname . ' ' .
                             \    'guifg='     . hifg      . ' ' .
                             \    'guibg='     . hibg      . ' ' .
                             \    'gui='       . guiattr
                        execute cmd
                        " special case: if normal bg=black then set black bg, too, for the below highlight
                        " FIXME shouldn't this trick be done via options dictionary?
                        if (tolower(groupname)=='normal' && tolower(hibg)=='black')
                            hi foldColumn guibg=Black
                        endif
                    endfor
                endif
            endif
        endif
    endif
endfunction


" Color Dictionary Parsing Functions:                                                     {{{1

" Function: s:ColorDictParser(.): Color Dictionaries Parser                               {{{2
function!   s:ColorDictParser(color_dict)
    " Color Dictionary Parser: sets all the color highlights specified in the dictionaries
    for [strgroup, lstcolors] in items(a:color_dict)
            exec 'highlight ' . strgroup
                \ . (! empty(lstcolors[0])? ' guifg='             . lstcolors[0]: '')
                \ . (! empty(lstcolors[1])? ' guibg='             . lstcolors[1]: '')
                \ . (  empty(lstcolors[2])? ' gui=NONE' : ' gui=' . lstcolors[2])
    endfor
endfunction

" Function: s:ParseAllSyntaxes(.): Parse the color dictionaries for All Syntaxes          {{{2
function!   s:ParseAllSyntaxes(listOfDicts)
    " sets the highlights for all syntaxes used
    for langdict in a:listOfDicts
        call s:ColorDictParser(langdict)
    endfor
endfunction

" Functions For Distractionless Mode:                                                     {{{1
" NOTE: the No Distraction (distractionless) editing mode is yet experimental...

" Function: s:HighlightPerOptionsND(.): Highlights the Dict NON-DISTRACTION ITEMS         {{{2
function!   s:HighlightPerOptionsND(item1)
	let curdickey = -2
	if has_key(s:dic_cf_options,a:item1)
		try
			execute 'let dicLstLst = s:dic_hi_options["' . a:item1 . '"]'
		catch
			return
		endtry
		try
			let lstLst = dicLstLst[curdickey]
		catch
			return
		endtry
		try
			for [grpname, hifg, hibg, guiattr] in lstLst
				if len(grpname) > 0
					let groupname = grpname
				else
					let groupname = a:item1
				endif
				if len(hifg) == 0
					let hifg='fg'
				endif
				if len(hibg) == 0
					let hibg='bg'
				endif
				if len(guiattr) == 0
					let guiattr='NONE'
				endif
				let cmd = 'highlight ' . groupname . ' ' .
					 \    'guifg='     . hifg      . ' ' .
					 \    'guibg='     . hibg      . ' ' .
					 \    'gui='       . guiattr
				execute cmd
			endfor
		catch
		endtry
	endif
endfunction

" Function: s:HighlightNoDistrMode(): do Highlight for No Distraction Mode                {{{2
function!   s:HighlightNoDistrMode()
    " for the distractionless editing mode
    execute "highlight signColumn                            guibg=#062926"

    execute "highlight Normal       gui=NONE   guifg=#C6B6FE guibg=#062926"
    execute "highlight VertSplit    gui=NONE   guifg=#062926 guibg=#062926"

    execute "highlight User1        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User2        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User3        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User4        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User5        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User6        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User7        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User8        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight User9        gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight StatusLine   gui=NONE   guifg=#401340 guibg=#401340"
    execute "highlight StatusLineNC gui=NONE   guifg=#401340 guibg=#401340"

    " the items below were specified in the dict, with key -2:
    let dictitems = [ "foldcolumn", "cursorline", "colorcolumn" ]
    for item in dictitems
        call s:HighlightPerOptionsND(item)
    endfor
    return
endfunction

" Color Dictionaries Initialization:                                                      {{{1
" Covers most non-optional highlights.
" NOTE: Design criteria:
" NOTE:   1. Use as few highlight links as possible (until we get to a final stable release).
" NOTE:   2. Harmony of highlights within a syntax prevails over inter-syntax uniformity.
"       |-------------------|-----------|-------------|-----------------|
"       | Highlight group   |Foreground |Background   |   Attributes    |
"       |-------------------|-----------|-------------|-----------------|
" Asciidoc                                                                                {{{2
if !exists("s:dict_hi_asciidoc")
        let s:dict_hi_asciidoc = {
            \   "asciidocAdmonition"              : [ "PowderBlue", "#007880",  ""],
            \   "asciidocAdmonitionNote"	      : [ "#85B2FE",    "#1C4F4F", ""],
            \   "asciidocAdmonitionWarn"	      : [ "Wheat2", "#345FA8",  ""],
            \   "asciidocAnchorMacro"             : [ "SlateGray3", "",  ""],
            \   "asciidocAttributeEntry"          : [ "DarkSeaGreen3", "#152933", ""],
            \   "asciidocAttributeList"           : [ "#CC4455", "",  ""],
            \   "asciidocAttributeMacro"          : [ "DodgerBlue2", "",  "italic"],
            \   "asciidocAttributeRef"            : [ "#9A85FF", "#152933", "italic"],
            \   "asciidocBackslash"               : [ "Aquamarine2", "",  ""],
            \   "asciidocBiblio"	              : [ "#2DB3A0", "", "bold,italic"],
            \   "asciidocCallout"                 : [ "SeaGreen2", "",  ""],
            \   "asciidocCommentBlock"            : [ "#8B7F4C", "",  "italic"],
            \   "asciidocCommentLine"             : [ "#5D8B9C", "",  ""],
            \   "asciidocDoubleDollarPassthrough" : [ "DodgerBlue2", "",  ""],
            \   "asciidocEmail"                   : [ "SkyBlue2", "",  "underline"],
            \   "asciidocEntityRef"               : [ "#8fbfdc", "",  ""],
            \   "asciidocExampleBlockDelimiter"   : [ "SlateGray4", "", "bold"],
            \   "asciidocFilterBlock"             : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocFootnote"	              : [ "CornflowerBlue", "Gray26",  "italic"],
            \   "asciidocGlossary"	              : [ "#00B780", "",  "underline"],
            \   "asciidocHLabel"                  : [ "SeaGreen2", "",  ""],
            \   "asciidocHyphenInterpolation"     : [ "#9FE846", "#573D8C", ""],
            \   "asciidocIdMarker"                : [ "SpringGreen2", "",  ""],
            \   "asciidocInclude"	              : [ "#A191F5", "",  ""],
            \   "asciidocIndexTerm"               : [ "#7FA2E6", "",  ""],
            \   "asciidocLineBreak"               : [ "Red", "",  ""],
            \   "asciidocLink"	                  : [ "#8870FF", "",  "bold,underline"],
            \   "asciidocList"                    : [ "#00B780", "",  ""],
            \   "asciidocListBlockDelimiter"      : [ "#779DB2", "",  ""],
            \   "asciidocListBullet"              : [ "SpringGreen2", "",  ""],
            \   "asciidocListContinuation"        : [ "Gray50", "",  "italic"],
            \   "asciidocListingBlock"            : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocListLabel"               : [ "#00B780", "", "bold"],
            \   "asciidocListNumber"              : [ "SpringGreen2", "",  ""],
            \   "asciidocLiteralBlock"            : [ "#2FBBA6", "",  "italic"],
            \   "asciidocLiteralParagraph"        : [ "#00B780", "",  ""],
            \   "asciidocMacro"                   : [ "#7FAAF2", "#152933", "italic"],
            \   "asciidocMacroAttributes"         : [ "BurlyWood2","Gray30","italic"],
            \   "asciidocNonAsciidocBar"          : [ "Maroon", "",  "bold"],
            \   "asciidocOddnumberedTableCol"     : [ "#9FE846", "#473273", ""],
            \   "asciidocOneLineTitle"            : [ "FireBrick1", "#112A33", "bold,underline"],
            \   "asciidocPagebreak"               : [ "CadetBlue2", "",  ""],
            \   "asciidocPassthroughBlock"        : [ "#009F6F", "",  "italic"],
            \   "asciidocQuestion"	              : [ "#00B780", "",  "underline"],
            \   "asciidocQuoteBlockDelimiter"     : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocQuotedAttributeList"     : [ "#9A85FF", "",  "italic"],
            \   "asciidocQuotedBold"              : [ "Green2","#1E4959", "italic"],
            \   "asciidocQuotedboldAttributeList" : [ "Gray50", "",  "italic"],
            \   "asciidocQuotedDoubleQuoted"      : [ "SeaGreen3", "#1E4959",  "italic"],
            \   "asciidocQuotedEmphasized"        : [ "DarkSeaGreen2","", "bold,italic"],
            \   "asciidocQuotedEmphasized2"       : [ "#C19EFF",      "", "italic"],
            \   "asciidocQuotedMonospaced"        : [ "Khaki3", "#1E4959",  "italic"],
            \   "asciidocQuotedMonospaced2"       : [ "#A08FF5", "",  "italic"],
            \   "asciidocQuotedSingleQuoted"      : [ "Green3", "#1E4959",  "italic"],
            \   "asciidocQuotedSubscript"         : [ "SlateGray3", "", "italic"],
            \   "asciidocQuotedUnconstrainedBold" : [ "PaleGreen3","", ""],
            \   "asciidocQuotedUnconstrainedEmphasized" : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocQuotedUnconstrainedMonospaced" : [ "#00B780", "",  "italic"],
            \   "asciidocReference"	              : [ "#A191F5", "",  ""],
            \   "asciidocRefMacro"                : [ "#7FA2E6", "",  "italic"],
            \   "asciidocReplacements"	          : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocRevisionInfo"	          : [ "DodgerBlue2", "",  ""],
            \   "asciidocRuler"                   : [ "DeepSkyBlue2", "",  ""],
            \   "asciidocSect0"                   : [ "FireBrick1", "#112A33", "bold,italic,underline"],
            \   "asciidocSect0Old"                : [ "#9B91F6", "",  "bold,italic"],
            \   "asciidocSect1"                   : [ "FireBrick1", "#112A33", "bold,underline"],
            \   "asciidocSect1Old"	              : [ "#9B91F6", "",  "bold"],
            \   "asciidocSect2"	                  : [ "#5FD75F", "#1C4F4F",  "underline"],
            \   "asciidocSect2Old"	              : [ "#5FD75F", "#1C4F4F",  ""],
            \   "asciidocSect3"	                  : [ "DarkSeaGreen3", "Gray26",  "underline"],
            \   "asciidocSect3Old"	              : [ "DarkSeaGreen3", "Gray26",  ""],
            \   "asciidocSect4"	                  : [ "#5FD75F", "#003366",  ""],
            \   "asciidocSect4Old"	              : [ "#5FD75F", "#003366",  ""],
            \   "asciidocSidebarDelimiter"        : [ "#009F6F", "MidnightBlue",  "italic,underline"],
            \   "asciidocSource"	              : [ "#c59f6f", "",  ""],
            \   "asciidocTableBlock"              : [ "PaleGreen3", "", ""],
            \   "asciidocTableDelimiter"          : [ "Maroon", "",  "bold"],
            \   "asciidocTableDelimiter2"         : [ "#779DB2", "",  ""],
            \   "asciidocTablePrefix"             : [ "Maroon", "",  "bold"],
            \   "asciidocTablePrefix2"            : [ "SeaGreen2", "",  ""],
            \   "asciidocToDo"                    : [ "LemonChiffon3", "#345FA8",  ""],
            \   "asciidocTriplePlusPassthrough"   : [ "#88CB35", "",  ""],
            \   "asciidocTripplePlusPassthrough"  : [ "#A191F5", "",  ""],
            \   "asciidocTwoLineTitle"            : [ "Green2", "#3A5022",  ""],
            \   "asciidocURL"                     : [ "Turquoise", "", "italic"],
            \ }
endif

" Awk                                                                                     {{{2
if !exists("s:dict_hi_awk")
        let s:dict_hi_awk = {
            \   "awkArrayElement"         : [ "AquaMarine3", "", ""],
            \   "awkComma"                : [ "#009F6F","",""],
            \   "awkFieldVars"            : [ "#009F6F","",""],
            \   "awkFunction"             : [ "#2FBBA6", "", ""],
            \   "awkParen"                : [ "Red", "",  ""],
            \   "awkPatterns"             : [ "PaleGreen2", "", ""],
            \   "awkRegExp"               : [ "#009F6F","",""],
            \   "awkSearch"               : [ "#009F6F","",""],
            \   "awkSpecialCharacter"     : [ "Red", "", ""],
            \   "awkSpecialPrintf"        : [ "#9FCBD0", "DarkSlateGrey", ""],
            \   "awkStatement"            : [ "PowderBlue", "#152933", ""],
            \   "awkString"				  : [ "#9A85FF", "",  ""],
            \   "awkVariables"            : [ "#8870FF","",""],
                    \ }
endif

" Buffergator, Buffersaurus, ls/DirList (Vim plugin)                                      {{{2
if !exists("s:dict_hi_plugin_bufX")
        let s:dict_hi_plugin_bufX = {
    \   "bufferGatorModifiedFileName"           : [ "PaleGreen2", "DarkSlateGray",  "bold,italic"],
    \   "bufferGatorTabpageLine"                : [ "#009F6F", "", "bold"],
    \   "bufferGatorUnmodifiedFileName"         : [ "#99ad6a", "",  ""],
    \   "BufferSaurusCurrentEntry"              : [ "", "", "reverse"],
    \   "BufferSaurusSyntaxContextedKeyDesc"    : [ "#779DB2", "", "italic,undercurl"],
    \   "bufferSaurusSyntaxContextedKeyFilename": [ "#808080", "",  ""],
    \   "BufferSaurusSyntaxContextedKeyLines"   : [ "#808080", "",  ""],
    \   "BufferSaurusSyntaxContextedKeyRow"     : [ "#808080", "",  "italic"],
    \   "BufferSaurusSyntaxContextLineNum"      : [ "#808080", "",  ""],
    \   "BufferSaurusSyntaxContextLineText"     : [ "#77996C", "",  "italic"],
    \   "BufferSaurusSyntaxFileGroupTitle"      : [ "#009F6F", "", "bold,italic"],
    \   "bufferSaurusSyntaxKey"                 : [ "#CC4455",      "",  ""],
    \   "BufferSaurusSyntaxMatchedLineNum"      : [ "#2FBBA6", "bg", ""],
    \   "BufferSaurusSyntaxMatchedLineText"     : [ "#D6B883", "bg", "italic"],
    \   "BufferSaurusSyntaxUncontextedLineNum"  : [ "#2FBBA6", "", ""],
    \   "BufferSaurusSyntaxUncontextedLineText" : [ "#C6B6FE", "bg", ""],
    \   "lsTag"                                 : [ "#009F6F", "", "bold,italic"],
            \ }
endif

" C adn C++                                                                               {{{2
if !exists("s:dict_hi_c_cpp")
        let s:dict_hi_c_cpp = {
            \   "_Block"                : [ "#009F6F","","bold"],
            \   "_Bracket"              : [ "#B89467", "",  ""],
            \   "_Comment"              : [ "#5D8B9C", "",  ""],
            \   "_Operator"             : [ "#00B880", "", ""],
            \   "cAnsiFunction"         : [ "#2DB3A0", "", "bold"],
            \   "cAnsiName"             : [ "#009F6F", "",  "italic"],
            \   "cBlock"                : [ "seagreen3", "",  ""],
            \   "cBoolean"              : [ "CadetBlue2", "",  ""],
            \   "cBraces"               : [ "#779DB2", "",  "italic"],
            \   "cBracket"              : [ "Green","",""],
            \   "cCharacter"            : [ "#5780CC","","bold,italic"],
            \   "cComment"              : [ "Gray50","","italic"],
            \   "cConditional"          : [ "#00B880","","bold"],
            \   "cConstant"             : [ "#6B8FCC","",""],
            \   "cCppString"            : [ "#9A85FF", "", "italic"],
            \   "cDefine"               : [ "#00B880","",""],
            \   "cDefined"              : [ "#00B880", "",  "italic"],
            \   "cDelimiter"            : [ "#779DB2", "",  "italic"],
            \   "cDoxygenComment"       : [ "LightSeaGreen","","italic"],
            \   "cFloat"                : [ "AquaMarine2", "", ""],
            \   "cFunction"             : [ "#C6B6FE", "",  ""],
            \   "cIdentifier"           : [ "#009F6F", "",  "italic"],
            \   "cInclude"              : [ "#00B880","",""],
            \   "cIncluded"             : [ "#77996C", "",  ""],
            \   "cLabel"                : [ "PaleGreen3","",""],
            \   "cMakeOperators"        : [ "SpringGreen1", "",  ""],
            \   "cMakeVariableValue"    : [ "DeepSkyBlue2", "",  ""],
            \   "cMulti"                : [ "Red","","bold"],
            \   "cNumber"               : [ "#99C4CC", "",  ""],
            \   "cOperator"             : [ "LightSeaGreen", "",  "bold"],
            \   "cParen"                : [ "Red","",""],
            \   "cppAccess"             : [ "PaleGreen3", "",  "italic"],
            \   "cppBoolean"            : [ "#8870FF", "", "bold"],
            \   "cppCast"               : [ "#CC4455","",""],
            \   "cppOperator"           : [ "#00B880", "", ""],
            \   "cppSTL"                : [ "#009F6F","","bold"],
            \   "cppSTLtype"            : [ "SkyBlue2", "",  "underline"],
            \   "cppStructure"          : [ "PaleGreen3","","underline"],
            \   "cppType"               : [ "#00B880", "", "bold"],
            \   "cPreCondit"            : [ "PaleGreen3","","italic"],
            \   "cPreConditMatch"       : [ "PaleGreen3","","italic"],
            \   "cPreProc"              : [ "#00B880","",""],
            \   "cRepeat"               : [ "#00B880","","bold"],
            \   "cSpecial"              : [ "#8870FF", "", "italic"],
            \   "cSpecialCharacter"     : [ "RoyalBlue", "", "italic"],
            \   "cStatement"            : [ "#00B880","",""],
            \   "cStorageClass"         : [ "#00B880","","bold"],
            \   "cString"               : [ "#9A85FF", "", ""],
            \   "cStructure"            : [ "SeaGreen3",  "#152933",  ""],
            \   "cTodo"                 : [ "LemonChiffon3", "#345FA8",  "italic"],
            \   "cType"                 : [ "#00B880","",""],
            \   "cUserFunction"         : [ "#009F6F","","bold"],
            \   "cUserFunctionPointer"  : [ "LimeGreen", "",  "bold"],
            \   "cUserLabel"            : [ "PaleGreen3","",""],
                    \ }
endif

" CSS                                                                                     {{{2
if !exists("s:dict_hi_css")
        let s:dict_hi_css = {
            \   "cssAnimationAttr"          : [ "#8870FF", "",  ""],
            \   "cssAttrRegion"             : [ "#8870FF", "",  ""],
            \   "cssAuralAttr"              : [ "PowderBlue", "",  "italic"],
            \   "cssAuralProp"              : [ "#C59F6F", "",  ""],
            \   "cssBackgroundAttr"         : [ "#8870FF", "",  ""],
            \   "cssBorderAttr"             : [ "#8870FF", "",  "italic"],
            \   "cssBorderOutlineAttr"      : [ "#8870FF", "",  "italic"],
            \   "cssBorderOutlineProp"      : [ "#C59F6F", "",  ""],
            \   "cssBoxProp"                : [ "#C59F6F", "",  ""],
            \   "cssClassName"              : [ "SeaGreen3",  "#152933",  "bold,italic"],
            \   "cssColor"                  : [ "#9A85FF", "",  "italic"],
            \   "cssColorProp"              : [ "#C59F6F","","italic"],
            \   "cssComment"                : [ "#5D8B9C", "",  "italic"],
            \   "cssCommonAttr"             : [ "#8870FF", "",  "italic"],
            \   "cssDefinition"             : [ "PowderBlue", "",  "italic"],
            \   "cssDeprecated"             : [ "Gray65", "", "bold,italic"],
            \   "cssFontAttr"               : [ "#8870FF", "",  "italic"],
            \   "cssFontDescriptorProp"     : [ "#C59F6F", "",  ""],
            \   "cssFontProp"               : [ "#C59F6F", "",  "italic"],
            \   "cssFunction"               : [ "#8870FF", "",  ""],
            \   "cssFunctionName"           : [ "SpringGreen2", "",  "underline"],
            \   "cssGeneratedContentProp"   : [ "#C59F6F", "",  ""],
            \   "cssIdentifier"             : [ "SeaGreen3", "",  ""],
            \   "cssImportant"              : [ "#8870FF", "",  ""],
            \   "cssInclude"                : [ "Turquoise3", "",  ""],
            \   "cssMarginProp"             : [ "#C59F6F", "",  ""],
            \   "cssMedia"                  : [ "SeaGreen3",  "#152933",  "bold,italic"],
            \   "cssMediaType"              : [ "SeaGreen2","","italic"],
            \   "cssPaddingProp"            : [ "#C59F6F", "",  ""],
            \   "cssPagingProp"             : [ "#C59F6F", "",  ""],
            \   "cssPositioningAttr"        : [ "#8870FF", "",  ""],
            \   "cssPositioningProp"        : [ "#C59F6F", "",  ""],
            \   "cssPseudoClassId"          : [ "SeaGreen3",  "#152933",  "italic"],
            \   "cssRenderProp"             : [ "#C59F6F", "",  ""],
            \   "cssSelectorOp"             : [ "Gray50", "",  ""],
            \   "cssStringQ"                : [ "#9A85FF", "",  "italic"],
            \   "cssStringQQ"               : [ "#9A85FF", "",  "italic"],
            \   "cssStyle"                  : [ "#c59f6f", "",  ""],
            \   "cssTableProp"              : [ "#C59F6F", "",  ""],
            \   "cssTagName"                : [ "SeaGreen3",  "#152933",  "bold,italic"],
            \   "cssTextAttr"               : [ "#8870FF", "",  "italic"],
            \   "cssTextProp"               : [ "#C59F6F", "",  "italic"],
            \   "cssUIattr"                 : [ "#C59F6F", "",  ""],
            \   "cssUIProp"                 : [ "#C59F6F", "",  ""],
            \   "cssUnitDecorators"         : [ "#8870FF", "",  ""],
            \   "cssURL"                    : [ "SlateGray3", "",  "bold,underline"],
            \   "cssValueLength"            : [ "#8870FF", "",  ""],
            \   "cssValueNumber"            : [ "#8870FF", "",  ""],
            \   "cssVendor"                 : [ "#C59F6F", "",  ""],
                    \ }
endif
"
" GTK or '.desktop' files                                                                 {{{2
if !exists("s:dict_hi_desktop")
        let s:dict_hi_desktop = {
            \   "dtALocale"                 : [ "#CC4455", "",  "bold"],
            \   "dtBooleanKey"              : [ "#009F6F", "",  "bold"],
            \   "dtBooleanValue"            : [ "CadetBlue2", "",  "bold"],
            \   "dtComment"                 : [ "#5D8B9C", "",  ""],
            \   "dtDelim"                   : [ "#5DDD9C", "",  ""],
            \   "dtExecKey"                 : [ "#009F6F", "",  "underline"],
            \   "dtExecParam"               : [ "#5DDD9C", "",  "bold"],
            \   "dtGroup"                   : [ "#FF0044", "Black",  ""],
            \   "dtLocaleKey"               : [ "#009F6F", "",  ""],
            \   "dtStringKey"               : [ "#009F6F", "",  ""],
            \   "dtTypeKey"                 : [ "#009F6F", "",  "italic"],
            \   "gtkRcInclude"              : [ "#009F6F", "",  "bold"],
            \   "gtkRcString"               : [ "#7fa2e6", "",  "italic"],
            \ }
endif

" Unix / Debian / network / FSTAB etc                                                     {{{2
if !exists("s:dict_hi_unixtools")
        let s:dict_hi_unixtools = {
            \   "debChangeLogCloses"    : [ "#8870FF", "",  "italic"],
            \   "debChangeLogEmail"     : [ "SlateGray3", "",  "italic"],
            \   "debChangeLogEntry"     : [ "#7EB49C", "", ""],
            \   "debChangeLogFooter"    : [ "#009F6F", "",  ""],
            \   "debChangeLogHeader"    : [ "#A8C2EF", "DarkSlateGrey",  "italic"],
            \   "debChangeLogLP"        : [ "#8870FF", "",  ""],
            \   "debChangeLogName"      : [ "AquaMarine", "#880C0E",  ""],
            \   "fsDeviceKeyword"       : [ "#009F6F", "",  "bold"],
            \   "fsFreqPassNumber"      : [ "#7DB3FF", "", ""],
            \   "fsMountPoint"          : [ "#009F6F", "",  ""],
            \   "fsMountPointKeyword"   : [ "AquaMarine3", "",  ""],
            \   "fsOperator"            : [ "Gray50", "",  ""],
            \   "fsOptions"             : [ "#9A85FF", "",  ""],
            \   "fsOptionsExt2Errors"   : [ "#9A85FF", "",  ""],
            \   "fsOptionsGeneral"      : [ "#9A85FF", "",  ""],
            \   "fsOptionsKeywords"     : [ "#9A85FF", "",  ""],
            \   "fsOptionsNumber"       : [ "AquaMarine3", "",  ""],
            \   "fsTypeKeyword"         : [ "#C59F6F", "",  ""],
            \   "zoneDomain"            : [ "#A8C2EF",  "",  ""],
            \   "zoneRRtype"            : [ "#A8C2EF",  "",  ""],
            \   "zoneTTL"               : [ "#A8C2EF",  "",  ""],
            \   "zoneUnknown"           : [ "#A8C2EF",  "",  ""],
            \ }
endif

"
" Haskell                                                                                 {{{2
if !exists("s:dict_hi_haskell")
        let s:dict_hi_haskell = {
            \   "hsStatement"           : [ "DarkSlateGray2", "SeaGreen",  ""],
            \   "hsStructure"           : [ "DarkSlateGray2", "SeaGreen",  ""],
            \   "hsVarSym"              : [ "red", "",  ""],
            \ }
endif

" Ruby                                                                                    {{{2
if !exists("s:dict_hi_ruby")
        let s:dict_hi_ruby = {
            \   "eRubyBlock"                  : [ "#8870FF","","italic"],
            \   "eRubyDelimiter"              : [ "CadetBlue4", "",  ""],
            \   "eRubyExpression"             : [ "#00B780","","bold,italic"],
            \   "rubyAccess"                  : [ "#7EB49C", "", "italic"],
            \   "rubyArrayDelimiter"          : [ "#4A77FF", "",  "bold"],
            \   "rubyBlock"                   : [ "#009F6F","",""],
            \   "rubyBlockParameter"          : [ "PaleGreen3", "#152933", ""],
            \   "rubyBlockParameterList"      : [ "", "#152933", "bold"],
            \   "rubyCaseExpression"          : [ "#8870FF", "",  "italic"],
            \   "rubyClass"                   : [ "#CC4455","","bold"],
            \   "rubyComment"                 : [ "#5B8999", "", "italic"],
            \   "rubyConditional"             : [ "PaleGreen3", "", "bold"],
            \   "rubyConditionalExpression"   : [ "#009F6F", "", ""],
            \   "rubyConstant"                : [ "#779DB2", "",  ""],
            \   "rubyControl"                 : [ "#CC4455", "", "underline"],
            \   "rubyCurlyBlock"              : [ "#978CCC", "",  "bold"],
            \   "rubyDefine"                  : [ "#85B2FE", "", "italic"],
            \   "rubyDoBlock"                 : [ "#009F6F","",""],
            \   "rubyExceptional"             : [ "LightCyan3", "bg",  "bold"],
            \   "rubyFloat"                   : [ "AquaMarine3", "", ""],
            \   "rubyFunction"                : [ "#85B2FE", "#152933", "italic"],
            \   "rubyGlobalVariable"          : [ "SkyBlue3", "",  ""],
            \   "rubyIdentifier"              : [ "#c6b6fe", "",  ""],
            \   "rubyInclude"                 : [ "LightCyan3", "bg",  "bold"],
            \   "rubyInstanceVariable"        : [ "#2DB3A0", "", ""],
            \   "rubyInteger"				  : [ "#85B2FE", "",  ""],
            \   "rubyInterpolation"           : [ "#CC4455",      "",  ""],
            \   "rubyInterpolationDelimiter"  : [ "FireBrick2", "",  ""],
            \   "rubyKeyword"				  : [ "#00B780", "", ""],
            \   "rubyLocalVariableOrMethod"   : [ "SeaGreen3","","bold,italic"],
            \   "rubyMethodBlock"             : [ "SeaGreen3","",""],
            \   "rubyModule"                  : [ "LightCyan3", "",  "underline"],
            \   "rubyOptionalDoLine"          : [ "PaleGreen3", "", ""],
            \   "rubyPredefinedConstant"      : [ "#009F6F", "",  ""],
            \   "rubyPredefinedIdentifier"    : [ "#de5577", "",  ""],
            \   "rubyPredefinedVariable"      : [ "PaleGreen3", "",  ""],
            \   "rubyPseudoVariable"          : [ "#8870FF", "",  ""],
            \   "rubyRegexp"                  : [ "#2DB3A0", "",  ""],
            \   "rubyRegexpAnchor"            : [ "#2DB3A0", "",  ""],
            \   "rubyRegexpCharClass"         : [ "#c59f6f", "",  "bold"],
            \   "rubyRegexpDelimiter"         : [ "SeaGreen2", "", ""],
            \   "rubyRegexpEscape"            : [ "#2DB3A0", "",  ""],
            \   "rubyRegexpQuantifier"        : [ "#c59f6f", "",  ""],
            \   "rubyRegexpSpecial"           : [ "#2DB3A0", "",  "bold"],
            \   "rubyRepeat"                  : [ "#2FBBA6", "",  ""],
            \   "rubyRepeatExpression"        : [ "#978CCC", "",  "italic"],
            \   "rubySharpBang"               : [ "#C73648", "", "bold,italic"],
            \   "rubyString"                  : [ "#9A85FF", "",  ""],
            \   "rubyStringDelimiter"         : [ "#85B2FE", "",  ""],
            \   "rubyStringEscape"            : [ "#99AD6a", "",  ""],
            \   "rubySymbol"                  : [ "#6E8CBF", "",  ""],
            \   "rubyTodo"                    : [ "LemonChiffon3", "#345FA8",  ""],
                    \ }
endif

" Help (Vim Help)                                                                         {{{2
if !exists("s:dict_hi_vimhelp")
        let s:dict_hi_vimhelp = {
            \   "helpBar"				: [ "FireBrick1",     "#880C0E",  ""],
            \   "helpExample"           : [ "#99AD6A",        "",         ""],
            \   "helpIgnore"			: [ "bg",             "",         ""],
            \   "helpNote"              : [ "DodgerBlue",     "Gray10",   "underline"],
            \   "helpNotVi"             : [ "#567F8F",        "",         "italic"],
            \   "helpOption"            : [ "SteelBlue2",     "",         "bold"],
            \   "helpSpecial"           : [ "#65C254",        "",         "underline"],
            \   "helpStar"				: [ "FireBrick1",     "#880C0E",  ""],
            \   "helpTodo"				: [ "#7EB49C",        "",         ""],
            \   "helpURL"               : [ "#8870FF",        "",         "bold,underline"],
            \   "helpVim"               : [ "BurlyWood3",     "",         "italic,underline"],
                    \ }
endif

" Html                                                                                    {{{2
if !exists("s:dict_hi_html")
        let s:dict_hi_html = {
            \   "htmlArg"                : [ "AquaMarine3", "",  ""],
            \   "htmlBold"               : [ "SkyBlue2", "",  "italic"],
            \   "htmlComment"            : [ "#CC4455",      "",  "italic"],
            \   "htmlCommentError"       : [ "#DED5CC",      "",  "italic,underline"],
            \   "htmlEndTag"             : [ "SlateGray4", "", "bold"],
            \   "htmlEvent"              : [ "LightCyan3", "bg",  "bold,italic"],
            \   "htmlEventDQ"            : [ "Green3",  "#1C3644",  "italic"],
            \   "htmlH1"                 : [ "FireBrick1", "", "bold,italic"],
            \   "htmlH2"                 : [ "PaleGreen3", "",  "bold,italic"],
            \   "htmlH3"                 : [ "Azure3","", "bold,italic"],
            \   "htmlH4"                 : [ "White",         "",  "italic"],
            \   "htmlH5"                 : [ "Aquamarine2","",  "italic"],
            \   "htmlH6"                 : [ "Khaki",    "",  "italic"],
            \   "htmlLink"               : [ "#A191F5", "", "bold,italic"],
            \   "htmlSpecialChar"        : [ "SlateGray3", "",  "underline"],
            \   "htmlSpecialTagName"     : [ "SeaGreen2", "",  ""],
            \   "htmlString"             : [ "#38ACAD", "", ""],
            \   "htmlTag"                : [ "LightCyan3", "bg",  ""],
            \   "htmlTagN"               : [ "DarkSeaGreen3", "#1C3644", "italic"],
            \   "htmlTagName"            : [ "LimeGreen", "#152933", "italic"],
                    \ }
endif

" Java / JVM / Scala, and related tools                                                   {{{2
if !exists("s:dict_hi_javatools")
        let s:dict_hi_javatools = {
            \   "javaAnnotation"          : [ "#8870FF","","italic"],
            \   "javaAssert"              : [ "SeaGreen2", "",  ""],
            \   "javaBoolean"             : [ "#2DB3A0", "",  "bold"],
            \   "javaBranch"              : [ "#2DB3A0", "",  ""],
            \   "javaCharacter"           : [ "#009ACD", "",  ""],
            \   "javaClassDecl"           : [ "#00B880","","underline"],
            \   "javaComment"             : [ "#5B8999", "",  "italic"],
            \   "javaComment2String"      : [ "#5B8999","",""],
            \   "javaCommentCharacter"    : [ "blue","",""],
            \   "javaCommentStar"         : [ "AquaMarine4","","bold,italic"],
            \   "javaCommentString"       : [ "#5B8999","",""],
            \   "javaCommentTitle"        : [ "SlateGray3", "",  "italic"],
            \   "javaConstant"            : [ "MediumSlateBlue","",""],
            \   "javaDocComment"          : [ "#5B8999", "",  "italic"],
            \   "javaDocParam"            : [ "SlateGray4", "",  "italic"],
            \   "javaDocTags"             : [ "SlateGray4", "",  "bold,italic"],
            \   "javaError"               : [ "Red", "",  "bold"],
            \   "javaExceptions"          : [ "#2DB3A0","",""],
            \   "javaExternal"            : [ "LightCyan3", "bg",  ""],
            \   "javaFold"                : [ "#FFD1FA","","bold"],
            \   "javaFuncBody"            : [ "PaleGreen2", "DarkSlateGray",  ""],
            \   "javaFuncDef"             : [ "Turquoise2", "",  ""],
            \   "javaLabel"               : [ "SeaGreen2", "",  ""],
            \   "javaLangObject"          : [ "#7F9D90", "", "" ],
            \   "javaLineComment"         : [ "#5B8999", "", "italic"],
            \   "javaMethodDecl"          : [ "Aquamarine3", "",  ""],
            \   "javaNumber"              : [ "#7DB3FF", "", ""],
            \   "javaOperator"            : [ "#7EB49C", "",  "bold"],
            \   "javaParenT"              : [ "GoldenRod", "",  "bold"],
            \   "javaScopeDecl"           : [ "#009F6F","","bold"],
            \   "javaSpecial"             : [ "OliveDrab2",    "",  ""],
            \   "javaSpecialChar"         : [ "#009ACD",    "",  ""],
            \   "javaSpecialCharError"    : [ "Bisque3",       "",  "italic"],
            \   "javaSpecialError"        : [ "PaleGoldenRod", "",  "undercurl"],
            \   "javaStatement"           : [ "#2DB3A0", "",  ""],
            \   "javaStorageClass"        : [ "#00B880", "", "italic"],
            \   "javaStringError"         : [ "PaleGoldenRod", "",  "undercurl"],
            \   "javaTodo"                : [ "LemonChiffon3", "#345FA8",  "italic"],
            \   "javaType"                : [ "#7EB49C","",""],
            \   "javaTypeDef"             : [ "#009F6F","",""],
            \   "javaUserLabel"           : [ "SeaGreen2", "",  ""],
            \   "javaUserLabelRef"        : [ "SeaGreen2", "",  ""],
            \   "jPropertiesDelimiter"    : [ "#A191F5", "",  ""],
            \   "jPropertiesSpecial"      : [ "#869BCC", "",  "bold"],
            \   "jPropertiesSpecialChar"  : [ "#A191F5", "",  ""],
            \   "jPropertiesString"       : [ "PowderBlue", "",  ""],
            \   "log4jDate"               : [ "DeepSkyBlue2", "",  "bold"],
            \   "log4jErrorlevel"         : [ "SeaGreen2", "",  "italic,underline"],
            \   "log4jLogger"             : [ "#779DB2", "",  "underline"],
            \   "log4jProcessid"          : [ "Turquoise2", "",  "bold,italic"],
            \   "scalaClassDecl"          : [ "#c59f6f", "",  ""],
            \   "scalaFunction"           : [ "Aquamarine3", "",  "bold,italic"],
            \   "scalaLineComment"        : [ "#78B37A", "",  ""],
            \   "scalaStorageClass"       : [ "#c59f6f", "",  "italic"],
            \   "scalaTypeDef"            : [ "Turquoise2", "",  ""],
                    \ }
endif

" Javascript                                                                              {{{2
if !exists("s:dict_hi_jscript")
        let s:dict_hi_jscript = {
            \   "javascript"                      : [ "#669F6F", "", ""],
            \   "javaScriptAjaxMethods"           : [ "SeaGreen1", "",  ""],
            \   "javaScriptAjaxObjects"           : [ "#F4E891", "",  "italic"],
            \   "javaScriptAjaxProperties"        : [ "#65C254", "",  ""],
            \   "javascriptBoolean"               : [ "#8870FF", "",  "italic"],
            \   "javascriptBraces"                : [ "#009F6F","",""],
            \   "javaScriptBranch"                : [ "#2FBBA6", "",  ""],
            \   "javaScriptBrowserObjects"        : [ "CadetBlue3", "",  "bold"],
            \   "javaScriptCharacter"             : [ "SeaGreen2", "",  ""],
            \   "javaScriptComment"               : [ "#77996C", "",  "italic"],
            \   "javascriptCommentTodo"           : [ "#C6B6FE", "#345FA8",  "italic"],
            \   "javascriptConditional"           : [ "SeaGreen2","","italic"],
            \   "javaScriptCssStyles"             : [ "#2DB3A0", "",  ""],
            \   "javaScriptCvsTag"                : [ "#85B2FE", "",  "italic"],
            \   "javaScriptDeprecated"            : [ "Gray65", "",  "bold,italic"],
            \   "javaScriptDocComment"            : [ "#5D8B9C", "",  "italic"],
            \   "javaScriptDocParam"              : [ "#009F6F", "",  "bold"],
            \   "javaScriptDocSeeTag"             : [ "#A191F5", "",  "italic"],
            \   "javaScriptDocTags"               : [ "#A191F5", "",  "italic"],
            \   "javaScriptDomElemAttrs"          : [ "SkyBlue1", "",  "italic"],
            \   "javaScriptDomElemFuncs"          : [ "#A191F5", "",  "italic"],
            \   "javaScriptDomErrNo"              : [ "#CC4455", "",  "bold"],
            \   "javaScriptDOMMethods"            : [ "Aquamarine3", "",  "italic"],
            \   "javaScriptDomNodeConsts"         : [ "SkyBlue2", "",  ""],
            \   "javaScriptDOMObjects"            : [ "CadetBlue2", "",  "italic"],
            \   "javaScriptDOMProperties"         : [ "#00B880", "",  ""],
            \   "javaScriptEndColons"             : [ "#7575FA", "",  "bold"],
            \   "javaScriptError"                 : [ "Red", "",  "bold"],
            \   "javaScriptEventListenerKeywords" : [ "SeaGreen2", "",  ""],
            \   "javaScriptExceptions"            : [ "#2FBBA6", "",  "italic"],
            \   "javaScriptFloat"                 : [ "#7FA2E6", "",  ""],
            \   "javaScriptFuncName"              : [ "LimeGreen", "",  "italic"],
            \   "javascriptFunction"              : [ "LimeGreen", "", "italic"],
            \   "javascriptGlobal"                : [ "#009F6F","","italic"],
            \   "javaScriptGlobalObjects"         : [ "#009F6F", "",  ""],
            \   "javaScriptHtmlElemAttrs"         : [ "PaleGreen3", "",  "italic"],
            \   "javaScriptHtmlElemFuncs"         : [ "PaleGreen3", "",  "bold"],
            \   "javaScriptHtmlElemProperties"    : [ "Aquamarine3", "",  ""],
            \   "javaScriptHtmlEvents"            : [ "SlateGray3", "",  "bold"],
            \   "javascriptIdentifier"            : [ "#2DB3A0", "",  "italic"],
            \   "javaScriptLabel"                 : [ "PaleGreen3", "",  ""],
            \   "javaScriptLineComment"           : [ "#5D8B9C", "",  ""],
            \   "javaScriptLogicSymbols"          : [ "CadetBlue2", "",  ""],
            \   "javascriptMember"                : [ "SeaGreen3","","italic"],
            \   "javascriptMessage"               : [ "SlateGray3", "",  "underline"],
            \   "javascriptNull"                  : [ "CadetBlue3","",""],
            \   "javaScriptNumber"                : [ "#85B2FE", "",  ""],
            \   "javascriptOperator"              : [ "#2DB3A0","",""],
            \   "javaScriptOpSymbols"             : [ "PaleGreen3", "",  "bold"],
            \   "javaScriptParens"                : [ "#A191F5", "",  "italic"],
            \   "javaScriptParensErrA"            : [ "Navy", "#5FD75F",  "undercurl"],
            \   "javaScriptParensErrB"            : [ "Navy", "#5FD75F",  "undercurl"],
            \   "javaScriptParensErrC"            : [ "Navy", "#5FD75F",  "undercurl"],
            \   "javaScriptParensError"           : [ "Navy", "#5FD75F",  "undercurl"],
            \   "javaScriptProprietaryObjects"    : [ "#99AD6A", "",  ""],
            \   "javaScriptPrototype"             : [ "SkyBlue1", "",  ""],
            \   "javascriptRegexpString"          : [ "CadetBlue3", "#152933", "italic"],
            \   "javascriptRepeat"                : [ "SeaGreen3",  "#152933",  "italic"],
            \   "javaScriptReserved"              : [ "#8FBFDC", "",  ""],
            \   "javaScriptSource"                : [ "#779DB2", "",  ""],
            \   "javascriptSpecial"               : [ "#7697d6", "",  "italic"],
            \   "javascriptStatement"             : [ "SeaGreen2",  "",  ""],
            \   "javascriptStringD"               : [ "#7fa2e6", "",  "italic"],
            \   "javascriptStringS"               : [ "CadetBlue", "", "italic"],
            \   "javascriptType"                  : [ "#00B780","","bold"],
            \   "javaScriptValue"                 : [ "CadetBlue2", "",  ""],
            \   }
endif
"
" Lisp and Scheme                                                                         {{{2
if !exists("s:dict_hi_lisp")
        let s:dict_hi_lisp = {
            \   "lispAtom"                        : [ "#00B780", "",  ""],
            \   "lispAtomList"                    : [ "#8870FF", "",  "bold"],
            \   "lispComment"                     : [ "#5D8B9C", "",  "italic"],
            \   "lispDecl"                        : [ "#009F6F","","bold"],
            \   "lispEscapeSpecial"               : [ "#779DB2", "",   ""],
            \   "lispFunc"                        : [ "SkyBlue2", "",  ""],
            \   "lispKey"                         : [ "#009F6F", "",  "italic"],
            \   "lispMark"                        : [ "#779DB2", "",  "bold"],
            \   "lispNumber"                      : [ "#85B2FE", "",  ""],
            \   "lispParenError"                  : [ "Navy", "#5FD75F",  "undercurl"],
            \   "lispString"                      : [ "#9A85FF", "",  ""],
            \   "lispSymbol"                      : [ "#2DB3A0", "", "italic"],
            \   "lispTodo"                        : [ "LemonChiffon3", "#345FA8",  ""],
            \   "schemeComment"                   : [ "#5D8B9C", "",  "italic"],
            \   "schemeError"                     : [ "Red", "",  "bold"],
            \   "schemeFunc"                      : [ "#2DB3A0", "", ""],
            \   "schemeOther"                     : [ "AquaMarine3", "",  ""],
            \   "schemeString"                    : [ "#9A85FF","",""],
            \   "schemeStruct"                    : [ "PaleGreen3","",""],
            \   "schemeSyntax"                    : [ "SkyBlue2", "",  ""],
            \   }
endif

" Markdown plugins                                                                        {{{2
if !exists("s:dict_hi_markdown")
        let s:dict_hi_markdown = {
            \   "markdownAutomaticLink"       : [ "SlateGray2", "", "italic"],
            \   "markdownBlockquote"          : [ "DarkSeaGreen", "",  ""],
            \   "markdownBold"                : [ "#9F92CC","#1E3B31",  "" ],
            \   "markdownBoldItalic"          : [ "#71D3B4", "", "bold,italic"],
            \   "markdownCode"                : [ "SeaGreen3", "",  ""],
            \   "markdownCodeBlock"           : [ "SeaGreen3", "",  ""],
            \   "markdownError"               : [ "Tomato", "",  ""],
            \   "markdownEscape"              : [ "DodgerBlue2", "",  ""],
            \   "markdownH1"                  : [ "FireBrick1", "",  "italic"],
            \   "markdownH2"                  : [ "SlateBlue2", "",  "italic"],
            \   "markdownH3"                  : [ "CornFlowerBlue","",  "italic"],
            \   "markdownH4"                  : [ "CornFlowerBlue", "", "italic"],
            \   "markdownH5"                  : [ "PaleGreen3",   "",  "italic"],
            \   "markdownH6"                  : [ "PaleGreen3",       "",  "italic"],
            \   "markdownHeadingDelimiter"    : [ "Gray60", "",  "italic"],
            \   "markdownHeadingRule"         : [ "Gray50", "",  "italic"],
            \   "markdownId"                  : [ "CornFlowerBlue", "", "italic,underline"],
            \   "markdownIdDeclaration"       : [ "CornFlowerBlue", "", "italic"],
            \   "markdownItalic"              : [ "#71D3B4", "#1E3B31",  "italic"],
            \   "markdownLineBreak"           : [ "Wheat2", "",  ""],
            \   "markdownLinkDelimiter"       : [ "Gray50", "",  "italic"],
            \   "markdownLinkText"            : [ "SlateGray2", "", "italic"],
            \   "markdownLinkTextDelimiter"   : [ "Gray50", "",  "italic"],
            \   "markdownListMarker"          : [ "#C59F6F", "",  "bold"],
            \   "markdownOrderedListMarker"   : [ "#009F6F", "",  "bold"],
            \   "markdownRule"                : [ "Gray50", "",  "italic"],
            \   "markdownUrl"                 : [ "CadetBlue", "", "italic"],
            \   "markdownUrlDelimiter"        : [ "#779DB2", "",  ""],
            \   "markdownUrlTitle"            : [ "Turquoise3", "", "italic"],
            \   "markdownUrlTitleDelimiter"   : [ "#779DB2",   "", "italic"],
            \   "markdownValid"               : [ "#C6B6FE", "bg",  ""],
            \   "mkdBlockCode"                : [ "SeaGreen2", "",  ""],
            \   "mkdBlockquote"               : [ "DarkSeaGreen", "",  ""],
            \   "mkdCode"                     : [ "SlateGray3", "",  "italic"],
            \   "mkdDelimiter"                : [ "#779DB2", "",  ""],
            \   "mkdID"                       : [ "FireBrick1", "Black", ""],
            \   "mkdLineBreak"                : [ "Gray50", "",  "bold"],
            \   "mkdLineContinue"             : [ "Gray50", "",  "italic"],
            \   "mkdLink"                     : [ "#71D3B4", "",  ""],
            \   "mkdLinkDef"                  : [ "FireBrick1", "", ""],
            \   "mkdLinkDefTarget"            : [ "CadetBlue", "", "italic"],
            \   "mkdLinkTitle"                : [ "SeaGreen2", "",  ""],
            \   "mkdListCode"                 : [ "#00B780", "",  "italic"],
            \   "mkdListItem"                 : [ "AquaMarine2", "", "italic"],
            \   "mkdRule"                     : [ "Gray50", "",  "italic"],
            \   "mkdString"                   : [ "DarkSeaGreen", "",  ""],
            \   "mkdURL"                      : [ "CadetBlue", "", "italic"],
                    \ }
endif

" RDF and/or Graph tools                                                                  {{{2
if !exists("s:dict_hi_rdf_and_graphs")
        let s:dict_hi_rdf_and_graphs = {
            \   "n3ClassName"                           : [ "DeepSkyBlue2", "",  ""],
            \   "n3Declaration"                         : [ "#009F6F", "", ""],
            \   "n3EndStatement"                        : [ "RosyBrown", "",  "bold"],
            \   "n3Prefix"                              : [ "#009F6F", "",  ""],
            \   "n3PropertyName"                        : [ "#65C254", "",  ""],
            \   "n3Separator"                           : [ "Red1","","bold"],
            \   "n3String"                              : [ "DodgerBlue2", "",  ""],
            \   "n3StringDelim"                         : [ "DodgerBlue2", "",  "bold"],
            \   "n3URI"                                 : [ "DeepSkyBlue2", "",  ""],
            \   "plantUMLDirectedOrVerticalArrowRL"     : [ "Green2", "",  "bold"],
            \   "plantUMLHorizontalArrow"               : [ "Orange", "",  "bold"],
            \   "plantUMLKeyword"                       : [ "#00B880","",""],
            \   "plantUMLSpecialString"                 : [ "CadetBlue3", "",  "bold,italic"],
            \   "plantUMLString"                        : [ "#7fa2e6", "",  "italic"],
            \   "plantUMLText"                          : [ "PaleGreen3", "",  ""],
            \   "plantUMLTypeKeyword"                   : [ "#009F6F", "", ""],
                    \ }
endif

" NERDTree, NERDCommenter, Netrw etc.                                                     {{{2
if !exists("s:dict_hi_nerds")
        let s:dict_hi_nerds = {
            \   "lsDir"                  : [ "LemonChiffon3", "",  ""],
            \   "lsExe"                  : [ "Red", "",  ""],
            \   "nerdtreeCwd"            : [ "", "#3D2B6B", "bold"],
            \   "nerdtreeDir"            : [ "LightSteelBlue", "#0e2628",  ""],
            \   "nerdtreeDirSlash"       : [ "LightSteelBlue", "",  ""],
            \   "nerdtreeExecFile"       : [ "Red", "",  ""],
            \   "nerdtreeFile"           : [ "#00B880","",""],
            \   "nerdtreeFlag"           : [ "#5D8B9C", "",  ""],
            \   "nerdtreeHelp"           : [ "#8fbfdc", "",  ""],
            \   "nerdtreeHelpKey"        : [ "#00B880", "",  ""],
            \   "nerdtreeHelpTitle"      : [ "AquaMarine2", "#880C0E",  ""],
            \   "nerdtreeOpenable"       : [ "PaleGoldenrod", "",  "bold"],
            \   "nerdtreePart"           : [ "LightSlateGray", "", "bold"],
            \   "nerdtreePartFile"       : [ "LightSlateGray", "", "bold"],
            \   "nerdtreeRO"             : [ "SkyBlue3", "",  ""],
            \   "nerdtreeToggleOff"      : [ "SlateGray3", "",  "bold"],
            \   "nerdtreeToggleOn"       : [ "SlateGray3", "",  "bold,underline"],
            \   "nerdtreeUp"             : [ "LightSlateGray","","bold"],
            \   "netrwClassify"          : [ "DodgerBlue", "",  ""],
            \   "netrwCmdNote"           : [ "Wheat", "#2D7067",  ""],
            \   "netrwCmdSep"            : [ "AquaMarine", "#880C0E",  ""],
            \   "netrwComment"           : [ "#42A396", "",  ""],
            \   "netrwDir"               : [ "SkyBlue2", "",  "underline"],
            \   "netrwHelpCmd"           : [ "AquaMarine", "#880C0E",  "bold"],
            \   "netrwPlain"             : [ "#00B880","",""],
            \   "netrwQuickHelp"         : [ "AquaMarine", "#880C0E",  ""],
            \   "netrwSymLink"           : [ "SkyBlue2", "",  "underline"],
            \   "netrwVersion"           : [ "#2D7067", "",  "italic"],
                    \ }
endif

" Ocaml, Dot, SML                                                                         {{{2
if !exists("s:dict_hi_ocaml")
        let s:dict_hi_ocaml = {
            \   "dotBraceEncl"             : [ "SeaGreen2", "",  ""],
            \   "dotBraceErr"              : [ "Khaki2", "VioletRed4",  ""],
            \   "dotBrackEncl"             : [ "SeaGreen2", "",  ""],
            \   "dotBrackErr"              : [ "Khaki2", "VioletRed4",  ""],
            \   "dotIdentifier"            : [ "#009F6F", "",  "italic"],
            \   "dotKeyChar"               : [ "SeaGreen2", "",  ""],
            \   "dotKeyword"               : [ "SeaGreen2", "",  ""],
            \   "dotParEncl"               : [ "SeaGreen2", "",  ""],
            \   "dotParErr"                : [ "Khaki2", "VioletRed4",  ""],
            \   "dotString"                : [ "#99ad6a", "",  ""],
            \   "dottedName"               : [ "#57d700", "",  ""],
            \   "dotTodo"                  : [ "LemonChiffon3", "Maroon4",  ""],
            \   "dotType"                  : [ "PaleGreen2", "DarkSlateGray",  "italic"],
            \   "ocamlAnyVar"              : [ "SeaGreen2", "", "bold"],
            \   "ocamlComment"             : [ "#5D8B9C", "",  "italic"],
            \   "ocamlConstructor"         : [ "CadetBlue3", "",  "italic"],
            \   "ocamlFullMod"             : [ "PowderBlue", "", ""],
            \   "ocamlKeyChar"             : [ "#7FA2E6", "",  ""],
            \   "ocamlKeyword"             : [ "SeaGreen3", "", ""],
            \   "ocamlLabel"               : [ "#2DB3A0", "",  "bold"],
            \   "ocamlLCIdentifier"        : [ "#009F6F", "", ""],
            \   "ocamlModPath"             : [ "LightCyan3", "",  ""],
            \   "ocamlModule"              : [ "PowderBlue", "", "bold"],
            \   "ocamlNumber"              : [ "#85B2FE", "#152933", "italic"],
            \   "ocamlOperator"            : [ "#4444CC", "", ""],
            \   "ocamlSig"                 : [ "OrangeRed", "", ""],
            \   "ocamlString"              : [ "#9A85FF","","italic"],
            \   "ocamlType"                : [ "#2DB3A0", "", "italic"],
            \   "smlEnd"                   : [ "#779DB2", "",   "bold"],
            \   "smlKeyChar"               : [ "RoyalBlue", "",  ""],
            \   "smlLCIdentifier"          : [ "#009F6F", "",  "italic"],
            \   "smlString"                : [ "#8870FF", "",  ""],
                    \ }
endif

" Perl                                                                                    {{{2
if !exists("s:dict_hi_perl")
        let s:dict_hi_perl = {
            \   "perlComment"               : [ "#77996C", "",  "italic"],
            \   "perlConditional"           : [ "SeaGreen3",  "#152933",  "italic"],
            \   "perlControl"               : [ "SkyBlue", "DarkSlateGrey", "bold"],
            \   "perlFileDescRead"          : [ "#A08EF8", "",  "bold"],
            \   "perlFileDescStatement"     : [ "#A08EF8", "",  "bold"],
            \   "perlFloat"                 : [ "#7fa2e6", "", ""],
            \   "perlFunction"              : [ "#32C5B0", "", "bold"],
            \   "perlFunctionName"          : [ "Aquamarine3", "",  ""],
            \   "perlIdentifier"            : [ "OliveDrab3", "",  "underline"],
            \   "perlLabel"                 : [ "PaleGreen2", "DarkSlateGray",  "italic"],
            \   "perlMatch"                 : [ "#8870FF", "",  ""],
            \   "perlMatchStartEnd"         : [ "#8870FF", "",  ""],
            \   "perlMethod"                : [ "#67BF54", "#152933", "italic"],
            \   "perlNumber"                : [ "#7fa2e6", "",  ""],
            \   "perlOperator"              : [ "SpringGreen3", "",  "bold"],
            \   "perlPackageRef"            : [ "#7fa2e6", "",  "bold"],
            \   "perlRepeat"                : [ "SeaGreen3",  "#152933",  "bold,italic"],
            \   "perlSharpBang"             : [ "DeepSkyBlue2", "",  ""],
            \   "perlSpecialMatch"          : [ "#7fa2e6", "",  "italic"],
            \   "perlSpecialString"         : [ "#CC4455", "",  ""],
            \   "perlStatementControl"      : [ "Aquamarine3", "",  "italic"],
            \   "perlStatementFileDesc"     : [ "Aquamarine3", "",  ""],
            \   "perlStatementFiles"        : [ "Aquamarine3", "",  ""],
            \   "perlStatementFlow"         : [ "SeaGreen3",  "#152933",  "italic"],
            \   "perlStatementList"         : [ "seagreen3", "",  ""],
            \   "perlStatementScalar"       : [ "#00CC8A", "",  "italic"],
            \   "perlStatementStorage"      : [ "#00CC8A", "",  "italic"],
            \   "perlString"                : [ "#7fa2e6", "",  "italic"],
            \   "perlStringStartEnd"        : [ "#009F6F","",""],
            \   "perlStringUnexpanded"      : [ "#00BA83","","italic"],
            \   "perlSubName"               : [ "#32C5B0", "",  "bold"],
            \   "perlSubPrototype"          : [ "#CC4455", "",  ""],
            \   "perlTodo"                  : [ "Wheat2", "#345FA8",  "italic"],
            \   "perlVarPlain"              : [ "#00BA83","","italic"],
            \   "perlVarPlain2"             : [ "#2DB3A0", "",  "italic"],
            \   "perlVarSimpleMember"       : [ "#8870FF", "",  ""],
            \   "perlVarSlash"              : [ "#41E7B5", "",  "bold,italic"],
            \ }
endif

" PL/SQL and SQL plugins                                                                  {{{2
if !exists("s:dict_hi_sql")
        let s:dict_hi_sql = {
            \   "plsqlAttribute"            : [ "SlateGray3", "",  "bold,underline"],
            \   "plsqlBooleanLiteral"       : [ "SlateBlue1", "#152933", ""],
            \   "plsqlComment"              : [ "#5D8B9C", "",  "italic"],
            \   "plsqlCommentL"             : [ "#5D8B9C", "",  ""],
            \   "plsqlConditional"          : [ "PowderBlue","",""],
            \   "plsqlErrInBracket"         : [ "RosyBrown", "",  ""],
            \   "plsqlErrInParen"           : [ "#7EB49C", "", "bold"],
            \   "plsqlFunction"             : [ "#CC4455", "",  ""],
            \   "plsqlGarbage"              : [ "#7EB49C", "", ""],
            \   "plsqlHostIdentifier"       : [ "#88CB35", "#152933",  ""],
            \   "plsqlIdentifier"           : [ "#2FBBA6","",""],
            \   "plsqlIntLiteral"           : [ "#7FAAF2", "#152933", ""],
            \   "plsqlKeyword"              : [ "PowderBlue","",""],
            \   "plsqlOperator"             : [ "RosyBrown", "",  "bold,italic"],
            \   "plsqlPseudo"               : [ "SlateBlue1", "",  ""],
            \   "plsqlRepeat"               : [ "PaleGreen2", "#1c3644",  ""],
            \   "plsqlSQLKeyword"           : [ "Orange", "DarkSlateGrey", "" ],
            \   "plsqlSQLKeyword2"          : [ "#2FBBA6","",""],
            \   "plsqlSQLKeyword3"          : [ "#7EB49C", "", ""],
            \   "plsqlSQLKeyword4"          : [ "#C59F6F", "bg", "" ],
            \   "plsqlSQLTypeAttribute"     : [ "#C59F6F", "bg", "underline" ],
            \   "plsqlStorage"              : [ "CornFlowerBlue","",""],
            \   "plsqlStringError"          : [ "LemonChiffon2","DodgerBlue3",""],
            \   "plsqlStringLiteral"        : [ "Aquamarine3", "",  "italic"],
            \   "plsqlSymbol"               : [ "#8870FF","","bold"],
            \   "sqlHibSnippet"             : [ "bg", "#7FAAF2", "bold"],
            \   "sqlKeyword"                : [ "#8FBFDC", "", ""],
            \   "sqlNumber"                 : [ "#85B2FE", "#152933", "italic"],
            \   "sqlOperator"               : [ "#99AD6A", "",  ""],
            \   "sqlSnippet"                : [ "PaleGreen3", "",  ""],
            \   "sqlSpecial"                : [ "#99AD6A", "",  ""],
            \   "sqlStatement"              : [ "PaleGreen3","","underline"],
            \   "sqlString"                 : [ "#009F6F","",""],
            \   "sqlTodo"                   : [ "Wheat2", "#345FA8",  "italic"],
            \   "sqlType"                   : [ "#00B880","",""],
                    \ }
endif

" Python                                                                                  {{{2
if !exists("s:dict_hi_python")
        let s:dict_hi_python = {
            \   "pyNiceStatement"              : [ "Gold2", "",  ""],
            \   "pythonArithmetic"             : [ "#009F6F","","bold"],
            \   "pythonAssignment"             : [ "#009F6F","","bold"],
            \   "pythonBinError"               : [ "Tomato", "#1B5958",  ""],
            \   "pythonBinNumber"              : [ "Aquamarine2", "",  ""],
            \   "pythonBoolean"                : [ "#8870FF", "",  ""],
            \   "pythonBuiltin"                : [ "#AE5555", "",  ""],
            \   "pythonBuiltinFunc"            : [ "#48B091", "",  "bold"],
            \   "pythonBuiltinLogic"           : [ "#729FCF", "",  ""],
            \   "pythonBuiltinObj"             : [ "#009F6F","",""],
            \   "pythonBytes"                  : [ "Salmon3", "",  ""],
            \   "pythonBytesContent"           : [ "Salmon3", "",  ""],
            \   "pythonBytesError"             : [ "Red", "",  "bold"],
            \   "pythonBytesEscape"            : [ "DarkSlateGray4", "",  "bold"],
            \   "pythonBytesEscapeError"       : [ "Red", "",  "bold"],
            \   "pythonCalOperator"            : [ "#af5f00", "",  ""],
            \   "pythonClass"                  : [ "#A191F5",    "",  "italic"],
            \   "pythonClassDef"               : [ "#2FBBA6",  "",  "bold,italic"],
            \   "pythonClassName"              : [ "#2FBBA6",  "",  "italic"],
            \   "pythonCoding"                 : [ "SlateGray3", "",  "bold,italic"],
            \   "pythonComment"                : [ "#557F8F", "",  ""],
            \   "pythonComparison"             : [ "#2FBBA6", "",  "bold"],
            \   "pythonConditional"            : [ "#2FBBA6", "",  ""],
            \   "pythonDecorator"              : [ "#85B2FE", "",  "italic"],
            \   "pythonDecoratorFunction"      : [ "#85B2FE", "",  "bold,italic"],
            \   "pythonDefaultAssignment"      : [ "#7FC090", "",  "bold"],
            \   "pythonDocstring"              : [ "#5D8B9C", "",  "italic"],
            \   "pythonDocTest"                : [ "Gray50", "",  "italic"],
            \   "pythonDocTest2"               : [ "#6D8C63", "",  "italic"],
            \   "pythonDottedName"             : [ "#009F6F","",""],
            \   "pythonError"                  : [ "Red", "",  "bold"],
            \   "pythonEscape"                 : [ "DodgerBlue2", "",  ""],
            \   "pythonEscapeError"            : [ "Khaki2", "VioletRed4",  ""],
            \   "pythonException"              : [ "#2FBBA6", "",  "italic"],
            \   "pythonExceptions"             : [ "#2FBBA6", "",  ""],
            \   "pythonExClass"                : [ "#2FBBA6", "",  "italic"],
            \   "pythonFloat"                  : [ "SkyBlue2", "",  ""],
            \   "pythonFunc"                   : [ "#A191F5", "",  "italic"],
            \   "pythonFuncDef"                : [ "#85B2FE", "", "bold,italic"],
            \   "pythonFuncName"               : [ "#85B2FE", "", "italic"],
            \   "pythonFuncParams"             : [ "Red", "", ""],
            \   "pythonFunction"               : [ "PaleGreen3","","bold"],
            \   "pythonHexError"               : [ "Tomato", "#1B5958",  ""],
            \   "pythonHexNumber"              : [ "Aquamarine2", "",  ""],
            \   "pythonInclude"                : [ "#009F6F", "",  ""],
            \   "pythonIndentError"            : [ "Khaki2", "#75252F",  ""],
            \   "pythonNumber"                 : [ "#85B2FE", "",  ""],
            \   "pythonNumberError"            : [ "Red", "",  "bold"],
            \   "pythonObjFunction"            : [ "#009F6F", "",  ""],
            \   "pythonOctError"               : [ "Tomato", "#1B5958",  ""],
            \   "pythonOctNumber"              : [ "Aquamarine2", "",  ""],
            \   "pythonOperator"               : [ "#2FBBA6", "",  "bold"],
            \   "pythonParamDefault"           : [ "SeaGreen2", "",  ""],
            \   "pythonParamName"              : [ "#99AD6A", "",  "italic"],
            \   "pythonPreCondit"              : [ "#00B780", "", ""],
            \   "pythonRawBytes"               : [ "LightSkyBlue3", "",  ""],
            \   "pythonRawString"              : [ "#7fa2e6", "",  "italic"],
            \   "pythonRepeat"                 : [ "#009F6F", "",  "bold,underline"],
            \   "pythonRun"                    : [ "SlateGray3", "",  "bold,italic"],
            \   "pythonSpaceError"             : [ "LemonChiffon2","#1D3E3E",""],
            \   "pythonStrFormat"              : [ "#8870FF", "",  ""],
            \   "pythonStrFormatting"          : [ "#9FCBD0", "#264040", ""],
            \   "pythonString"                 : [ "#9A85FF", "",  ""],
            \   "pythonStrTemplate"            : [ "PowderBlue", "#264040", "italic"],
            \   "pythonSuperclass"             : [ "#99AD6A", "", "italic"],
            \   "pythonSync"                   : [ "#AE5555", "",  "italic"],
            \   "pythonUniEscape"              : [ "#CC4455", "",  ""],
            \   "pythonUniEscapeError"         : [ "Khaki2", "VioletRed4",  ""],
            \   "pythonUniRawEscape"           : [ "#CC4455", "",  ""],
            \   "pythonUniRawEscapeError"      : [ "Khaki2", "VioletRed4",  ""],
            \   "pythonUniRawString"           : [ "#7fa2e6", "",  ""],
            \   "pythonUniString"              : [ "#99ad6a", "",  ""],
            \ }
endif

" Rst -- Restructured Text                                                                {{{2
if !exists("s:dict_hi_rst")
        let s:dict_hi_rst = {
            \   "rstCitation"                             : [ "#9A85FF", "", "italic"],
            \   "rstCitationReference"                    : [ "DarkSeaGreen3", "#152933", ""],
            \   "rstCodeBlock"                            : [ "#99ad6a", "",  "italic"],
            \   "rstComment"                              : [ "DodgerBlue2", "",  ""],
            \   "rstDelimiter"                            : [ "#2DB3A0", "", "bold"],
            \   "rstDirective"                            : [ "AquaMarine3", "", "italic"],
            \   "rstEmphasis"                             : [ "", "#3D2B6B", ""],
            \   "rstExDirective"                          : [ "#00B780", "", ""],
            \   "rstExplicitMarkup"                       : [ "Orange", "", "bold"],
            \   "rstFootNote"                             : [ "#9A85FF", "", "italic"],
            \   "rstHyperLinkReference"                   : [ "seagreen3", "",  ""],
            \   "rstInlineLiteral"                        : [ "#9A85FF", "",  "bold,italic"],
            \   "rstInterpretedTextOrHyperlinkReference"  : [ "#9A85FF", "#14332C", "italic"],
            \   "rstLiteralBlock"                         : [ "#2DB3A0", "",  ""],
            \   "rstSections"                             : [ "#71D3B4", "",  ""],
            \   "rstSimpleTable"                          : [ "#c59f6f", "",  ""],
            \   "rstSimpleTableLines"                     : [ "#65C254", "",  ""],
            \   "rstStandaloneHyperlink"                  : [ "CadetBlue2", "",  "underline"],
            \   "rstStrongEmphasis"                       : [ "DarkSlateGray2","#1E4959", "italic"],
            \   "rstSubstitutionReference"                : [ "#8870FF", "",  ""],
            \   "rstTable"                                : [ "#FF88AA", "#573D8C", ""],
            \   "rstTransition"                           : [ "#71D3B4", "", ""],
            \ }
endif

" Sed                                                                                     {{{2
if !exists("s:dict_hi_sed")
        let s:dict_hi_sed = {
            \   "sedACI"                     : [ "LightSeaGreen","",""],
            \   "sedAddress"                 : [ "LightSeaGreen", "", ""],
            \   "sedBranch"                  : [ "SlateGray3", "",  "bold,italic"],
            \   "sedComment"                 : [ "#5D8B9C", "",  "italic"],
            \   "sedError"                   : [ "Red", "",  "bold"],
            \   "sedFlag"                    : [ "#8fbfdc", "",  "bold,italic"],
            \   "sedFunction"                : [ "#CC4455","","italic"],
            \   "sedLabel"                   : [ "RoyalBlue", "", "italic,bold,underline"],
            \   "sedLineCont"                : [ "#CC4455","","bold"],
            \   "sedRegexp119"               : [ "#CC4455", "",  ""],
            \   "sedRegExp47"                : [ "#869BCC", "", ""],
            \   "sedRegexpMeta"              : [ "#869BCC", "", ""],
            \   "sedReplacement119"          : [ "#CC4455", "",  "bold"],
            \   "sedReplacement44"           : [ "#65C254", "",  ""],
            \   "sedReplacement47"           : [ "#869BCC", "", ""],
            \   "sedReplacement58"           : [ "#65C254", "",  ""],
            \   "sedReplaceMeta"             : [ "SlateGray3", "",  ""],
            \   "sedSemicolon"               : [ "RosyBrown", "",  "bold"],
            \   "sedSpecial"                 : [ "SlateGray3", "", "bold"],
            \   "sedST"                      : [ "SlateGray2","",""],
            \ }
endif

" Shellscripts and Bash                                                                   {{{2
if !exists("s:dict_hi_sh")
        let s:dict_hi_sh = {
            \   "bashStatement"           : [ "#8870FF", "",  "italic"],
            \   "shAlias"                 : [ "#009F6F", "",  ""],
            \   "shArithmetic"            : [ "SlateGray3", "",  ""],
            \   "shCase"                  : [ "PaleGreen3", "",  "italic"],
            \   "shCaseDoubleQuote"       : [ "#A8C2EF", "DarkSlateGrey",  ""],
            \   "shCaseEsac"              : [ "#009F6F", "",  "italic"],
            \   "shCaseRange"             : [ "#8870FF", "",  ""],
            \   "shCmdParenRegion"        : [ "DodgerBlue3", "",  "italic"],
            \   "shCmdSubregion"          : [ "#8870FF", "",  "italic"],
            \   "shColon"                 : [ "AquaMarine3", "",  ""],
            \   "shCommandSub"            : [ "#88B4CC", "",  "italic"],
            \   "shComment"               : [ "#699DB0", "",  "italic"],
            \   "shConditional"           : [ "Red3", "", "bold,italic"],
            \   "shDblBrace"              : [ "#009F6F", "", "bold"],
            \   "shDblParen"              : [ "#009F6F", "", "bold"],
            \   "shDerefOp"               : [ "#2DB3A0", "",  ""],
            \   "shDeRefPattern"          : [ "#2DB3A0", "",  ""],
            \   "shDeRefPPSleft"          : [ "#99AD6A", "",  "italic"],
            \   "shDeRefPPSright"         : [ "#99AD6A", "",  "italic"],
            \   "shDeRefSimple"           : [ "AquaMarine3",    "", "italic"],
            \   "shDeRefVar"              : [ "#9B91F6", "",  "italic"],
            \   "shDerefWordError"        : [ "DarkSeaGreen1","#990024", ""],
            \   "shDo"                    : [ "#8FBFDC", "",  "italic"],
            \   "shDoubleQuote"           : [ "#2DB3A0", "",  "italic"],
            \   "shFor"                   : [ "Aquamarine3", "",  "italic"],
            \   "shFunction"              : [ "#009F6F","", "bold"],
            \   "shFunctionKey"           : [ "#009F6F","", "bold"],
            \   "shFunctionOne"           : [ "#9CC7CC", "",  "italic"],
            \   "shFunctionTwo"           : [ "SlateBlue2", "", ""],
            \   "shIf"                    : [ "#9A85FF", "",  "bold,italic"],
            \   "shIfError"               : [ "DarkSeaGreen1","#990024", "italic"],
            \   "shLoop"                  : [ "#89AEB3", "",  "bold,italic"],
            \   "shNumber"                : [ "#8870FF", "", ""],
            \   "shOperator"              : [ "#C59F6F", "",  "italic"],
            \   "shOption"				  : [ "#779DB2", "",   "bold"],
            \   "shParen"                 : [ "#009F6F","","bold,italic"],
            \   "shParenError"            : [ "Red", "Gray35",  ""],
            \   "shQuote"                 : [ "#88B4CC", "",  "bold,italic"],
            \   "shRange"                 : [ "#81AAC0", "",  "bold,italic"],
            \   "shRedir"                 : [ "#C59F6F", "",  "bold"],
            \   "shRepeat"                : [ "#9B91F6", "",  "bold,italic"],
            \   "shSet"                   : [ "#009F6F", "",  "bold"],
            \   "shSetIdentifier"         : [ "#009F6F", "",  "bold"],
            \   "shSetList"               : [ "#2DB3A0", "",  ""],
            \   "shSingleQuote"			  : [ "#9A85FF", "",  ""],
            \   "shSnglCase"              : [ "Red", "",  ""],
            \   "shSource"                : [ "PowderBlue", "",  "bold"],
            \   "shSpecial"				  : [ "#2DB3A0", "",  "italic"],
            \   "shStatement"             : [ "#2FBBA6", "",  "italic"],
            \   "shString"				  : [ "#9A85FF", "",  ""],
            \   "shTestOpr"               : [ "#C59F6F", "",  ""],
            \   "shTestPattern"           : [ "#99ad6a", "", "bold"],
            \   "shTodo"                  : [ "Wheat2", "#345FA8",  "italic"],
            \   "shVariable"              : [ "PaleGreen3", "", "italic"],
            \   }
endif

" Tex and Postscript                                                                      {{{2
if !exists("s:dict_hi_tex")
        let s:dict_hi_tex = {
            \   "postScrConditional"     : [ "#009F6F", "", "bold"],
            \   "postScrConstant"        : [ "#85B2FE", "",  ""],
            \   "postScrDSCcomment"      : [ "#A08FF5", "",  ""],
            \   "postScrFloat"           : [ "AquaMarine3", "",  ""],
            \   "postScrIdentifier"      : [ "Aquamarine3", "",  ""],
            \   "postScrInteger"         : [ "AquaMarine3", "",  ""],
            \   "postScrL2Operator"      : [ "#85B2FE", "",  ""],
            \   "postScrOperator"        : [ "#85B2FE", "",  ""],
            \   "postScrRepeat"          : [ "#85B2FE", "",  ""],
            \   "texBegin"               : [ "#009F6F","","bold"],
            \   "texBeginEndName"        : [ "#009F6F","","bold"],
            \   "texComment"             : [ "#78B37A", "",  "italic"],
            \   "texDelimiter"           : [ "Red", "", ""],
            \   "texDocType"             : [ "#00B780","","bold,italic"],
            \   "texDocZone"             : [ "#85B2FE", "#152933", ""],
            \   "texEnd"                 : [ "#009F6F","","bold"],
            \   "texMathOper"            : [ "DodgerBlue", "",  ""],
            \   "texMathZone"            : [ "#8870FF", "",  "bold"],
            \   "texMathZoneV"           : [ "DodgerBlue", "",  ""],
            \   "texMathZoneW"           : [ "DodgerBlue", "",  ""],
            \   "texOnlyMath"            : [ "PowderBlue", "",  ""],
            \   "texSection"             : [ "#00B780","","italic"],
            \   "texSectionName"         : [ "#BE00CC",  "", "bold"],
            \   "texSectionZone"         : [ "PowderBlue", "", ""],
            \   "texSpecialChar"         : [ "SlateGray2", "",  ""],
            \   "texStatement"           : [ "#c59f6f", "",  "italic"],
            \   "texSubscripts"          : [ "DodgerBlue", "",  ""],
            \   "texSuperscripts"        : [ "DodgerBlue", "",  ""],
            \   "texTitle"               : [ "PaleGreen2", "#254859", ""],
            \ }
endif

" program transformation tools: TXL, Kelbt, Ragel, COLM etc.                              {{{2
if !exists("s:dict_hi_pgtransform")
        let s:dict_hi_pgtransform = {
            \   "cflTypeRegion"            : [ "#779DB2", "",  "italic"],
            \   "defKeywords"              : [ "#009F6F","","bold"],
            \   "regionDelimiter"          : [ "Red", "",  ""],
            \   "rlLiteral"                : [ "#9A85FF","","italic"],
            \   "rlNumber"                 : [ "#9A85FF","",""],
            \   "rlTypeRegion"             : [ "SlateBlue1", "",  ""],
            \   "tlComment"                : [ "#77996C", "",  ""],
            \   "tlIdentifier"             : [ "#00B880", "",  ""],
            \   "txlComment"               : [ "CadetBlue", "",  "italic"],
            \   "txlFormat"                : [ "#c59f6f", "",  ""],
            \   "txlKeyword"               : [ "AquaMarine3", "",  ""],
            \   "txlLiteral"               : [ "#8870FF","",  "bold"],
            \   "txlPreprocessor"          : [ "PaleGreen3", "#152933", "italic"],
            \   "typeKeywords"             : [ "#00B880","",""],
            \   "varCapture"               : [ "#8fbfdc", "",  ""],
            \ }
endif

" Vim Features: diff,folding,hex,quickfix etc.                                            {{{2
" NOTE: part of the diff settings are defined under the 'diff' global dict key options
if !exists("s:dict_hi_vimfeat")
        let s:dict_hi_vimfeat = {
            \   "diffBDiffer"           : [ "SteelBlue3",    "",        ""],
            \   "diffComment"           : [ "#557F8F",       "",        ""],
            \   "diffCommon"            : [ "SteelBlue3",    "",        ""],
            \   "diffDiffer"            : [ "Green3",         "",       ""],
            \   "diffIdentical"         : [ "Green3",         "",       ""],
            \   "diffIsA"               : [ "SteelBlue3",    "",        ""],
            \   "diffNoEOL"             : [ "SteelBlue3",    "",        ""],
            \   "diffOldFile"           : [ "Plum3",         "",        ""],
            \   "diffOnly"              : [ "Green3",        "",        ""],
            \   "iCursor"               : [ "white",         "red",     ""],
            \   "qfError"				: [ "Gold",          "",        "bold"],
            \   "qfFileName"			: [ "Aquamarine2",   "",        ""],
            \   "qfLineNr"				: [ "#5D8B9C",       "",        ""],
            \   "qfSeparator"			: [ "RosyBrown",     "",        ""],
            \   "xxdAddress"            : [ "#09BA85",       "",        ""],
            \   "xxdAscii"              : [ "#9B91F6",       "",        ""],
            \   "xxdDot"                : [ "SlateGray2",    "",        "bold,underline"],
            \   "xxdSep"                : [ "#009F6F",       "",        "bold"],
                    \ }
endif

" VimL -- Vim script, Vim Language                                                        {{{2
if !exists("s:dict_hi_vimlang")
        let s:dict_hi_vimlang = {
            \   "vimAddress"                  : [ "#9FC7FF", "",  ""],
            \   "vimAuGroup"                  : [ "SlateBlue2", "",  "bold"],
            \   "vimAugroupKey"               : [ "SkyBlue2", "",  "italic,underline"],
            \   "vimAutoCmd"                  : [ "#32C5B0", "",  ""],
            \   "vimAutoCmdSfxList"           : [ "#32C5B0", "",  ""],
            \   "vimAutoevent"                : [ "#9A85FF", "",  ""],
            \   "vimAutoeventList"            : [ "#32C5B0", "",  ""],
            \   "vimBracket"                  : [ "#7EB49C", "",  ""],
            \   "vimCmdSep"                   : [ "RosyBrown", "",  "bold"],
            \   "vimCmplxRepeat"              : [ "#C6B6FE", "bg",  ""],
            \   "vimCommand"                  : [ "PowderBlue", "",  ""],
            \   "vimComment"                  : [ "#5D8B9C", "",  "italic"],
            \   "vimCommentString"            : [ "#5D8B9C", "",  "italic"],
            \   "vimCommentTitle"             : [ "#8B7F4C", "",  "italic"],
            \   "vimContinue"                 : [ "SlateBlue2", "",  "bold"],
            \   "vimCtrlChar"                 : [ "Green", "", ""],
            \   "vimEcho"                     : [ "PaleGreen3", "",  "bold"],
            \   "vimElseIferr"                : [ "PowderBlue", "",  "underline"],
            \   "vimEnvVar"                   : [ "#85B2FE", "#152933", "italic"],
            \   "vimError"                    : [ "Red", "",  "bold"],
            \   "vimExecute"                  : [ "SkyBlue", "", "italic"],
            \   "vimFBvar"                    : [ "SteelBlue2", "",  "italic"],
            \   "vimFgBgAttrib"               : [ "DeepSkyBlue3", "", ""],
            \   "vimFiletype"                 : [ "#779DB2", "",   "italic"],
            \   "vimFirstChar"                : [ "Orange", "",  ""],
            \   "vimFTError"                  : [ "DodgerBlue3", "",   "bold"],
            \   "vimFTOption"                 : [ "#779DB2", "",   "italic"],
            \   "vimFunc"                     : [ "White", "",   "bold"],
            \   "vimFuncKey"                  : [ "LightCyan3", "", "bold"],
            \   "vimFuncName"                 : [ "#2FBBA6", "", "underline,italic"],
            \   "vimFuncSID"                  : [ "PowderBlue", "",  ""],
            \   "vimFunction"                 : [ "LightCyan2","", ""],
            \   "vimFuncVar"                  : [ "SteelBlue3", "",  "underline,italic"],
            \   "vimGroup"                    : [ "SeaGreen3", "#1C3644", ""],
            \   "vimGroupList"                : [ "#7EB49C", "", "italic"],
            \   "vimGroupName"                : [ "#7EB49C", "", ""],
            \   "vimGroupSpecial"             : [ "#7EB49C", "", "italic"],
            \   "vimHiAttrib"				  : [ "DeepSkyBlue3", "", ""],
            \   "vimHiClear"                  : [ "#A8C2EF",    "DarkSlateGrey", ""],
            \   "vimHiCterm"                  : [ "DeepSkyBlue3", "", ""],
            \   "vimHiCtermColor"             : [ "SteelBlue1",   "DarkSlateGrey", ""],
            \   "vimHiCtermFgBg"              : [ "DodgerBlue2", "",  ""],
            \   "vimHighLight"                : [ "SeaGreen3", "#1C3644", ""],
            \   "vimHiGroup"                  : [ "SeaGreen3", "#1C3644", ""],
            \   "vimHiGui"                    : [ "DeepSkyBlue3", "", ""],
            \   "vimHiGuiFgBg"                : [ "DodgerBlue2", "",  ""],
            \   "vimHiGuiRGB"                 : [ "SteelBlue1",    "DarkSlateGrey",  ""],
            \   "vimHiKeyList"                : [ "#2DB3A0", "",  ""],
            \   "vimHiTerm"                   : [ "DeepSkyBlue3", "", ""],
            \   "vimLastChar"                 : [ "Orange", "",  ""],
            \   "vimLet"                      : [ "PowderBlue", "",  ""],
            \   "vimLineComment"              : [ "#5D8B9C", "",  ""],
            \   "vimMap"                      : [ "LightCyan3", "",  ""],
            \   "vimMapLHS"                   : [ "SkyBlue2", "",  ""],
            \   "vimMapMod"                   : [ "#2DB3A0", "", ""],
            \   "vimMapModKey"                : [ "#2DB3A0", "",  "italic"],
            \   "vimMark"                     : [ "#CC4455", "", "bold"],
            \   "vimMarker"                   : [ "Aquamarine1", "",  "bold"],
            \   "vimMenuLHS"                  : [ "SeaGreen4", "",  ""],
            \   "vimMenuName"                 : [ "#85B2FE", "",  ""],
            \   "vimMenuRHS"                  : [ "#85B2FE", "",  "italic"],
            \   "vimNormCmds"                 : [ "#85B2FE", "",  "italic"],
            \   "vimNotation"                 : [ "#7EB49C", "", ""],
            \   "vimNotFunc"                  : [ "PowderBlue", "",  ""],
            \   "vimOper"                     : [ "#7fa2e6", "",  "bold"],
            \   "vimOperError"                : [ "SteelBlue2", "",  ""],
            \   "vimOperParen"                : [ "#7fa2e6", "",  ""],
            \   "vimOption"                   : [ "#AFAFFF", "#1C4F4F", "italic"],
            \   "vimParenSep"                 : [ "#779DB2", "",   "bold"],
            \   "vimPatOneOrMore"             : [ "red", "",  ""],
            \   "vimPatRegionClose"           : [ "#32C5B0", "",  "bold"],
            \   "vimPatRegionOpen"            : [ "#32C5B0", "",  "bold"],
            \   "vimPatSep"                   : [ "#CC4455", "",  ""],
            \   "vimPatSepR"                  : [ "#CC4455", "",  ""],
            \   "vimPatSepZ"                  : [ "#CC4455", "",  ""],
            \   "vimPerlRegion"               : [ "#C59F6F", "", "" ],
            \   "vimPythonRegion"             : [ "#C59F6F", "", "" ],
            \   "vimRegister"                 : [ "#C6B6FE", "bg",  ""],
            \   "vimRubyRegion"               : [ "#C59F6F", "", "" ],
            \   "vimScriptDelim"              : [ "#76B286", "", "underline"],
            \   "vimSearch"                   : [ "Gray50", "",  "italic"],
            \   "vimSearchDelim"              : [ "Gray50", "",  "italic"],
            \   "vimSep"                      : [ "SlateBlue2", "", ""],
            \   "vimSet"                      : [ "#85B2FE",    "#1C4F4F", ""],
            \   "vimSetEqual"                 : [ "#85B2FE",    "#1C4F4F", ""],
            \   "vimSetMod"                   : [ "#85B2FE",    "#1C4F4F", "italic"],
            \   "vimSetSep"                   : [ "#85B2FE",    "#1C4F4F", ""],
            \   "vimSpecFile"                 : [ "CornFlowerBlue", "",  "italic"],
            \   "vimSpecial"                  : [ "#7FA2E6", "",  ""],
            \   "vimSubst"                    : [ "DeepSkyBlue2", "",  ""],
            \   "vimSubst1"                   : [ "#93BBBF", "",  ""],
            \   "vimSubstDelim"               : [ "#57D700", "",  ""],
            \   "vimSubstFlagErr"             : [ "Turquoise3", "",  ""],
            \   "vimSubstFlags"               : [ "#009F6F","","bold,italic"],
            \   "vimSubstPat"                 : [ "PaleGreen3", "",  "bold"],
            \   "vimSubstRep4"                : [ "SteelBlue2","","bold"],
            \   "vimSubstSubstr"              : [ "SkyBlue3", "",  ""],
            \   "vimSynCase"                  : [ "#009F6F","","bold"],
            \   "vimSyncKey"                  : [ "#009F6F","",""],
            \   "vimSyncLines"                : [ "#009F6F","",""],
            \   "vimSyncMatch"                : [ "#90CFB3","",""],
            \   "vimSynContains"              : [ "#009F6F","",""],
            \   "vimSynError"                 : [ "#2FBBA6", "", "italic,undercurl"],
            \   "vimSynKeyOpt"                : [ "#8870FF","",""],
            \   "vimSynKeyRegion"             : [ "SkyBlue2","",""],
            \   "vimSynMtchGrp"               : [ "#009F6F","",""],
            \   "vimSynMtchOpt"               : [ "#8870FF","",""],
            \   "vimSynNextGroup"             : [ "#009F6F","","italic"],
            \   "vimSynOption"                : [ "#009F6F","","italic"],
            \   "vimSynPatMod"                : [ "#6B9999", "",  "underline"],
            \   "vimSynRegion"                : [ "#8870FF","",""],
            \   "vimSynRegOpt"                : [ "#8870FF","",""],
            \   "vimSynRegPat"                : [ "#8870FF","",""],
            \   "vimSyntax"                   : [ "#009F6F","","bold"],
            \   "vimSynType"                  : [ "#009F6F","",""],
            \   "vimUserAttrbCmpltFunc"       : [ "#7FA2E6", "",  "underline"],
            \   "vimUserAttrbKey"             : [ "#32C5B0", "",  "italic"],
            \   "vimUserCmd"                  : [ "#CC4455", "", "bold"],
            \   "vimUserCmdError"             : [ "PaleGreen3","#1C4F4F", ""],
            \   "vimUserFunc"                 : [ "#32C5B0", "", "italic"],
            \   "vimVar"                      : [ "#2FBBA6", "", "italic"],
            \ }
endif

" Vim Plugins:  plugins with a few customized highlights, come into this bucket           {{{2
if !exists("s:dict_hi_other_plugins")
        let s:dict_hi_other_plugins = {
            \   "dbgBreakPt"                   : [ "", "FireBrick",  ""],
            \   "dbgCurrent"                   : [ "Tomato", "#573d8c",  ""],
            \   "dosIniLabel"                  : [ "SlateGray3", "",  "bold"],
            \   "dosIniNumber"                 : [ "SlateGray3", "",  ""],
            \   "fountainBold"                 : [ "LightCyan3", "#573D8C", ""],
            \   "fountainCentered"             : [ "#E7F56B", "", ""  ],
            \   "fountainCharacter"            : [ "BurlyWood3", "", ""],
            \   "fountainDialogue"             : [ "#8ecfbe", "", "italic"],
            \   "fountainPageBreak"            : [ "#556b2f", "", ""],
            \   "fountainParenthetical"        : [ "Gray50", "", ""],
            \   "fountainSceneHeading"         : [ "#65C254", "",  "bold"],
            \   "fountainTitlePage"            : [ "#bfaf69", "", "bold"],
            \   "fountainTransition"           : [ "#BAB585", "", ""],
            \   "indentGuidesEven"             : [ "", "#3D2B6B", ""],
            \   "indentGuidesOdd"              : [ "", "#1c3644", ""],
            \   "listmaps_filename"			   : [ "#CBD234", "#564227",  ""],
            \   "listmaps_underline"		   : [ "#CBD234", "#564227",  ""],
            \   "neocomplcacheexpandsnippets"  : [ "PaleGoldenRod", "",  ""],
            \   "quickfixsignsMarksTexthl"     : [ "White", "#3A5022", ""],
            \   "snipKeyword"                  : [ "#2FBBA6", "",  ""],
            \   "snippetComment"               : [ "SlateGray3", "",  "italic"],
            \   "snippetEval"                  : [ "PowderBlue",  "#152933",  "italic"],
            \   "snippetExpand"                : [ "#779DB2", "",   "italic"],
            \   "snippetKeyword"               : [ "#2FBBA6", "",  "underline"],
            \   "snippetName"                  : [ "#2FBBA6", "",  ""],
            \   "snippetWord"                  : [ "#78B37A", "", ""],
            \   "snipPythonCommand"            : [ "SlateBlue3", "",  ""],
            \   "snipStart"                    : [ "SeaGreen2", "",  ""],
            \   "snipString"                   : [ "#2FBBA6", "",  "italic"],
            \   "snipVar"                      : [ "DeepSkyBlue2", "",  ""],
            \   "snipVarExpansion"             : [ "DeepSkyBlue1", "",  ""],
            \   "snipVarPythonCommand"         : [ "Tomato", "",  ""],
            \   "tabLine"                      : [ "CornflowerBlue", "Gray26",  "italic"],
            \   "tabLineClose"                 : [ "CornflowerBlue",    "Gray26",           "bold"],
            \   "tabLineFill"                  : [ "CornflowerBlue", "Gray20",  "underline"],
            \   "tabLineNumber"                : [ "#3CEEB3",    "Gray26",           "bold"],
            \   "tabLineSel"                   : [ "RoyalBlue", "bg",  "bold,italic"],
            \   "tabManHelp"                   : [ "#5D8B9C", "",  "italic"],
            \   "tabManHKey"                   : [ "LimeGreen", "", "italic"],
            \   "tabManHSpecial"               : [ "RoyalBlue", "bg",  "italic"],
            \   "tabManTName"                  : [ "#CC4455", "",  ""],
            \   "tagListComment"               : [ "CadetBlue", "bg",  ""],
            \   "tagListFileName"              : [ "SeaGreen3", "#473273", "bold,italic"],
            \   "tagListTagScope"              : [ "CadetBlue",  "",  ""],
            \   "tagListTitle"                 : [ "SeaGreen3",  "#1C3644",  "bold,italic"],
            \ }
endif

" XML and DTD                                                                             {{{2
if !exists("s:dict_hi_xml")
        let s:dict_hi_xml = {
            \   "dtdFunction"                : [ "SlateGray4", "",  "bold"],
            \   "dtdTag"                     : [ "#cda8c9", "",  "italic"],
            \   "xmlAttrib"                  : [ "#7EB49C", "", ""],
            \   "xmlCDATA"                   : [ "PaleGreen2", "DarkSlateGrey",  "bold,italic"],
            \   "xmlCDATAcdata"              : [ "Khaki4", "DarkSlateGrey",  "italic"],
            \   "xmlCDATAend"                : [ "Khaki4", "DarkSlateGrey",  "italic"],
            \   "xmlCDATAstart"              : [ "Khaki4", "DarkSlateGrey",  "italic"],
            \   "xmlComment"                 : [ "#CC4455",      "",  "italic"],
            \   "xmlCommentStart"            : [ "#CC4455",      "",  "italic"],
            \   "xmlDocType"                 : [ "#cda8c9", "",  "italic"],
            \   "xmlDocTypeDecl"             : [ "SlateGray3", "",  ""],
            \   "xmlDocTypeKeyword"          : [ "SlateGray3", "",  "italic"],
            \   "xmlEndTag"                  : [ "SlateGray4", "", "bold"],
            \   "xmlEntityPunct"             : [ "#00B880","",""],
            \   "xmlEqual"                   : [ "#00B780","","bold"],
            \   "xmlNameSpace"               : [ "#00B880","","italic"],
            \   "xmlProcessingDelim"         : [ "#CC4455", "",  ""],
            \   "xmlString"                  : [ "#7C9DD4", "",  "italic"],
            \   "xmlTag"                     : [ "SlateGray3", "", ""],
            \   "xmlTagName"                 : [ "SlateGray3", "", ""],
            \   "xmlValue"                   : [ "Navy", "#BDCA51",  "italic"],
            \ }
endif

" YAML                                                                                    {{{2
if !exists("s:dict_hi_yaml")
        let s:dict_hi_yaml = {
            \   "yamlAlias"                      : [ "#8870FF", "",  "italic,underline"],
            \   "yamlAnchor"                     : [ "#8870FF", "",  "italic"],
            \   "yamlBlockCollectionItemStart"   : [ "SeaGreen2", "",  "bold"],
            \   "yamlBlockMappingKey"            : [ "#2DB3A0", "",  ""],
            \   "yamlDocumentStart"              : [ "Red1", "",  "bold"],
            \   "yamlFlowIndicator"              : [ "SeaGreen2", "",  ""],
            \   "yamlFlowMappingKey"             : [ "seagreen3", "",  ""],
            \   "yamlInteger"                    : [ "#8870FF", "",  ""],
            \   "yamlKeyValueDelimiter"          : [ "RosyBrown", "",  "bold"],
            \   "yamlPlainScalar"                : [ "SeaGreen2", "",  ""],
            \   "yamlTimestamp"                  : [ "#8870FF", "",  ""],
            \ }
endif

" Manpages and nroff                                                                      {{{2
if !exists("s:dict_hi_manpage")
        let s:dict_hi_manpage = {
            \   "manReference"              : [ "PaleGreen1", "",  "underline"],
            \   "manSectionHeading"         : [ "LimeGreen",  "",  "bold"],
            \   "manSubHeading"             : [ "Green2",     "",   "italic"],
            \   "manTitle"                  : [ "Brown2",     "",  "bold"],
            \   "nroffEscape"				: [ "#00B880","","bold"],
            \   "nroffEscRegArg"			: [ "AquaMarine", "#880C0E",  "bold"],
            \   "nroffIdent"				: [ "SkyBlue3", "",  "underline"],
            \   "nroffRequest"				: [ "SeaGreen3", "",  "bold"],
            \   "nroffSpecialChar"			: [ "AquaMarine", "#880C0E",  ""],
            \   }
endif

" Lua                                                                                     {{{2
if !exists("s:dict_hi_lua")
        let s:dict_hi_lua = {
            \   "luaConstant"             : [ "#85B2FE", "",  ""],
            \   "luaFunc"                 : [ "#009F6F", "", "bold,italic"],
            \   "luaFunction"             : [ "#85B2FE", "", "bold"],
            \   "luaNumber"               : [ "#85B2FE", "",  ""],
            \   "luaOperator"             : [ "PaleGreen3","","bold,underline"],
            \   "luaParen"                : [ "Red", "",  ""],
            \   "luaRepeat"               : [ "SeaGreen2", "",  "underline"],
            \   "luaSpecial"              : [ "AquaMarine4", "",  "bold"],
            \   "luaStatement"            : [ "SeaGreen2", "",  ""],
            \   "luaString"               : [ "#9A85FF", "",  ""],
            \   "luaTable"                : [ "#00B880","","bold"],
            \   "luaTodo"                 : [ "Wheat2", "#345FA8",  "italic"],
            \   }
        endif

" Make, config and similar build tools                                                    {{{2
if !exists("s:dict_hi_build_tools")
        let s:dict_hi_build_tools = {
            \   "aapCommand"                  : [ "#65C254", "",  ""],
            \   "automakeClean"               : [ "AquaMarine2", "", ""],
            \   "automakeComment1"            : [ "#77996C", "",  "italic"],
            \   "automakeConditional"         : [ "Aquamarine3","","bold,italic"],
            \   "automakeExtra"               : [ "AquaMarine2", "", "italic"],
            \   "automakeMakeBString"         : [ "#9A85FF","","italic"],
            \   "automakeSecondary"           : [ "#009F6F","",""],
            \   "automakeSubDirs"             : [ "#00B880","",""],
            \   "CfgComment"                  : [ "#7EB49C", "", "italic"],
            \   "CfgOnOff"                    : [ "Aquamarine3", "",  "bold"],
            \   "CfgSection"                  : [ "#7EB49C", "", "italic"],
            \   "CfgString"                   : [ "#65C254", "", "italic"],
            \   "CfgValues"                   : [ "SkyBlue1", "",  ""],
            \   "confComment"                 : [ "CadetBlue", "",  "italic"],
            \   "configFunction"              : [ "#65C254", "",  ""],
            \   "configString"                : [ "#9A85FF", "",  ""],
            \   "confTodo"                    : [ "Wheat2", "#345FA8",  "italic"],
            \   "m4Command"                   : [ "#009F6F", "",  ""],
            \   "m4Comment"                   : [ "#557F8F", "",  ""],
            \   "m4Function"                  : [ "#65C254", "",  ""],
            \   "m4Preproc"                   : [ "SeaGreen3",  "#152933",  ""],
            \   "m4Special"                   : [ "#65C254", "",  "bold"],
            \   "m4Statement"                 : [ "PaleGreen1", "",  ""],
            \   "m4String"                    : [ "#9A85FF","","italic"],
            \   "m4Type"                      : [ "Aquamarine2", "",  "bold"],
            \   "m4Variable"                  : [ "", "#3D2B6B", ""],
            \   "makeBstring"                 : [ "Turquoise3", "",  ""],
            \   "makeCommandError"            : [ "Red", "",  "bold"],
            \   "makeComment"                 : [ "#77996C", "",  "italic"],
            \   "makeConfig"                  : [ "#7FA2E6", "",  ""],
            \   "makeDstring"                 : [ "#9A85FF", "",  ""],
            \   "makeIdent"                   : [ "Aquamarine3", "",  ""],
            \   "makePreCondit"               : [ "#8870FF", "",  "italic"],
            \   "makeSpecial"                 : [ "#CC4455", "",  ""],
            \   "makeSString"                 : [ "#9A85FF", "",  "italic"],
            \   "makeTarget"                  : [ "#00B880","","underline"],
            \ }
endif

" PHP                                                                                     {{{2
if !exists("s:dict_hi_php")
        let s:dict_hi_php = {
            \   "phpArrayPair"          : [ "#2DB3A0", "",  "italic"],
            \   "phpBoolean"            : [ "MediumSlateBlue","",""],
            \   "phpFunctions"          : [ "#85B2FE", "#152933", ""],
            \   "phpNull"               : [ "MediumSlateBlue","",""],
            \   "phpQuoteDouble"        : [ "#8CA854", "",  ""],
            \   "phpQuoteSingle"        : [ "#8CA854", "",  ""],
            \   "phpSuperGlobal"        : [ "#2DB3A0", "",  "bold,italic"],
            \ }
endif

" OTHER syntactical items                                                                 {{{2
if !exists("s:dict_hi_other")
        let s:dict_hi_other = {
            \   "adaAssignment"                : [ "Red", "",  ""],
            \   "adaAttribute"                 : [ "DodgerBlue3", "",  "italic"],
            \   "adaSpecial"                   : [ "RosyBrown", "",  "bold"],
            \   "Assignment"                   : [ "#F3DB8E", "",  ""],
            \   "Boolean"                      : [ "#8870FF", "", ""],
            \   "builtinFunc"                  : [ "#dad085", "",  "underline"],
            \   "builtinObj"                   : [ "#7F9D90", "", "" ],
            \   "calOperator"                  : [ "#af5f00", "",  ""],
            \   "Character"                    : [ "CadetBlue2", "",  ""],
            \   "cobolLine"                    : [ "DodgerBlue2", "",  ""],
            \   "cobolString"                  : [ "CadetBlue", "", "italic"],
            \   "Comment"                      : [ "Gray50", "",  "italic"],
            \   "Conditional"                  : [ "SeaGreen2", "",  ""],
            \   "Constant"                     : [ "CadetBlue2", "",  ""],
            \   "Cursor"                       : [ "#8700ff", "orange",  "italic,bold"],
            \   "cursorIM"                     : [ "Black", "OrangeRed",  ""],
            \   "Debug"                        : [ "#88CB35", "",  ""],
            \   "Decorator"                    : [ "#57d700", "",  ""],
            \   "Define"                       : [ "DodgerBlue2", "",  ""],
            \   "Definition"                   : [ "#f8ed97", "",  ""],
            \   "Delimiter"                    : [ "#779DB2", "",  "bold"],
            \   "Directory"                    : [ "DarkOliveGreen2", "",  "bold"],
            \   "Entity"                       : [ "#F4E891", "CadetBlue4",  ""],
            \   "Error"                        : [ "Linen", "DarkRed",  "bold"],
            \   "errorMsg"                     : [ "LightGoldenRod", "Firebrick",  ""],
            \   "Exception"                    : [ "SeaGreen2", "",  ""],
            \   "Float"                        : [ "Aquamarine2", "",  ""],
            \   "Function"                     : [ "Turquoise3", "",  ""],
            \   "Identifier"                   : [ "#009F6F", "",  "italic"],
            \   "Ignore"                       : [ "Gray24", "",  ""],
            \   "Import"                       : [ "#cda869", "",  ""],
            \   "Include"                      : [ "DodgerBlue2", "",  ""],
            \   "incSearch"                    : [ "Firebrick3", "Black",  "bold"],
            \   "Keyword"                      : [ "SeaGreen2", "",  ""],
            \   "Label"                        : [ "#009F6F", "", ""],
            \   "Macro"                        : [ "DodgerBlue2", "",  ""],
            \   "Number"                       : [ "Aquamarine2", "",  ""],
            \   "Operator"                     : [ "SpringGreen2", "", ""],
            \   "paramName"                    : [ "#5f87d7", "",  ""],
            \   "plibuiltin"                   : [ "steelblue2", "", ""],
            \   "plidelimiter"                 : [ "red", "", ""],
            \   "pMenu"                        : [ "BurlyWood1", "Gray30",  ""],
            \   "pMenuSbar"                    : [ "LightSeaGreen", "Gray20",  ""],
            \   "pMenuSel"                     : [ "Red", "Black",  "bold"],
            \   "pMenuThumb"                   : [ "Turquoise", "Gray10",  ""],
            \   "preciseJumpTarget"            : [ "#8700ff", "orange",  ""],
            \   "preCondit"                    : [ "DodgerBlue2", "",  ""],
            \   "preProc"                      : [ "#A191F5", "",  ""],
            \   "Question"                     : [ "#65C254", "",  ""],
            \   "rcInclude"                    : [ "#65C254", "",  ""],
            \   "rcString"                     : [ "#7fa2e6", "",  "italic"],
            \   "Repeat"                       : [ "SeaGreen2", "",  ""],
            \   "rexxLineContinue"             : [ "#65C254", "",  ""],
            \   "sasStatement"                 : [ "#009F6F", "", ""],
            \   "signColor"                    : [ "#C59F6F", "bg", "" ],
            \   "signColumn"                   : [ "PaleGoldenrod", "#0e2628",  ""],
            \   "specialChar"                  : [ "#88CB35", "",  ""],
            \   "specialKey"                   : [ "#869BCC", "",  "italic"],
            \   "Statement"                    : [ "#009F6F", "", ""],
            \   "storageClass"                 : [ "#c59f6f", "",  ""],
            \   "String"                       : [ "#99ad6a", "",  ""],
            \   "stringDelimiter"              : [ "#8CA854", "",  ""],
            \   "Structure"                    : [ "#8fbfdc", "",  ""],
            \   "superclass"                   : [ "#6A84AD", "#FFD1FA",  "reverse"],
            \   "Tag"                          : [ "#88CB35", "",  ""],
            \   "Test"                         : [ "#88AEB2", "",  "italic"],
            \   "Title"                        : [ "#009F6F", "", "bold,italic"],
            \   "Todo"                         : [ "Wheat2", "Maroon4",  ""],
            \   "Type"                         : [ "DeepSkyBlue2", "",  ""],
            \   "Typedef"                      : [ "DeepSkyBlue2", "",  ""],
            \   "Underlined"                   : [ "SkyBlue2", "",  "underline"],
            \   "UtlTag"                       : [ "RoyalBlue", "",  "italic"],
            \   "UtlURL"                       : [ "#8870FF",  "",  "underline"],
            \   "Visual"                       : [ "Navy", "DarkSeaGreen3", "bold"],
            \   "visualNOS"                    : [ "SlateGray3", "",  "bold,underline"],
            \   "warningMsg"                   : [ "Gold", "",  ""],
            \   "wildMenu"                     : [ "Black", "LimeGreen",  "bold"],
            \ }
endif

" Grouping The Non Optional Highlight Groups In A LIST                                    {{{1
if !exists("s:lst_dict_hi")
        let s:lst_dict_hi = [
                \  s:dict_hi_awk,
                \  s:dict_hi_build_tools,
                \  s:dict_hi_c_cpp,
                \  s:dict_hi_css,
                \  s:dict_hi_desktop,
                \  s:dict_hi_haskell,
                \  s:dict_hi_html,
                \  s:dict_hi_javatools,
                \  s:dict_hi_jscript,
                \  s:dict_hi_lisp,
                \  s:dict_hi_lua,
                \  s:dict_hi_manpage,
                \  s:dict_hi_markdown,
                \  s:dict_hi_nerds,
                \  s:dict_hi_ocaml,
                \  s:dict_hi_other,
                \  s:dict_hi_other_plugins,
                \  s:dict_hi_perl,
                \  s:dict_hi_pgtransform,
                \  s:dict_hi_php,
                \  s:dict_hi_plugin_bufX,
                \  s:dict_hi_python,
                \  s:dict_hi_rdf_and_graphs,
                \  s:dict_hi_rst,
                \  s:dict_hi_ruby,
                \  s:dict_hi_sed,
                \  s:dict_hi_sh,
                \  s:dict_hi_sql,
                \  s:dict_hi_tex,
                \  s:dict_hi_unixtools,
                \  s:dict_hi_vimfeat,
                \  s:dict_hi_vimhelp,
                \  s:dict_hi_vimlang,
                \  s:dict_hi_xml,
                \  s:dict_hi_yaml,
            \ ]
endif

" A Few Items Defined Outside Of The Color Dictionaries:                                  {{{1
" the items below have UNDERCURL highlight
highlight SpellBad             guifg=fg         guibg=bg      gui=undercurl      guisp=Yellow
highlight SpellCap             guifg=fg         guibg=bg      gui=undercurl      guisp=#CCFFCC
highlight SpellLocal           guifg=fg         guibg=bg      gui=undercurl      guisp=fg
highlight SpellRare            guifg=fg         guibg=bg      gui=undercurl      guisp=#C59F6F
highlight netrwList            guifg=AquaMarine guibg=#880C0E gui=bold,undercurl guisp=SkyBlue2

highlight! link PythonTodo VimTodo


" Begin Main Flow:                                                                              {{{1

call s:ParseAllSyntaxes(s:lst_dict_hi)

" get the options set by the user (external parameters)
call s:GetUserOptions()

" Set No Distraction Mode Highlights:                                                     {{{2
if (s:dic_cf_options.nodistractionmode[0]) && (exists("t:briofita_nodistractionmode"))
    " two conditions: (1) the dict enables ND mode; and,
    "                 (2) the t:var for ND is set for the curr tabpage
    call s:HighlightNoDistrMode()

else " this (*BEGINs the ELSE branch (normal operations mode)

" Set Common Highlights:                                                                  {{{1

" Set each highlight per options dictionary
for key in keys(s:dic_hi_options)
    if has_key(s:dic_cf_options,key)
        execute 'let maxix  = s:dic_cf_options.' . key . '[1]'
        execute 'let kvalue = s:dic_cf_options.' . key . '[0]'
        if (maxix == 1)     " first case: "boolean" options
            if (kvalue != 0)
                call s:HighlightPerOptionsDic(key)
                continue
            endif
        endif
        if (maxix > 1)
            " TODO check if it can excepted the case where cc=1 (cul/cuc would've set it?)
            call s:HighlightPerOptionsDic(key)
        endif
    endif
endfor

endif " this ENDs*) the ELSE branch (normal operations mode)

"
" Restore Cpo And Set Guicursor:                                                          {{{1
let &cpo = save_cpo
unlet save_cpo

" ICursor: set here to avoid a noxious hidden cursor I sometimes get with other colorschemes
set guicursor+=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150

"----------------------------------------------------------------------------
"
" Modeline:                                                                               {{{1
"
" vim: et:ts=4:sw=4:fdm=marker:fdl=0:ft=vim:
