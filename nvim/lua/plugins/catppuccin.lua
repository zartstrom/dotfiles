return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup {
            -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/editor.lua
            -- CursorColumn = { bg = C.mantle }, -- Screen-column at the cursor, when 'cursorcolumn' is seC.
            -- CursorLine = {
            -- 	bg = O.transparent_background and C.none
            -- 		or U.vary_color({ latte = U.lighten(C.mantle, 0.70, C.base) }, U.darken(C.surface0, 0.64, C.base)),
            -- }, -- Screen-line at the cursor, when 'cursorline' is seC.  Low-priority if forecrust (ctermfg OR guifg) is not seC.
            custom_highlights = function(colors)
                return {
                    -- CursorLine = {bg = colors.base},
                    -- CursorColumn = {bg = colors.bbase}
                    CursorLine = {bg = "#3e4145"},
                    CursorColumn = {bg = "#3e4145"}
                }
            end,
            transparent_background = true
        }
    end
}
