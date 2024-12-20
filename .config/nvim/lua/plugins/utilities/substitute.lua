return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local substitute = require("substitute")
        substitute.setup()
        local map = vim.keymap.set
        map('n', 'q', substitute.operator, { desc = "Substitute with motion" })
        map('n', 'qq', substitute.line, { desc = "Substitute line" })
        map('n', 'Q', substitute.eol, { desc = "Substitute to the end of the line" })
        map('x', 'q', substitute.visual, { desc = "Substitute in visual mode" })
    end
}
