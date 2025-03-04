-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "dart",
        "javascript*", -- "javascriptreact",
        "typescript*", -- "typescriptreact",
        "json",
        "yaml",
        "toml",
        "tex",
        "bib",
        "markdown",
        "http",
    },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
    end,
})

-- line wrapping
vim.opt.wrap = false
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "tex",
        "bib",
    },
    callback = function()
        vim.opt.wrap = true
        vim.opt.linebreak = true
        vim.opt.breakindent = true
        local config = { silent = true, expr = true, remap = true }
        vim.keymap.set({ "n", "v" }, "j", "v:count ? 'j' : 'gj'", config)
        vim.keymap.set({ "n", "v" }, "k", "v:count ? 'k' : 'gk'", config)
    end,
})

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.cmd("au VimLeave * set guicursor=a:hor20-Cursor/lCursor-blinkon0")

-- appearance
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 80
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight NormalFloat guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalFloat ctermbg=none
]])

-- backspace
vim.opt.backspace = "indent,eol,start"

-- listchars
vim.opt.list = true
vim.opt.listchars = {
    tab = "▸ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    leadmultispace = ".",
}

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- add keywords
vim.opt.iskeyword:append("-")
vim.opt.isfname:append("@-@")

-- fold
vim.opt.foldenable = false -- auto folden
vim.opt.foldmethod = "indent" -- indent syntax

-- netrw
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })")

-- shell
if MY_OS.isWindows() then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-command"
    vim.opt.shellquote = '"'
    vim.opt.shellxquote = ""
end

-- vifm
vim.filetype.add({
    extension = {
        ["vifm"] = "vim",
    },
})
