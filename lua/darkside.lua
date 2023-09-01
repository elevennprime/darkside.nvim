local util = {}

local darkside = require('highlights')
local config = require('config').options

-- Only define Darkside if it's the active colorshceme
function util.onColorScheme()
  if vim.g.colors_name ~= "darkside" then
    vim.cmd [[autocmd! Darkside]]
    vim.cmd [[augroup! Darkside]]
	-- vim.api.nvim_del_augroup_by_name("Darkside")
  end
end

-- Change the background for the terminal and packer windows
util.contrast = function ()
	local group = vim.api.nvim_create_augroup("Darkside", {clear = true})
	vim.api.nvim_create_autocmd("ColorScheme", {callback = function ()
		require("util").onColorScheme()
	end, group = group})

	for _, sidebar in ipairs(config.contrast_filetypes) do
		if sidebar == "terminal" then
			vim.api.nvim_create_autocmd("TermOpen", {
				command = "setlocal winhighlight=Normal:NormalContrast,SignColumn:NormalContrast",
				group = group,
			})
		else
			vim.api.nvim_create_autocmd("FileType", {
				pattern = sidebar,
				command = "setlocal winhighlight=Normal:NormalContrast,SignColumn:SignColumnFloat",
				group = group,
			})
		end
	end
end

-- Load the theme
function util.load()
    -- Set the theme environment
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.g.colors_name = "darkside"

	for _, theme in pairs(darkside) do
		local highlights = type(theme) == "function" and theme() or theme;
		for group, colors in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, colors)
		end
	end
end

return util
