return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_port = "8686"
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 0
        vim.g.mkdp_refresh_slow = 1
        vim.g.mkdp_combine_preview = 1
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
}
