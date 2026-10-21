-- Groovy: syntax highlighting only.
-- groovy-language-server is disabled: without the project classpath it crashed on every
-- edit in data-layer (BUG! exception in phase 'canonicalization') and gave weak completion.
-- To try it again, change `enabled = false` to true (it would need groovy.classpath set).
return {
  { "neovim/nvim-lspconfig", opts = { servers = { groovyls = { enabled = false } } } },
  { "nvim-treesitter/nvim-treesitter", opts = { ensure_installed = { "groovy" } } },
}
