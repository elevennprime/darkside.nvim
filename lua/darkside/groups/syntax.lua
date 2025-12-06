local M = {}

function M.get(palette, config)
	return {
		-- Comment: any comment
		Comment             = {fg = palette.comments},

		--[[
			Constant: any constant
			String: any string
			Character: any character constant: 'c', '\n'
			Number: a number constant: 5
			Boolean: a boolean constant: TRUE, false
			Float: a floating point constant: 2.3e10
		]]
		Constant            = {fg = palette.fg},
		String              = {fg = palette.green},
		Character           = {fg = palette.orange},
		Number              = {fg = palette.fg},
		Boolean             = {fg = palette.red1},
		Float               = {fg = palette.fg},

		--[[
			Identifier: any variable name
			Function: italic funtion names
		]]
		Identifier          = {fg = palette.fg},
		Function            = {fg = palette.fg},

		--[[
			Statement: any statement
			Conditional: italic if, then, else, endif, switch, etc.
			Repeat: italic any other keyword
			Label: case, default, etc.
			Operator: sizeof", "+", "*", etc.
			Keyword: italic for, do, while, etc.
			Exception: try, catch, throw
		]]
		Statement           = {fg = palette.cyan},
		Conditional         = {fg = palette.yellow, style = { "bold" }},
		Repeat              = {fg = palette.yellow, style = { "bold" }},
		Label               = {fg = palette.fg, style = { "bold" }},
		Operator            = {fg = palette.fg},
		Keyword             = {fg = palette.yellow, style = { "bold" }},
		Exception           = {fg = palette.yellow, style = { "bold" }},

		--[[
			PreProc: generic Preprocessor
			Include: preprocessor #include
			Define: preprocessor #define
			Macro: same as Define
			PreCondit: preprocessor #if, #else, #endif, etc.
			Type: int, long, char, etc.
			StorageClass: static, register, volatile, etc.
			Structure: struct, union, enum, etc.
			Typedef: A typedef
		]]
		PreProc             = {fg = palette.gray},
		Include             = {fg = palette.pink1},
		Define              = {fg = palette.gray},
		Macro               = {fg = palette.fg},
		PreCondit           = {fg = palette.gray},
		Type                = {fg = palette.blue1},
		StorageClass        = {fg = palette.cyan},
		Structure           = {fg = palette.blue1},
		Typedef             = {fg = palette.red},

		--[[
			Special: any special symbol
			SpecialChar: special character in a constant
			Tag: you can use CTRL-] on this
			Delimiter: character that needs attention like , or .
			SpecialComment: special things inside a comment
			Debug: debugging statements
		]]
		Special             = {fg = palette.fg},
		SpecialChar         = {fg = palette.disabled},
		Tag                 = {fg = palette.red},
		Delimiter           = {fg = palette.fg},
		SpecialComment      = {link = "Comment"},
		Debug               = {fg = palette.red},

		-- Underlined: text that stands out, HTML links
		Underlined          = {fg = palette.link, style = { "underline" }},

		-- Ignore: left blank, hidden
		Ignore              = {fg = palette.disabled},

		-- Error: any erroneous construct
		Error               = {fg = palette.error, style = { "bold", "underline" }},

		-- Todo: anything that needs extra attention; mostly the keywords TODO HACK FIXME and XXX
		Todo                = {fg = palette.orange, style = { "bold" }},

		-- Extra highlights
		htmlLink            = {fg = palette.link, style = { "underline" }},
		htmlTagName         = {fg = palette.pink1},

		htmlArg             = {fg = palette.fg},
		htmlH1              = {fg = palette.cyan, style = { "bold" }},
		htmlH2              = {fg = palette.red, style = { "bold" }},
		htmlH3              = {fg = palette.green, style = { "bold" }},
		htmlH4              = {fg = palette.yellow, style = { "bold" }},
		htmlH5              = {fg = palette.purple, style = { "bold" }},

		xmlTagName          = {link = "htmlTagName"},
		xmlTagN             = {link = "xmlTagName"},
		xmlAttrib           = {link = "htmlArg"},

		markdownH1          = {fg = palette.cyan, style = { "bold" }},
		markdownH2          = {fg = palette.red, style = { "bold" }},
		markdownH3          = {fg = palette.green, style = { "bold" }},
		markdownH1Delimiter = {fg = palette.cyan},
		markdownH2Delimiter = {fg = palette.red},
		markdownH3Delimiter = {fg = palette.green},

		healthError         = {fg = palette.error},
		healthSuccess       = {fg = palette.green},
		healthWarning       = {fg = palette.yellow},

		-- Dashboard
		DashboardShortCut = {fg = palette.red},
		DashboardHeader   = {fg = palette.comments},
		DashboardCenter   = {fg = palette.accent},
		DashboardFooter   = {fg = palette.green, style = { "italic" }},

		-- json
		jsonKeyword          = {fg = palette.fg, bold = false},

		-- diff
		-- diffRemoved   = {link = "DiffDelete"},
		-- diffAdded     = {link = "DiffAdd"},

		-- Quickfix list
		qfLineNr = { fg = palette.line_numbers },
		qfFileName = { fg = palette.fg },
		qfSeparator1 = { fg = palette.line_numbers },
		qfSeparator2 = { fg = palette.line_numbers },
	}
end

return M
