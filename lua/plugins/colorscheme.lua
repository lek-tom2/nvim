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
    
    
  --[[
  {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        require("tokyonight").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = false },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors) end,

            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            on_highlights = function(highlights, colors) end,
            opts = {},
        }),
    }, 
  ]]-- 
  --
  --[[
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {},
            custom_highlights = {},
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }),

        -- setup must be called before loading
        vim.cmd.colorscheme("catppuccin"),
    },
    ]]--
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
    --[[
 {
  "sho-87/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
require('kanagawa-paper').setup({
  undercurl = true,
  transparent = false,
  gutter = false,
  dimInactive = true, -- disabled when transparent
  terminalColors = true,
  commentStyle = { italic = true },
  functionStyle = { italic = false },
  keywordStyle = { italic = false, bold = false },
  statementStyle = { italic = false, bold = false },
  typeStyle = { italic = false },
  colors = { theme = {}, palette = {} }, -- override default palette and theme colors
  overrides = function()  -- override highlight groups
    return {}
  end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa-paper")
}

 ]]
    --
}
