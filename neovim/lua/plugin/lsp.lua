return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "nvim-telescope/telescope-ui-select.nvim",
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
      "stevearc/conform.nvim",
      "zapling/mason-conform.nvim",
      -- "nvimtools/none-ls.nvim", -- fallback
      -- "jay-babu/mason-null-ls.nvim", --fallback
    },
    config = function()
      -- setup --

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

      -- mason --

      require("mason").setup({
        PATH = "append",
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✘"
          }
        }
      })

      -- mason lspconfig --

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "rust_analyzer",
        },
        automatic_enable = {
          exclude = {
            "jdtls",
          }
        },
        handlers = {
          -- The first entry (without a key) will be the default handler
          -- and will be called for each installed server that doesn't have
          -- a dedicated handler.
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,
          clangd = function()
            require("lspconfig").clangd.setup {
              capabilities = capabilities,
              on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
            }
          end,
        }
      })

      -- telescope ui for filter selection in mason

      require("telescope").setup({ extensions = { ["ui-select"] = {} } })
      require("telescope").load_extension("ui-select")

      -- -- null-ls (none-ls)
      --
      -- local null_ls = require('null-ls')
      -- require("null-ls").setup({
      --   sources = {
      --     null_ls.builtins.formatting.clang_format.with({
      --       -- extra_args = { "-style={BasedOnStyle: llvm, IndentWidth: 2, BreakBeforeBraces: Linux, ColumnLimit: 0}" }
      --       extra_args = { "-style=file" }
      --     })
      --   },
      -- })

      -- better formatting -> use 'conform' instead of null-ls

      require("conform").setup({
        formatters_by_ft = {
          c = { "clang-format" },
          cpp = { "clang-format" },
          go = { "gofmt" },
          java = { "clang-format" },
          -- javascript = { "prettier" },
          -- typescript = { "prettier" },
          elixir = { "mix" },
          yaml = { "yamlfmt" },
          typst = { "typstyle" },
        },
        formatters = {
          ["clang-format"] = {
            prepend_args = { "-style=file" },
          },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      })

      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup
      local custom_augroup = augroup('custom_augroup_format', {})

      autocmd("LspAttach", {
        group = custom_augroup,

        callback = function()
          vim.keymap.set("n", "<leader>cf", function()
            require("conform").format({ async = true })
          end)
          vim.keymap.set("v", "<leader>cf", function()
            require("conform").format({ async = true })
          end)
        end,
      }
      )

      -- use mason to manage conforms formatters

      require("mason-conform").setup({})

      -- config --

      vim.diagnostic.config({
        update_in_insert = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘ ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " "
          },
          priority = 5
        },
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
        virtual_text = {
          prefix = '', -- Could be '●', '■', 'x', '▎', or anything else
          -- virt_text_pos = 'eol_right_align',
          virt_text_pos = 'eol',
        },
      })
    end,
  }
}
