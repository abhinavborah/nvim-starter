return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right" },
    },
  },

  -- notifications
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- globalstatus = false,
        theme = "gruvbox",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    -- dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      -- local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            -- InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            -- InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
            InclineNormal = { guibg = "#f2e5bc", guifg = "#282828" },
            InclineNormalNC = { guifg = "#d79921", guibg = "#282828" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- logo
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },

      dashboard = {
        enabled = true,
        preset = {
          header = {
            [[
  ███████████████░▄▀░░░░░░░░░░▄▀▀▄▀▄░████████████████████
  █████████████░▄▀░░░░░░░░░░▄▀  ██▄▀▄░███████████████████
  ████████████░▄▀░░▄▀▀▀▄░░░░█   ▀▀ █▀▄░██████████████████
  ████████████▌█░░█▄    █░░░▀▄     ▐░▌░██████████████████
  ███████████░▐▌░░█▀   ▄▀░░░░░▀▄▄▄▄▀░░▌░█████████████████
  ███████████░▐▌░░█   ▄▀░░░░░░░░░░░░░░▌░█████████████████
  ███████████░▐▌░░░▀▀▀░░░░░░░░░░░░░░░░▐░█████████████████
  ███████████░▐▌░░░░░░░░░▄░░░░░█░░░░░░▐▌█████████████████
  ████████████░█░░░░░░░░░▀█▄░░▄█░░░░░▐▌████ [borah]'s ███
  █████████████▐▌░░░░░░░░░░▀▀▀▀░░░░░▐░█████ LazyVim   ███
  ██████████████▐░░░░░░░░░░░░░░░░░░▐░████████████████████
        ]],
          },
        },

        sections = {
          {
            { section = "header", padding = { 2, 1, 2, 1 } },
            { section = "keys" },
            { section = "startup" },
          },
          {
            pane = 2,
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 1 } },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = { 1, 1 } },
          },
        },
      },
      notifier = {
        enabled = true,
        timeout = 5000,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
