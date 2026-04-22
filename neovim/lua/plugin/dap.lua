return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "igorlfs/nvim-dap-view",
      -- config for "nvim-dap-view"
      opts = {
        winbar = {
          sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
        },
        windows = {
          terminal = {
            hide = { "gdb" },
            start_hidden = true,
          },
        },
        help = {
          border = 'rounded'
        },
        auto_toggle = true
      }
    },
    -- config for "nvim-dap"
    config = function()
      local dap, dv = require("dap"), require("dap-view")
      dap.set_log_level("DEBUG")


      -- signs
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticInfo' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticHint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticError' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticOk' })


      -- autocmds
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "dap-float",
        callback = function(e)
          local opts = { buffer = e.buf, silent = true }
          vim.keymap.set('n', '<esc>', '<cmd>close!<cr>', opts)
          vim.keymap.set('n', '<F11>', '<cmd>close!<cr>', opts)
        end,
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.bo.ft == "dap-view" then
            vim.cmd "quit"
          end
        end,
      })
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.bo.ft == "dap-view-term" then
            vim.cmd "quit"
          end
        end,
      })


      -- keymaps
      vim.keymap.set("n", "<M-Space>c", dap.run_to_cursor, { desc = "Debug: Run debugger up to current curser position" })
      vim.keymap.set("n", "<M-Space>n", dap.step_over, { desc = "Debug: Step Over (Next)" })
      vim.keymap.set("n", "<M-Space>i", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<M-Space>o", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<M-Space>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<M-Space>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        { desc = "Debug: Breakpoint with condition" })
      vim.keymap.set("n", "<M-Space>C", dap.clear_breakpoints, { desc = "Debug: Clear all Breakpoints" })
      vim.keymap.set("n", "<M-Space>v", "<cmd>DapViewToggle<cr>", { desc = "Debug: Toggle Debug View" })
      vim.keymap.set("n", "<M-Space>d", function()
        if dap.session() == nil then
          dap.continue()
        else
          dap.restart()
        end
      end, { desc = "Debug: (Re)start session" })
      vim.keymap.set("n", "<M-Space>h", function() require("dap.ui.widgets").hover('<cexpr>', { border = 'rounded' }) end,
        { desc = "Debug: Toggle evaluation hover" })
      vim.keymap.set("n", "<M-Space>s",
        function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = 'rounded' }) end,
        { desc = "Debug: Show Variables in current Scope" })
      vim.keymap.set("n", "<M-Space>t", dap.terminate, { desc = "Debug: Stop Session" })

      vim.keymap.set("n", "<F2>", dap.clear_breakpoints, { desc = "Debug: Clear all Breakpoints" })
      vim.keymap.set("n", "<F3>", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        { desc = "Debug: Breakpoint with condition" })
      vim.keymap.set('n', '<F4>',
        function()
          local condition = vim.fn.input("Breakpoint condition (optional): ")
          local hit_condition = vim.fn.input("Hit count (optional): ")
          local log_msg = vim.fn.input("Log Message (optional): ")

          -- Convert empty strings to nil
          condition = condition ~= "" and condition or nil
          hit_condition = hit_condition ~= "" and hit_condition or nil
          log_msg = log_msg ~= "" and log_msg or nil

          require("dap").set_breakpoint(condition, hit_condition, log_msg)
        end,
        { desc = "Debug: Advanced Breakpoint" })
      vim.keymap.set("n", "<F5>", function()
        if dap.session() == nil then
          dap.continue()
        else
          dap.restart()
        end
      end, { desc = "Debug: Restart" })
      vim.keymap.set("n", "<F6>", dap.terminate, { desc = "Debug: Stop Session" })
      vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Debug: Step Out" })
      vim.keymap.set("n", "<F8>", dap.step_into, { desc = "Debug: Step Into" })
      vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug: Step Over (Next)" })
      vim.keymap.set("n", "<F10>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
      vim.keymap.set("n", "<F11>", function() require("dap.ui.widgets").hover('<cexpr>', { border = 'rounded' }) end,
        { desc = "Debug: Toggle evaluation hover" })
      vim.keymap.set("n", "<F12>", "<cmd>DapViewToggle<cr>", { desc = "Debug: Toggle Debug View" })


      -- auto open / close
      dap.listeners.before.attach["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.event_terminated["dap-view-config"] = function()
        dv.close()
      end
      dap.listeners.before.event_exited["dap-view-config"] = function()
        dv.close()
      end

      -- gdb settings
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--quiet", "--interpreter=dap", "--eval-command", "set print pretty on" }
      }

      -- for selecting executable with telescope
      local pickers = require("telescope.pickers")
      local finders = require("telescope.finders")
      local conf = require("telescope.config").values
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")


      -- config for c
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return coroutine.create(function(coro)
              local opts = {}
              pickers
                  .new(opts, {
                    prompt_title = "Path to executable",
                    finder = finders.new_oneshot_job({ "fd", "--no-ignore", "--type", "x" }, {}),
                    sorter = conf.generic_sorter(opts),
                    attach_mappings = function(buffer_number)
                      actions.select_default:replace(function()
                        actions.close(buffer_number)
                        coroutine.resume(coro, action_state.get_selected_entry()[1])
                      end)
                      return true
                    end,
                  })
                  :find()
            end)
          end,

          -- program = function()
          --   local path = vim.fn.input({
          --     prompt = 'Path to executable: ',
          --     default = vim.fn.getcwd() .. '/',
          --     completion = 'file',
          --   })
          --   return (path and path ~= '') and path or dap.ABORT
          -- end,

          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = 'Launch with arguments',
          type = 'gdb',
          request = 'launch',
          -- This requires special handling of 'run_last', see
          -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355

          program = function()
            return coroutine.create(function(coro)
              local opts = {}
              pickers
                  .new(opts, {
                    prompt_title = "Path to executable",
                    finder = finders.new_oneshot_job({ "fd", "--no-ignore", "--type", "x" }, {}),
                    sorter = conf.generic_sorter(opts),
                    attach_mappings = function(buffer_number)
                      actions.select_default:replace(function()
                        actions.close(buffer_number)
                        coroutine.resume(coro, action_state.get_selected_entry()[1])
                      end)
                      return true
                    end,
                  })
                  :find()
            end)
          end,
          -- program = function()
          --   local path = vim.fn.input({
          --     prompt = 'Path to executable: ',
          --     default = vim.fn.getcwd() .. '/',
          --     completion = 'file',
          --   })
          --   return (path and path ~= '') and path or dap.ABORT
          -- end,
          args = function()
            local args_str = vim.fn.input({
              prompt = 'Arguments: ',
            })
            return vim.split(args_str, ' +')
          end,
        },
        {
          name = "Select and attach to process",
          type = "gdb",
          request = "attach",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
          end,
          cwd = '${workspaceFolder}'
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'gdb',
          request = 'attach',
          target = 'localhost:1234',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}'
        },
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim", -- autoconfigure adapters
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup({})
      require('mason-nvim-dap').setup({
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      'mfussenegger/nvim-dap',
      "neovim/nvim-lspconfig",
    },
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("nvim-dap-virtual-text").setup({
        only_first_definition = false,
        all_references = true,
        virt_text_pos = 'eol',
        highlight_changed_variables = true,
        enabled_commands = true,
      })
      vim.keymap.set('n', '<leader>Vt', '<cmd>DapVirtualTextToggle<cr>', {})
    end,
  }
}
