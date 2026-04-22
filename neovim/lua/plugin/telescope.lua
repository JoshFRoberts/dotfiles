return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    version = false,
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
          live_grep = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
          current_buffer_fuzzy_find = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
          grep_string = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
          git_files = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
          keymaps = {
            layout_config = {
              prompt_position = 'top',
            },
            sorting_strategy = 'ascending',
          },
        },
      })
    end,
    keys = {
      { "<leader>,",  "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Find Strings in current Buffer" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                     desc = "Grep Content in Files" },
      { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find<cr>",     desc = "Find Strings in current Buffer" },
      { "<leader>fh", "<cmd>Telescope grep_string<cr>",                   desc = "Grep currently hovered String" },
      { "<leader>fG", "<cmd>Telescope git_files<cr>",                     desc = "Find Git Files" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>",                       desc = "List Keymaps" },
    },
  },
}
