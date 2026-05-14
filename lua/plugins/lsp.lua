return {
  -- tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "rust-analyzer",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        -- "typescript-language-server", -- LazyVim handles TS via typescript.nvim / ts_ls
        -- "css-lsp",                     -- wrong name; use "cssls" if needed
        "clangd",
        "cmake-language-server",
      })
    end,
  },
}