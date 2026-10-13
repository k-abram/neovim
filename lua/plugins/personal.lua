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

  -- neo-tree, used only for these two tree views (Space e stays on Snacks explorer).
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = "Neotree",
    keys = {
      -- Right side: Snacks explorer (Space e) keeps the left side
      { "<leader>be", "<cmd>Neotree right buffers toggle<CR>", desc = "Buffer explorer (tree)" },
      { "<leader>ge", "<cmd>Neotree right git_status toggle<CR>", desc = "Git modified/untracked (tree)" },
    },
    opts = {
      -- Close the tree as soon as a file is opened from it, and put the cursor
      -- in that file (otherwise it can land in the Snacks explorer if it's open)
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file)
            require("neo-tree.command").execute({ action = "close" })
            vim.schedule(function()
              local target = vim.fn.fnamemodify(file, ":p")
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                local buf = vim.api.nvim_win_get_buf(win)
                if vim.api.nvim_buf_get_name(buf) == target then
                  vim.api.nvim_set_current_win(win)
                  return
                end
              end
            end)
          end,
        },
      },
      sources = { "filesystem", "buffers", "git_status" },
      filesystem = { hijack_netrw_behavior = "disabled" }, -- leave folders to Snacks
      buffers = {
        follow_current_file = { enabled = true },
        show_unloaded = true, -- include buffers restored from a session but not yet opened
      },
    },
  },

  -- Yazi file manager in a floating window (needs: brew install yazi)
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
    cmd = "Yazi",
    keys = {
      { "<leader>fy", mode = { "n", "v" }, "<cmd>Yazi<CR>", desc = "Yazi (current file)" },
      { "<leader>fY", "<cmd>Yazi cwd<CR>", desc = "Yazi (working directory)" },
    },
    opts = {
      open_for_directories = false, -- leave folders to Snacks explorer
      keymaps = { show_help = "<F1>" },
    },
  },

  -- Syntax highlighting for the languages used before.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java", "go", "python", "bash", "lua" } },
  },
}
