local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


return {
  "saghen/blink.cmp",
  build = 'cargo +nightly build --release',
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*", lazy = true, event = "InsertEnter" }
  },
  lazy = true,
  event = "InsertEnter",
  opts = {
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'buffer', 'lsp', 'path', 'snippets'},
      providers = {
        lsp = {
          fallbacks = {} -- enable buffer completions if lsp is available
        }
      }

    },
    fuzzy = { implementation = 'prefer_rust' },
    appearance = {
      nerd_font_variant = 'mono',
      kind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲"
      }
    },
    completion = {
      keyword = {
        range = 'full'
      },
      ghost_text = {
        -- enabled = function(ctx, items) return vim.bo.filetype ~= 'markdown' end,
        enabled = false,
      },
      trigger = {
        show_in_snippet = false,
        show_on_backspace_after_accept = false,
        show_on_backspace_after_insert_enter = false,
        -- show_on_keyword = false,
        show_on_trigger_character = true,
        show_on_accept_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      menu = {
        border = 'rounded',
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:None',
        min_width = 40,
        max_height = 25,

        auto_show = function(ctx, items) return vim.bo.filetype ~= 'markdown' end,

        auto_show_delay_ms = function(ctx, items)
          local ft = vim.bo.filetype
          if ft == 'c' then
            return 850
          elseif ft == 'java' then
            return 0
          else
            return 1500
          end
        end,

        draw = {
          columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
          components = {
            label = {
              highlight = function(ctx)
                -- label and label details
                local highlights = {
                  { 0, #ctx.label, group = ctx.deprecated and 'DiagnosticFloatingWarn' or 'NormalFloator' },
                }
                if ctx.label_detail then
                  table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'NormalFloat' })
                end

                return highlights
              end,
            },
          }
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:CursorLine',
        }
      },
    },
    keymap = {
      ['<C-n>'] = { 'hide', 'show', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<ESC>'] = { 'fallback' },
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          elseif cmp.is_visible() then
            return cmp.select_next()
          elseif has_words_before() then
            return cmp.show({ inital_selected_item_idx = 1 })
          end
        end,
        'snippet_forward',
        'fallback'
      },
      ['<S-Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_prev()
          end
        end,
        'snippet_backward',
        'fallback'
      },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
      }
    },
    cmdline = {
      keymap = {
        preset = 'none',
        ['<cr>'] = { 'accept_and_enter', 'fallback' },
        ['<esc>'] = { 'cancel', 'fallback' },
        ['<Tab>'] = { 'show_and_insert', 'select_next' },
        ['<S-Tab>'] = { 'show_and_insert', 'select_prev' },
        ['<C-n>'] = { 'hide', 'show' },
      },
      completion = {
        menu = {
          auto_show = false,
        }
      },
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
    },
  },
}
