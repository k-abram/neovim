-- Personal additions on top of LazyVim, carried over from the previous
-- hand-built config (/tmp/neovim-backups/config-nvim). Everything else -- file finder,
-- explorer, git signs, status line, buffer tabs, which-key, flash -- is
-- LazyVim's own setup.
return {
  -- Colour schemes (switch with :colorscheme <name>, or Space u C to browse).
  -- tokyonight and catppuccin come with LazyVim.
  { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

  -- The default colour scheme: change this to make another pick permanent.
  { "LazyVim/LazyVim", opts = { colorscheme = "onedark" } },

  -- nvim-surround: ys{motion}{char} add, ds{char} delete, cs{old}{new} change,
  -- S in visual mode surrounds the selection.
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

  -- Flash: keep s / S, but give visual S back to nvim-surround.
  {
    "folke/flash.nvim",
    keys = {
      { "S", mode = "x", false },
    },
  },

  -- Git: faint "author, time - message" at the end of the current line.
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
    },
  },

  -- Syntax highlighting for the languages used before.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java", "go", "python", "bash", "lua" } },
  },
}
