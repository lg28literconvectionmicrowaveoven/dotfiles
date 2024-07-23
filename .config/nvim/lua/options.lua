-- Tabspace adjustments
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Restore cursor to blinking I-Beam (Alacritty) on exit
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver1-blinkon750
    augroup END
    set number
]])
