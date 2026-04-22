return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()
        end,
        keys = {
          { "<leader>a", function() require("harpoon"):list():add() end, desc = "" },
          { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "" },
          { "<leader>n", function() require("harpoon"):list():select(1) end, desc = "" },
          { "<leader>e", function() require("harpoon"):list():select(2) end, desc = "" },
          { "<leader>i", function() require("harpoon"):list():select(3) end, desc = "" },
          { "<leader>o", function() require("harpoon"):list():select(4) end, desc = "" },
          { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "" },
          { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "" },
          { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "" },
          { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "" },
          { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "" },
          { "<leader>6", function() require("harpoon"):list():select(6) end, desc = "" },
          { "<leader>7", function() require("harpoon"):list():select(7) end, desc = "" },
          { "<leader>8", function() require("harpoon"):list():select(8) end, desc = "" },
          { "<leader>9", function() require("harpoon"):list():select(9) end, desc = "" },
        },
    }
}
