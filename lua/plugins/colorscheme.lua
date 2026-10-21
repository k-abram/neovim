-- Lighter comments for readability on dark backgrounds.
-- Uses a ColorScheme autocmd so it applies to whichever scheme is active
-- (onedark, tokyonight, gruvbox, ...), including when switching with Space u C.
-- Tweak COMMENT_FG to taste: #a9b1d6 (softer) ... #c8ccd8 (very light).
local COMMENT_FG = "#b0b6c8"

local function set_comment_hl()
  -- Only for dark themes: a light gray would be unreadable on a light background.
  -- Check the real Normal background, since some schemes (onedark) don't set 'background'.
  local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
  if bg then
    local r, g, b = math.floor(bg / 65536), math.floor(bg / 256) % 256, bg % 256
    if (0.299 * r + 0.587 * g + 0.114 * b) > 128 then
      return
    end
  elseif vim.o.background ~= "dark" then
    return
  end
  vim.api.nvim_set_hl(0, "Comment", { fg = COMMENT_FG, italic = true })
  -- Treesitter / LSP comment groups some schemes define separately.
  vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
  vim.api.nvim_set_hl(0, "@lsp.type.comment", { link = "Comment" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("user_comment_color", { clear = true }),
  callback = set_comment_hl,
})

-- No plugin specs here; this file only registers the autocmd.
return {}
