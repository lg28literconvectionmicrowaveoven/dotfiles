return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { "%C" }, click = "v:lua.ScFa" },
				{
					text = {
						function(args)
							if args.lnum == vim.fn.line(".") then
								return "%#CursorLineNr#" .. builtin.lnumfunc(args)
							else
								return "%#LineNr#" .. builtin.lnumfunc(args)
							end
						end,
						" ",
					},
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},
				{ text = { "%s" }, click = "v:lua.ScSa" },
			},
		})
	end,
}
