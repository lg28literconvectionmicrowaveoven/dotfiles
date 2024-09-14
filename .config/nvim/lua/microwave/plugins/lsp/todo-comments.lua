return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local todo_comments = require("todo-comments")
        todo_comments.setup()
        local map = vim.keymap.set
        map('n', ']t', function()
            todo_comments.jump_next()
        end, { desc = "Jump to next TODO comment"})
        map('n', '[t', function()
            todo_comments.jump_prev()
        end, { desc = "Jump to previous TODO comment" })
    end
}
