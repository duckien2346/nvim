return function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    if not client.config.single_file_support then
        vim.api.nvim_set_current_dir(client.config.root_dir)
    end

    -- set keybinds
    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", KEYS.g.d, function()
        vim.cmd([[Telescope lsp_definitions]])
    end, opts)
    opts.desc = "Go to declaration"
    vim.keymap.set("n", KEYS.g.D, vim.lsp.buf.declaration, opts)
    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", KEYS.g.i, function()
        vim.cmd([[Telescope lsp_implementations]])
    end, opts)
    opts.desc = "Show LSP references"
    vim.keymap.set("n", KEYS.g.r, function()
        vim.cmd([[Telescope lsp_references]])
    end, opts)
    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", KEYS.g.t, function()
        vim.cmd([[Telescope lsp_type_definitions]])
    end, opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, KEYS.leader.c.a, vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", KEYS.K, vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    opts.desc = "Smart rename"
    vim.keymap.set("n", KEYS.leader.r.n, vim.lsp.buf.rename, opts) -- smart rename
    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", KEYS.leader.d.i, vim.diagnostic.open_float, opts) -- show diagnostics for line
    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", KEYS.lbracket.d, vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", KEYS.rbracket.d, vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    -- omnisharp_extended
    if client.name == "omnisharp" then
        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", KEYS.g.d, function()
            require("omnisharp_extended").telescope_lsp_definition()
        end, opts)
        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", KEYS.g.i, function()
            require("omnisharp_extended").telescope_lsp_implementation()
        end, opts)
        opts.desc = "Show LSP references"
        vim.keymap.set("n", KEYS.g.r, function()
            require("omnisharp_extended").telescope_lsp_references()
        end, opts)
        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", KEYS.g.t, function()
            require("omnisharp_extended").telescope_lsp_type_definition()
        end, opts)
    end
end
