local vim = vim
local api = vim.api
local M = {}

local mycolors = {
    myrust = {
        fg            = "#c5c8c6",
        bg            = "#262626",
        cursor_fg     = "#000000",
        cursor_bg     = "#ffffff",
        float         = "#4d4d4d",
        bg_dimmer     = "#333333",
        tabline       = "#4d4d4d",
        constant      = "#83A300",
        func          = "#8eabbe",
        func2          = "#769acb",
        menu          = "#0099cc",
        errormsg      = "#e09185",
        warningmsg    = "#d6ab62",
        keyword       = "#ab8ab7",
        string        = "#89b482",
        comment       = "#8d8d8d",
        linenr        = "#4b4c4e",
        incsearch     = "#ef7e04",
        search        = "#fac863",
        cursorline    = "#333333",
        diff_delete   = "#ff9999",
        diff_add      = "#398c6f",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#c5c8c6",
        statusline_fg = "#000000",
        statusline_nc = "#707070",
        visual        = "#90b0f4",
        fzf_bg        = "#4d4d4d",
        fzf_fg        = "#ffffff"
    },
    myrust2 = {
        fg            = "#c5c8c6",
        bg            = "#1a1a1a",
        cursor_fg     = "#000000",
        cursor_bg     = "#ffffff",
        float         = "#4d4d4d",
        bg_dimmer     = "#333333",
        tabline       = "#4d4d4d",
        constant      = "#83A300",
        func          = "#8eabbe",
        func2          = "#769acb",
        menu          = "#0099cc",
        errormsg      = "#e09185",
        warningmsg    = "#d6ab62",
        keyword       = "#ab8ab7",
        string        = "#89b482",
        comment       = "#8d8d8d",
        linenr        = "#4b4c4e",
        incsearch     = "#ef7e04",
        search        = "#fac863",
        cursorline    = "#333333",
        diff_delete   = "#ff9999",
        diff_add      = "#398c6f",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#c5c8c6",
        statusline_fg = "#000000",
        statusline_nc = "#707070",
        visual        = "#90b0f4",
        fzf_bg        = "#4d4d4d",
        fzf_fg        = "#ffffff"
    },
    mysolarized = {
        fg            = "#93a1a1",
        bg            = "#002b36",
        cursor_fg     = "#000000",
        cursor_bg     = "#ffffff",
        float         = "#073642",
        bg_dimmer     = "#334854",
        tabline       = "#073642",
        constant      = "#2aa198",
        func          = "#268bd2",
        menu          = "#0099cc",
        errormsg      = "#e09185",
        warningmsg    = "#d6ab62",
        keyword       = "#859900",
        string        = "#2aa198",
        comment       = "#65737e",
        linenr        = "#65737e",
        incsearch     = "#ef7e04",
        search        = "#fac863",
        cursorline    = "#073642",
        diff_delete   = "#ff9999",
        diff_add      = "#398c6f",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#93a1a1",
        statusline_fg = "#000000",
        statusline_nc = "#003d4d",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    myocean = {
        fg            = "#c0c5ce",
        bg            = "#1b2b34",
        cursor_fg     = "#000000",
        cursor_bg     = "#ffffff",
        float         = "#27363f",
        bg_dimmer     = "#334854",
        tabline       = "#334854",
        constant      = "#62b3b2",
        func          = "#6699cc",
        menu          = "#6699cc",
        errormsg      = "#d67162",
        warningmsg    = "#d6ab62",
        keyword       = "#c594c5",
        string        = "#99c794",
        comment       = "#65737e",
        linenr        = "#2b4554",
        incsearch     = "#ef7e04",
        search        = "#fac863",
        cursorline    = "#233743",
        diff_delete   = "#d67162",
        diff_add      = "#99c794",
        diff_change   = "#d6ab62",
        diff_text     = "#90b0f4",
        statusline_bg = "#c5cad3",
        statusline_fg = "#333333",
        statusline_nc = "#2b4554",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    mygithub = {
        fg            = "#24292e",
        bg            = "#fafbfc",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#f3f3f3",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#f7f7f7",
        constant      = "#005cc5",
        func          = "#6F42C1",
        menu          = "#0099cc",
        errormsg      = "#e8192e",
        warningmsg    = "#ef7e04",
        keyword       = "#D73A49",
        string        = "green",
        comment       = "#6A737D",
        linenr        = "#BABBBD",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#F3F3F3",
        diff_delete   = "#ff9999",
        diff_add      = "#ccffcc",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#454545",
        statusline_fg = "#ffffff",
        statusline_nc = "#aaaaaa",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    mygithub2 = {
        fg            = "#24292e",
        bg            = "#f6f8fa",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#f3f3f3",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#f7f7f7",
        constant      = "#005cc5",
        func          = "#6F42C1",
        menu          = "#0099cc",
        errormsg      = "#e8192e",
        warningmsg    = "#ef7e04",
        keyword       = "#D73A49",
        string        = "green",
        comment       = "#6A737D",
        linenr        = "#BABBBD",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#e8edf2",
        diff_delete   = "#ff9999",
        diff_add      = "#ccffcc",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#3f5973",
        statusline_fg = "#ffffff",
        statusline_nc = "#bdcddb",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    mygithub3 = {
        fg            = "#24292e",
        bg            = "#eff2f6",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#ebeff4",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#bdcddb",
        constant      = "#005cc5",
        func          = "#4b2b88",
        menu          = "#0099cc",
        errormsg      = "#e8192e",
        warningmsg    = "#ef7e04",
        keyword       = "#D73A49",
        string        = "green",
        comment       = "#6A737D",
        linenr        = "#BABBBD",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#C7CCD0",
        diff_delete   = "#ff9999",
        diff_add      = "#ccffcc",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#364d63",
        statusline_fg = "#ffffff",
        statusline_nc = "#afb6b6",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    mygithub4 = {
        fg            = "#24292e",
        bg            = "#e6eaef",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#D4D8DE",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#bdcddb",
        constant      = "#005cc5",
        func          = "#4b2b88",
        menu          = "#0099cc",
        errormsg      = "#e8192e",
        warningmsg    = "#ef7e04",
        keyword       = "#D73A49",
        string        = "green",
        comment       = "#6A737D",
        linenr        = "#BABBBD",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#D8E2ED",
        diff_delete   = "#ff9999",
        diff_add      = "#ccffcc",
        diff_change   = "#ffff1a",
        diff_text     = "#F4AF5F",
        statusline_bg = "#364d63",
        statusline_fg = "#ffffff",
        statusline_nc = "#c1cbd7",
        visual        = "#90b0f4",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    myautumn= {
        fg            = "#000000",
        bg            = "#e1e1d0",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#d8d8c0",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#DBDBC6",
        constant      = "#005cc5",
        func          = "#4f3281",
        menu          = "#DBDBC6",
        errormsg      = "#e8192e",
        warningmsg    = "#e27603",
        keyword       = "#BD2636",
        string        = "#006B00",
        comment       = "#6A737D",
        linenr        = "#B8B8A6",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#D9D9C7",
        diff_delete   = "#e8192e",
        diff_add      = "#29A146",
        diff_change   = "#F5F519",
        diff_text     = "#202429",
        statusline_bg = "#5f5853",
        statusline_fg = "#eeeeee",
        statusline_nc = "#b8b1ad",
        visual        = "#B0B09F",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    myautumn1= {
        fg            = "#000000",
        bg            = "#D9D9C4",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#C9C9A6",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#CACAB5",
        constant      = "#005cc5",
        func          = "#4f3281",
        menu          = "#C9C9A6",
        errormsg      = "#e8192e",
        warningmsg    = "#e27603",
        keyword       = "#BD2636",
        string        = "#006B00",
        comment       = "#6A737D",
        linenr        = "#B8B8A6",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#D1D1BD",
        diff_delete   = "#e8192e",
        diff_add      = "#29A146",
        diff_change   = "#F5F519",
        diff_text     = "#202429",
        statusline_bg = "#5f5853",
        statusline_fg = "#eeeeee",
        statusline_nc = "#b8b1ad",
        visual        = "#B0B09F",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    },
    myautumn2= {
        fg            = "#1C1F24",
        bg            = "#CCCCB8",
        cursor_fg     = "#ffffff",
        cursor_bg     = "#000000",
        float         = "#DBDBC6",
        bg_dimmer     = "#d9d9d9",
        tabline       = "#DBDBC6",
        constant      = "#005cc5",
        func          = "#4f3281",
        menu          = "#DBDBC6",
        errormsg      = "#e8192e",
        warningmsg    = "#e27603",
        keyword       = "#BD2636",
        string        = "#006B00",
        comment       = "#808073",
        linenr        = "#A2A290",
        incsearch     = "#ff661a",
        search        = "#f2ba40",
        cursorline    = "#C4C4B1",
        diff_delete   = "#e8192e",
        diff_add      = "#29A146",
        diff_change   = "#F5F519",
        diff_text     = "#202429",
        statusline_bg = "#5f5853",
        statusline_fg = "#eeeeee",
        statusline_nc = "#b8b1ad",
        visual        = "#B0B09F",
        fzf_bg        = "#f2ba40",
        fzf_fg        = "#000000"
    }
}

local groups = {
    {name = "Normal", fg = "fg", bg = "bg", gui = ""},
    {name = "NormalFloat", fg = "fg", bg = "float", gui = ""},
    {name = "Folded", fg = "comment", bg = "float", gui = ""},
    {name = "VertSplit", fg = "statusline_bg", bg = "bg", gui = "none"},
    {name = "CursorLine", fg = "", bg = "cursorline", gui = "none"},
    {name = "CursorLineNr", fg = "fg", bg = "cursorline", gui = "none"},
    {name = "CursorColumn", fg = "", bg = "linenr", gui = ""},
    {name = "FZF", fg = "fzf_fg", bg = "fzf_bg", gui = "none"},
    {name = "TabLine", fg = "comment", bg = "tabline", gui = "none"},
    {name = "TabLineFill", fg = "comment", bg = "tabline", gui = "none"},
    {name = "TabLineSel", fg = "fg", bg = "bg", gui = "none"},
    {name = "MatchParen", fg = "bg", bg = "visual", gui = ""},
    {name = "NonText", fg = "linenr", bg = "bg", gui = ""},
    {name = "SpecialKey", fg = "linenr", bg = "bg", gui = ""},
    {name = "Visual",  bg = "visual", gui = ""},
    {name = "VisualNOS", fg = "bg", bg = "visual", gui = ""},
    {name = "Search", fg = "fg", bg = "search", gui = "none"},
    {name = "IncSearch", fg ="fg", bg = "incsearch", gui = "none"},
    {name = "Underlined", fg = "fg", bg = "", gui = "underline"},
    {name = "StatusLine", fg = "statusline_fg", bg = "statusline_bg", gui = "none"},
    {name = "StatusLineNC", fg = "comment", bg = "statusline_nc", gui = "none"},
    {name = "Directory", fg = "func", bg = "", gui = ""},
    {name = "Title", fg = "constant", bg = "", gui = ""},
    {name = "ErrorMsg", fg = "cursor_fg", bg = "errormsg", gui = ""},
    {name = "WarningMsg", fg = "cursor_fg", bg = "warningmsg", gui = ""},
    {name = "MoreMsg", fg = "cursor_fg", bg = "warningmsg", gui = ""},
    {name = "ModeMsg", fg = "cursor_fg", bg = "errormsg", gui = ""},
    {name = "Question", fg = "cursor_fg", bg = "errormsg", gui = ""},
    {name = "NetrwTreeBar", fg = "bg_dimmer", bg = "", gui = "none"},
    {name = "Tag", fg = "", bg = "", gui = "bold"},
    {name = "LineNr", fg = "linenr", bg = "bg", gui = ""},
    {name = "SignColumn", fg = "", bg = "bg", gui = ""},
    {name = "FoldColumn", fg = "linenr", bg = "bg", gui = ""},
    {name = "Cursor", fg = "cursor_fg", bg = "incsearch", gui = "none"},
    {name = "Special", fg = "fg", bg = "", gui = ""},
    {name = "Comment", fg = "comment", bg = "", gui = ""},
    {name = "String", fg = "string", bg = "", gui = ""},
    {name = "Statement", fg = "fg", bg = "", gui = ""},
    {name = "Keyword", fg = "keyword", bg = "", gui = ""},
    {name = "Conditional", fg = "keyword", bg = "", gui = ""},
    {name = "Operator", fg = "fg", bg = "", gui = ""},
    {name = "Label", fg = "fg", bg = "", gui = ""},
    {name = "Repeat", fg = "keyword", bg = "", gui = ""},
    {name = "Todo", fg = "constant", bg = "bg", gui = ""},
    {name = "SpecialComment", fg = "constant", bg = "bg", gui = ""},
    {name = "Identifier", fg = "fg", bg = "", gui = "none"},
    {name = "function", fg = "func", bg = "", gui = "none"},
    {name = "PreProc", fg = "errormsg", bg = "", gui = "none"},
    {name = "Macro", fg = "func", bg = "", gui = "none"},
    {name = "Define", fg = "errormsg", bg = "", gui = "none"},
    {name = "PreCondit", fg = "errormsg", bg = "", gui = "none"},
    {name = "Type", fg = "fg", bg = "", gui = "none"},
    {name = "Constant", fg = "constant", bg = "", gui = ""},
    {name = "Character", fg = "constant", bg = "", gui = ""},
    {name = "Boolean", fg = "constant", bg = "", gui = ""},
    {name = "Number", fg = "constant", bg = "", gui = ""},
    {name = "Float", fg = "constant", bg = "", gui = ""},
    {name = "SpecialChar", fg = "constant", bg = "", gui = ""},
    {name = "StorageClass", fg = "constant", bg = "", gui = ""},
    {name = "Structure", fg = "constant", bg = "", gui = ""},
    {name = "Typedef", fg = "constant", bg = "", gui = ""},
    {name = "Exception", fg = "errormsg", bg = "", gui = ""},
    {name = "Error", fg = "White", bg = "errormsg", gui = ""},
    {name = "Debug", fg = "errormsg", bg = "", gui = ""},
    {name = "Ignore", fg = "comment", bg = "", gui = ""},
    {name = "Pmenu", fg = "fg", bg = "tabline", gui = ""},
    {name = "PmenuSel", fg = "fg", bg = "search", gui = ""},
    {name = "PmenuSbar", fg = "", bg = "bg_dimmer", gui = ""},
    {name = "PmenuThumb", fg = "", bg = "constant", gui = ""},
    {name = "DiffDelete", fg = "fg", bg = "diff_delete", gui = ""},
    {name = "DiffAdd", fg = "fg", bg = "diff_add", gui = ""},
    {name = "DiffChange", fg = "fg", bg = "diff_change", gui = ""},
    {name = "DiffText", fg = "bg", bg = "diff_text", gui = ""},
    {name = "SpellCap", fg = "errormsg", bg = "bg", gui = "undercurl"},
    {name = "SpellBad", fg = "", bg = "bg", gui = "undercurl"},
    {name = "SpellLocal", fg = "", bg = "", gui = "undercurl"},
    {name = "SpellRare", fg = "", bg = "", gui = "undercurl"},
    {name = "vimCommand", fg = "keyword", bg = "", gui = ""},
    {name = "vimIsCommand", fg = "constant", bg = "", gui = ""},
    {name = "vimNotFunc", fg = "keyword", bg = "", gui = ""},
    {name = "vimLet", fg = "keyword", bg = "", gui = ""},
    {name = "vimUserFunc", fg = "func", bg = "", gui = ""},
    {name = "vimParenSep", fg = "fg", bg = "", gui = ""},
    {name = "vimOption", fg = "constant", bg = "", gui = ""},
    {name = "vimSet", fg = "constant", bg = "", gui = ""},
    {name = "jsVariableDef", fg = "fg", bg = "", gui = ""},
    {name = "jsGlobalNodeObjects", fg = "constant", bg = "", gui = ""},
    {name = "jsThis", fg = "constant", bg = "", gui = ""},
    {name = "jsThis", fg = "constant", bg = "", gui = ""},
    {name = "jsStorageClass", fg = "errormsg", bg = "", gui = ""},
    {name = "jsImport", fg = "errormsg", bg = "", gui = ""},
    {name = "jsFrom", fg = "errormsg", bg = "", gui = ""},
    {name = "jsModuleAs", fg = "errormsg", bg = "", gui = ""},
    {name = "jsClassDefinition", fg = "func", bg = "", gui = ""},
    {name = "jsDocType", fg = "func", bg = "", gui = ""},
    {name = "jsClassFuncName", fg = "func", bg = "", gui = ""},
    {name = "jsFuncCall", fg = "func", bg = "", gui = ""},
    {name = "jsExceptions", fg = "func", bg = "", gui = ""},
    {name = "jsGlobalObjects", fg = "func", bg = "", gui = ""},
    {name = "htmlH1", fg = "keyword", bg = "", gui = ""},
    {name = "htmlH2", fg = "constant", bg = "", gui = ""},
    {name = "htmlH3", fg = "constant", bg = "", gui = ""},
    {name = "htmlH4", fg = "constant", bg = "", gui = ""},
    {name = "htmlH5", fg = "fg", bg = "", gui = ""},
    {name = "htmlH6", fg = "fg", bg = "", gui = ""},
    {name = "htmltagname", fg = "func", bg = "", gui = ""},
    {name = "markdownH1", fg = "fg", bg = "search", gui = ""},
    {name = "markdownH2", fg = "constant", bg = "", gui = ""},
    {name = "markdownH3", fg = "constant", bg = "", gui = ""},
    {name = "markdownH4", fg = "constant", bg = "", gui = ""},
    {name = "mkdURL", fg = "constant", bg = "", gui = ""},
    {name = "mkdLineBreak", fg = "fg", bg = "", gui = ""},
    {name = "mkdHeading", fg = "keyword", bg = "", gui = ""},
    {name = "goType", fg = "errormsg", bg = "", gui = ""},
    {name = "goMethodCall", fg = "constant", bg = "", gui = ""},
    {name = "goFunctionCall", fg = "constant", bg = "", gui = ""},
    {name = "goTypeName", fg = "fg", bg = "", gui = ""},
    {name = "goBlock", fg = "fg", bg = "", gui = ""},
    {name = "goOperator", fg = "fg", bg = "", gui = ""},
    {name = "goField", fg = "fg", bg = "", gui = ""},
    {name = "goTypeName", fg = "fg", bg = "", gui = ""},
    {name = "jsonBraces", fg = "fg", bg = "", gui = ""},
    {name = "jsonKeyword", fg = "string", bg = "", gui = ""},
    {name = "cssTagName", fg = "keyword", bg = "", gui = ""},
    {name = "cssPseudoClassId", fg = "func", bg = "", gui = ""},
    {name = "cssUnitDecorators", fg = "errormsg", bg = "", gui = ""},
    {name = "yamlKey", fg = "keyword", bg = "", gui = ""},
    {name = "LspDiagnosticsError", fg = "errormsg", bg = "", gui = ""},
    {name = "LspDiagnosticsWarning", fg = "warningmsg", bg = "", gui = ""},
    {name = "LspDiagnosticsHint", fg = "linenr", bg = "", gui = ""},
    {name = "LspDiagnosticsInformation", fg = "linenr", bg = "", gui = ""},
    {name = "CocErrorSign", fg = "errormsg", bg = "", gui = ""},
    {name = "CocWarningSign", fg = "warningmsg", bg = "", gui = ""},
    {name = "CocHintSign", fg = "comment", bg = "", gui = ""},
    {name = "CocInfoSign", fg = "comment", bg = "", gui = ""},
    {name = "CocCursorTransparent", fg = "linenr", bg = "", gui = ""},
    {name = "CocCodeLens", fg = "linenr", bg = "", gui = ""},
    {name = "CocRustChainingHint", fg = "linenr", bg = "", gui = ""},
    {name = "TSVariable", fg = "fg", bg = "", gui = ""},
    {name = "easymotiontargetdefault", fg = "errormsg", bg = "", gui = ""},
    {name = "typescriptparens", fg = "fg", bg = "", gui = ""},
    {name = "scalatypeannotation", fg = "fg", bg = "", gui = ""},
    {name = "scalaExternal", fg = "keyword", bg = "", gui = ""},
    {name = "rustquestionmark", fg = "keyword", bg = "", gui = ""},
    {name = "rustmodpath", fg = "fg", bg = "", gui = ""},
    {name = "rustassert", fg = "func", bg = "", gui = ""},
    {name = "luatreerootfolder", fg = "keyword", bg = "", gui = ""}
}

function M.MyColors(color_name)

    local name = color_name or "myautumn"
    -- vim.g.colors_name = name
    vim.cmd("set background=light")
    vim.cmd("syntax reset")

    local color = mycolors[name]
    for _, group in pairs(groups) do
        local s = "silent hi! " .. group["name"]

        local fg = color[group["fg"]]
        if fg then
            s = s .. " guifg=" .. fg
        end

        local bg = color[group["bg"]]
        if bg then
            s = s .. " guibg=" .. bg
        end

        local gui = color[group["gui"]]
        if gui then
            s = s .. " gui=" .. gui
        else
            s = s .. " gui=none"
        end

        vim.cmd(s)
    end
end

api.nvim_exec([[ command! -nargs=1 MySetColor lua require'colors'.MyColors(<q-args>) ]], "")
api.nvim_exec(
    [[ command! -nargs=0 MyColor call fzf#run({"source": ['myrust','myrust2','myrust3', 'myrust4','mysolarized','myocean','mygithub', 'mygithub2', 'mygithub3', 'mygithub4','myautumn', 'myautumn1', 'myautumn2'], "options": '--reverse' ,"sink": "MySetColor"}) ]],
    "")
M.MyColors()

return M
