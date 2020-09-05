local vim = vim
local api = vim.api

vim.o["showtabline"] = 2

local function render(bufnums)
    local tabline = ""

    for _, bufnum in pairs(bufnums) do
        if bufnum == vim.fn.bufnr("%") then
            tabline = tabline .. "%#TabLineSel#"
        else
            tabline = tabline .. "%#TabLine#"
        end
        local label = vim.fn.fnamemodify(vim.fn.bufname(bufnum), ":t")
        if label == "" then
            label = "[No Name]"
        end
        tabline = tabline .. " " .. label .. " "
    end

    return tabline .. "%#TabLineFill#%T"
end

function Tabline(bufnum)
    local s = string.format('buflisted(v:val) && (v:val != %s) && "quickfix" !=? getbufvar(v:val, "&buftype")', bufnum)
    local buffers = vim.fn.filter(vim.fn.range(1, vim.fn.bufnr("$")), s)

    vim.o["tabline"] = render(buffers)
end

api.nvim_exec(
    [[
augroup BufTabLine
au!
au VimEnter  * call v:lua.Tabline(0)
au BufWinEnter  * call v:lua.Tabline(0)
au TabEnter  * call v:lua.Tabline(0)
au BufAdd    * call v:lua.Tabline(0)
au BufDelete * call v:lua.Tabline(expand('<abuf>'))
augroup END
  ]],
    ""
)
