return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.cmd([[
            colorscheme nord
            hi BufferLineFill guibg=#2e3440
            hi WinSeparator guifg=#506283
            hi CursorLineNr gui=bold guibg=#2e3440 guifg=#ebcb8b
            hi NavicText guifg=#e5e9f0 guibg=#3b4252
            hi NavicSeparator guifg=#d8dee9 guibg=#3b4252
            hi NavicIconsVariable gui=bold guifg=#88c0d0 guibg=#3b4252
            hi NavicIconsTypeParameter guifg=#5e81ac guibg=#3b4252
            hi NavicIconsStruct guifg=#d08770 guibg=#3b4252
            hi NavicIconsString gui=italic guifg=#a3be8c guibg=#3b4252
            hi NavicIconsProperty gui=italic guifg=#d08770 guibg=#3b4252
            hi NavicIconsPackage gui=italic guifg=#ebcb8b guibg=#3b4252
            hi NavicIconsOperator guifg=#b48ead guibg=#3b4252
            hi NavicIconsObject guifg=#5e81ac guibg=#3b4252
            hi NavicIconsNumber guifg=#bf616a guibg=#3b4252
            hi NavicIconsNull guifg=#d8dee9 guibg=#3b4252
            hi NavicIconsNamespace gui=italic guifg=#88c0d0 guibg=#3b4252
            hi NavicIconsModule gui=italic guifg=#81a1c1 guibg=#3b4252
            hi NavicIconsMethod gui=italic guifg=#8fbcbb guibg=#3b4252
            hi NavicIconsKey guifg=#ebcb8b guibg=#3b4252
            hi NavicIconsInterface guifg=#88c0d0 guibg=#3b4252
            hi NavicIconsFunction gui=italic guifg=#8fbcbb guibg=#3b4252
            hi NavicIconsFile guifg=#d8dee9 guibg=#3b4252
            hi NavicIconsField gui=italic guifg=#d08770 guibg=#3b4252
            hi NavicIconsEvent guifg=#b48ead guibg=#3b4252
            hi NavicIconsEnumMember guifg=#8fbcbb guibg=#3b4252
            hi NavicIconsEnum guifg=#81a1c1 guibg=#3b4252
            hi NavicIconsConstructor guifg=#ebcb8b guibg=#3b4252
            hi NavicIconsConstant guifg=#d08770 guibg=#3b4252
            hi NavicIconsClass guifg=#88c0d0 guibg=#3b4252
            hi NavicIconsBoolean gui=bold guifg=#bf616a guibg=#3b4252
            hi NavicIconsArray guifg=#b48ead guibg=#3b4252
            hi NavicEnd guibg=#3b4252
            hi MoreMsg guifg=#ebcb8b
            hi CmpItemKindVariable guifg=#88c0d0
            hi CmpItemKindStruct guifg=#d08770
            hi CmpItemKindText guifg=#d8dee9
            hi CmpItemKindSnippet guifg=#ebcb8b
            hi CmpItemKindReference guifg=#81a1c1
            hi CmpItemKindProperty guifg=#d08770
            hi CmpItemKindOperator guifg=#b48ead
            hi CmpItemKindModule guifg=#81a1c1
            hi CmpItemKindValue guifg=#88c0d0
            hi CmpItemKindKeyword guifg=#b48ead
            hi CmpItemKindInterface guifg=#88c0d0
            hi CmpItemKindFunction guifg=#8fbcbb
            hi CmpItemKindFolder guifg=#d8dee9
            hi CmpItemKindFile guifg=#d8dee9
            hi CmpItemKindField guifg=#d08770
            hi CmpItemKindEnum guifg=#81a1c1
            hi CmpItemKindConstant guifg=#d08770
            hi CmpItemKindConstructor guifg=#ebcb8b
            hi CmpItemKindClass guifg=#88c0d0
            hi CmpItemKindUnit guifg=#bf616a
            hi CmpItemKindColor guifg=#8fbcbb
            hi CmpItemKindCopilot guifg=#a3be8c
        ]])
	end,
}
