local toggle_eob = function()
    if vim.g.halloween_hide_eob == nil then
        vim.g.halloween_hide_eob = true
    else
        vim.g.halloween_hide_eob = nil
    end
    vim.cmd [[colorscheme halloween]]
end

return {toggle_eob = toggle_eob}
