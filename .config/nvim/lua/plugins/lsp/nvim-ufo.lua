return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local ufo = require("ufo")
		ufo.setup({
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,
		})
		local map = vim.keymap.set
		map("n", "zR", ufo.openAllFolds, { desc = "Opens all code folds" })
		map("n", "zM", ufo.closeAllFolds, { desc = "Folds all code" })
		map("n", "zn", function()
			if not ufo.peekFoldedLinesUnderCursor() then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek fold under cursor" })
		map("n", "zm", "zc", { noremap = true, desc = "Folds code block under cursor" })
		map("n", "zr", "zo", { noremap = true, desc = "Opens folded code block under cursor" })
	end,
}
