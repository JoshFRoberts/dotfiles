return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            "rafamadriz/friendly-snippets",
            lazy = true,
            event = "InsertEnter",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                vim.api.nvim_set_hl(0, "PmenuSel", { fg = 'NONE', bg = '#272e33' })
                vim.api.nvim_set_hl(0, "Pmenu", { fg = 'NONE', bg = '#1e2326' })
                vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = 'NONE', bg = '#272e33' })
                vim.api.nvim_set_hl(0, "CmpItemMenuDefault", { fg = 'NONE', bg = '#272e33' })
                vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = '#d699b6', bg = 'NONE', italic = true })
                vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = '#dbbc7f', bg = 'NONE', italic = true })
                vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = '#9da9a0', bg = 'NONE', italic = true })
                vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = '#7fbbb3', bg = 'NONE', italic = true })
            end,
        },
    }
}
