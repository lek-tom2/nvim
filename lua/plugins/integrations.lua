return {
    {
        "rest-nvim/rest.nvim",
        ft = "http",
        build = false,
        keys = {
            { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run REST request" },
            { "<leader>rl", "<cmd>Rest run last<cr>", desc = "Re-run last REST request" },
        },
    },
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        keys = {
            { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
        },
    },
}
