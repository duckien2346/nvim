local codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = {
                "",
                "quickfix",
                "refactor",
                "refactor.extract",
                "refactor.inline",
                "refactor.rewrite",
                "source",
                "source.organizeImports",
            },
        },
    },
}

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        LIST_LSPCONFIG["omnisharp"] and "Hoffs/omnisharp-extended-lsp.nvim" or nil,
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("lspconfig.ui.windows").default_options.border = "double"
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.codeAction = codeAction
        lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            on_attach = require("plugins.lsp.lspconfig.on_attach"),
            capabilities = capabilities,
            handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            },
        })

        for k, v in pairs(LIST_LSPCONFIG) do
            lspconfig[k].setup(v)
        end
    end,
}
