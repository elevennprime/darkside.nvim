local M = {}

function M.get(C)
	return {
		NeogitBranch        = { fg = C.green },
		NeogitBranchHead    = { fg = C.cyan, style = { "bold", "underline" } },
		NeogitSectionHeader = { link = "Keyword" },
		NeogitRemote        = { fg = C.red },
		NeogitObjectId      = { fg = C.line_numbers },
		NeogitTagName       = { link = "Comment" },
	}
end

return M
