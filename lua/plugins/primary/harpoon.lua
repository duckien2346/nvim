return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    keys = {
        "<A-a>",
        "<A-m>",

        "<A-n>",
        "<A-p>",

        "<A-1>",
        "<A-2>",
        "<A-3>",
        "<A-4>",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end)
        vim.keymap.set("n", "<A-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)
        vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)

        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
    end,
}
