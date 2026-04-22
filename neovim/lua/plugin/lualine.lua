return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      vim.api.nvim_set_option("showmode", false)
      local custom_gruvbox = require 'lualine.themes.gruvbox-material'
      custom_gruvbox.normal.a.bg = '#89b482'
      custom_gruvbox.normal.c.bg = ''
      custom_gruvbox.insert.a.bg = '#d8a657'
      custom_gruvbox.visual.a.bg = '#a9b665'
      custom_gruvbox.replace.a.bg = '#ea6962'

      require('lualine').setup {
        options = {
          theme = custom_gruvbox,
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'netrw', 'Trouble' },
        },
        sections = {
          lualine_a = {
            {
              'mode',
              padding = 1,
            }
          },
          lualine_b = {
            {
              'branch',
              icon = '',
              color = { fg = '#d8a657', bg = '#141617', gui = 'bold' },
              padding = 1,
            },
          },
          lualine_c = {
            {
              'filename',
              color = { gui = 'italic', fg = '#d3869b', bg = '#1d2021' },
              padding = 1,
              path = 1,
            },
          },
          lualine_x = {
            {
              'filetype',
              color = { bg = '#1d2021', fg = '#d4be98', gui = 'italic' },
              padding = 1,
              fmt = function(str)
                return (str:gsub("^%l", string.upper))
              end,
            },
            {
              'fileformat',
              color = { gui = 'italic', bg = '#141617' },
              symbols = {
                unix = '(unix)',
                dos = '(dos)',
                mac = '(mac)',
              },
            }

          },
          lualine_y = {
            {
              'diagnostics',
              color = { gui = 'bold', bg = '#141617' },
              sections = { 'error', 'warn', 'info', 'hint' },
              symbols = { error = "✘ ", warn = " ", info = " ", hint = " " },
              padding = 1,
              update_in_insert = true
            },
            {
              'diff',
              icon = { ' ', color = { bg = '#141617', fg = '#d8a657', gui = 'bold' } },
              color = { gui = 'bold', bg = '#141617' },
              padding = 1,
            }
          },
          lualine_z = {
            {
              'location',
              padding = 1,
            }
          }
        },
        inactive_sections = {
          lualine_a = {
            {
              'mode',
              padding = 1,
            }
          },
          lualine_b = {
            {
              'branch',
              icon = '',
              padding = 1,
            },
          },
          lualine_c = {
            {
              'filename',
              padding = 1,
              path = 1,
            }
          },
          lualine_x = {
            {
              'filetype',
              color = { gui = 'italic' },
              padding = 1,
              fmt = function(str)
                return (str:gsub("^%l", string.upper))
              end,
            },
            {
              'fileformat',
              color = { gui = 'italic' },
              symbols = {
                unix = 'Unix',
                dos = 'Dos',
                mac = 'Mac',
              },
            },
          },
          lualine_y = {
            {
              'diagnostics',
              color = { gui = 'bold', bg = '#141617' },
              sections = { 'error', 'warn', 'info', 'hint' },
              symbols = { error = "✘ ", warn = " ", info = " ", hint = "󰌶 " },
              padding = 1,
              update_in_insert = true
            },
            {
              'diff',
              icon = { ' ', color = { bg = '#141617', gui = 'bold' } },
              color = { gui = 'bold', bg = '#141617' },
              padding = 1,
            }
          },
          lualine_z = {
            {
              'location',
              padding = 1,
            },
          }
        },
      }
    end,
  },
}
