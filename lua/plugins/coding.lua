return {
  -- multicursor
  { "mg979/vim-visual-multi" },
  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
