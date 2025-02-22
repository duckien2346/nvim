return {
    "folke/trouble.nvim",
    keys = {
        -- "?" for help
        { KEYS.leader.x.x, "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
        { KEYS.leader.x.q, "<cmd>Trouble quickfix toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
    },
    config = true,
}
