return {
    --[[
    {
        "sainnhe/sonokai",
        priority = 1000,
        config = function()
            vim.g.sonokai_transparent_background = "1"
            vim.g.sonokai_enable_italic = "1"
            vim.g.sonokai_style = "andromeda"
            vim.cmd.colorscheme("sonokai")
        end,
    },
    ]]
    --[[
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd.colorscheme("gruvbox")
        end,
        opts = ...,
    },
    ]]
    --

    {
        "oskarnurm/koda.nvim",
        lazy = true, -- keep as fallback but don't auto-load
    },
    --[[
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- your configuration comes here
            -- or leave it empty to use the default settings
            transparent = false, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
            borders = true, -- Enable the border between vertically split windows visible
            errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                                      -- values : [bg|fg|none]
            search = { theme = "vim" }, -- theme for highlighting search results
                                        -- values : [vim|vscode]
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = {},
                functions = {},
                variables = {},

                -- To customize lualine/bufferline
                bufferline = {
                    current = {},
                    modified = { italic = true },
                },
            },

            -- colorblind mode
            -- see https://github.com/EdenEast/nightfox.nvim#colorblind
            -- simulation mode has not been implemented yet.
            colorblind = {
                enable = false,
                preserve_background = false,
                severity = {
                    protan = 0.0,
                    deutan = 0.0,
                    tritan = 0.0,
                },
            }

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with all highlights and the colorScheme table
            on_highlights = function(highlights, colors) end,
            vim.cmd.colorscheme("nord")
        end,
    },
    install = {
        colorscheme = { "nord" },
    },
  ]]
    --
}
