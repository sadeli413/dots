local toggle_eob = function()
    if vim.g.peace_hide_eob == nil then
        vim.g.peace_hide_eob = true
    else
        vim.g.peace_hide_eob = nil
    end
    vim.cmd [[colorscheme peace]]
end

return {toggle_eob = toggle_eob}
