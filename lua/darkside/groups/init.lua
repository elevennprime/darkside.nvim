local options = require('darkside').options

local M = {}

function M.from(palette)
	palette.none = "NONE"

	local theme = {}

	theme.editor = require("darkside.groups.editor").get(palette, options)
	theme.editor = vim.tbl_deep_extend("force", theme.editor, require("darkside.groups.lsp").get(palette, options))


	theme.syntax = {}
	local syntax_modules = { "syntax", "lsp_semantic", "treesitter", "diagnostic" }
	for i = 1, #syntax_modules do
		theme.syntax = vim.tbl_deep_extend(
			"force",
			theme.syntax,
			require("darkside.groups." .. syntax_modules[i]).get(palette, options)
		)
	end

	local final_modules = {}

	for module_name in pairs(options.modules) do
		local cot = false
		if type(options.modules[module_name]) == "table" then
			if options.modules[module_name].enabled == true then
				cot = true
			end
		else
			if options.modules[module_name] == true then
				local default = require("darkside").default_options.modules[module_name]
				options.modules[module_name] = type(default) == "table" and default or {}
				options.modules[module_name].enabled = true
				cot = true
			end
		end

		local ok, result = pcall(require, "darkside.groups.modules." .. module_name)
		if ok and result.get and cot then
			final_modules = vim.tbl_deep_extend("force", final_modules, result.get(palette, options))
		end

	end

	theme.modules = final_modules

	return theme
end

return M
