-- require'lspconfig'.bashls.setup{ cmd = { "/home/maple/.local/share/nvim/lsp_servers/bash/node_modules/bash-language-server" } }
-- require'lspconfig'.pyright.setup{ cmd = { "/home/maple/.local/share/nvim/lsp_servers/python/node_modules/pyright/langserver.index.js" } }

require'lspconfig'.sumneko_lua.setup{ cmd = { "/home/maple/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server" } }
require("plugins.langservers.jsonls")
