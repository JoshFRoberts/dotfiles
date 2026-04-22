return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        legacy_commands = false,
        workspaces = {
          {
            name = "notes",
            path = "~/notes",
          },
        },
        completion = {
          nvim_cmp = false,
          blink = true,
          min_chars = 1,
        },
        new_notes_location = "current_dir",
        wiki_link_func = function(opts)
          return require("obsidian.util").wiki_link_id_prefix(opts)
        end,
        preferred_link_style = "wiki",
        note_id_func = function(title)
          return title
        end,
        frontmatter = {
          enabled = false
        },
        attachments = {
          img_folder = "images",
        },
        ui = { enable = false },
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function(note)
          vim.keymap.set("n", "<Space>Op", "<cmd>Obsidian paste_img<cr>", { buffer = note.bufnr, desc = "Paste Image" })
          vim.keymap.set("n", "<Space>fn", "<cmd>Obsidian search<cr>", { buffer = note.bufnr, desc = "Find Notes" })
          vim.keymap.set("n", "<Space>bl", "<cmd>Obsidian backlinks<cr>",
            { buffer = note.bufnr, desc = "Search Backlinks" })
        end,
      })
    end,
  }
}
