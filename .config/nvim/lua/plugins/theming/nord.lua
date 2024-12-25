return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.cmd("colorscheme nord")
		vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#2e3440" })
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#506283" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { bold = true, bg = "#2e3440", fg = "#ebcb8b" })
		vim.api.nvim_set_hl(0, "NavicText", { fg = "#e5e9f0", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicSeparator", { fg = "#d8dee9", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsVariable", { bold = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { fg = "#5e81ac", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsStruct", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsString", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsProperty", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsPackage", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsOperator", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsObject", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsNumber", { fg = "#b48ead", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsNull", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsNamespace", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsModule", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsMethod", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsKey", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsInterface", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsFunction", { italic = true, fg = "#88c0d0", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsFile", { fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsField", { italic = true, fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsEvent", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { fg = "#a3be8c", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsEnum", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsConstructor", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsConstant", { fg = "#ebcb8b", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsBoolean", { bold = true, fg = "#81a1c1", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicIconsArray", { fg = "#ebcb8b", bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "NavicEnd", { bg = "#3b4252" })
		vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#ebcb8b" })
		-- vim.cmd([[
		--           colorscheme nord
		--           hi BufferLineFill guibg=#2e3440
		--           hi WinSeparator guifg=#506283
		--           hi CursorLineNr gui=bold guibg=#2e3440 guifg=#ebcb8b
		--           hi NavicText guifg=#e5e9f0 guibg=#3b4252
		--           hi NavicSeparator guifg=#d8dee9 guibg=#3b4252
		--           hi NavicIconsVariable gui=bold guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsTypeParameter guifg=#5e81ac guibg=#3b4252
		--           hi NavicIconsStruct guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsString gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsProperty gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsPackage gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsOperator guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsObject guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsNumber guifg=#b48ead guibg=#3b4252
		--           hi NavicIconsNull guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsNamespace gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsModule gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsMethod gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsKey  guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsInterface guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsFunction gui=italic guifg=#88c0d0 guibg=#3b4252
		--           hi NavicIconsFile guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsField gui=italic guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsEvent guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsEnumMember guifg=#a3be8c guibg=#3b4252
		--           hi NavicIconsEnum guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsConstructor guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsConstant guifg=#ebcb8b guibg=#3b4252
		--           hi NavicIconsClass guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsBoolean gui=bold guifg=#81a1c1 guibg=#3b4252
		--           hi NavicIconsArray guifg=#ebcb8b guibg=#3b4252
		--           hi NavicEnd guibg=#3b4252
		--           hi MoreMsg guifg=#ebcb8b
		--       ]])
	end,
}
