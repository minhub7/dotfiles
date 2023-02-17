local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if (not lspconfig_status) then return end

local servers = { "lua_ls", "pyright", "jsonls", }

require("mason").setup({
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})


for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
