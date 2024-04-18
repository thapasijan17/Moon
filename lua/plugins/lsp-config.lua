return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				-- setup your tools here
				ensure_installed = {
					-- js
					"eslint_d",
					"prettierd",
					-- JSON
					"jsonlint",
					"jq",
					-- java
					"checkstyle",
					"google_java_format",
					-- python
					"flake8",
					"black",
					-- lua
					"selene",
					"stylua",
				},
			})
		end,
	},
	{
		-- Setup your lsp here
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- c
					"clangd",
					-- docker
					"dockerls",
					-- html/css
					"html",
					"cssls",
					-- lua
					"lua_ls",
					--json
					"jsonls",
					-- java
					"jdtls",
					-- python
					"pyright",
					"ruff_lsp",
					-- markdown
					"marksman",
					-- toml
					"taplo",
					-- yaml
					"yamlls",
					-- go
					"gopls",
				},
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- nvim-cmp supports additional completion capabilities
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				Lua = {
					completion = {
						callSnippet = "replace",
					},
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enabled = false,
					},
					hint = {
						enable = true,
					},
				},
			})

			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			lspconfig.jdtls.setup({
				capatilities = capabilities,
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.nil_ls.setup({
				capabilities = capabilities,
				cmd = { "nil" },
				filetypes = { "nix" },
				init_options = {
					nix = {
						flake = {
							autoArchive = true,
							-- auto eval flake inputs for improved completion
							-- generates too many issues
							autoEvalInputs = false,
						},
						completion = {
							callSnippet = "replace",
						},
					},
				},
				settings = {
					["nil"] = {
						formatting = {
							command = { "alejandra" },
						},
					},
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						check_on_save = true,
						check = {
							command = "clippy",
						},
						proc_macro = {
							enable = true,
						},
					},
				},
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})

			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			lspconfig.taplo.setup({
				capabilities = capabilities,
			})

			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			-- lspconfig.tsserver.setup({
			-- 	capabilities = capabilities,
			-- 	settings = {
			-- 		typescript = {
			-- 			inlayHints = {
			-- 				-- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
			-- 				includeInlayEnumMemberValueHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true, -- false
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayVariableTypeHintsWhenTypeMatchesName = true, -- false
			-- 			},
			-- 		},
			-- 		javascript = {
			-- 			inlayHints = {
			-- 				includeInlayEnumMemberValueHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = true,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
			-- 			},
			-- 		},
			-- 	},
			-- })

			require("lspconfig.ui.windows").default_options = {
				border = "rounded",
			}

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			vim.diagnostic.config({
				float = { border = "rounded" },
				virtual_text = {
					prefix = "",
				},
				signs = true,
				underline = true,
				update_in_insert = true,
			})

			-- vim.api.nvim_create_autocmd("LspAttach", {
			-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			-- 	callback = function(ev)
			-- 		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			--
			-- 		local opts = { buffer = ev.buf }
			-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			-- 		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			-- 		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			-- 		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
			-- 		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
			-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			-- 		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			-- 		vim.keymap.set("n", "<space>cw", vim.lsp.buf.workspace_symbol, opts)
			-- 		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
			-- 		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			-- 		vim.keymap.set("n", "<space>cf", function()
			-- 			vim.lsp.buf.format({ async = true })
			-- 		end, opts)
			-- 		vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, opts)
			-- 		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
			-- 		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
			-- 	end,
			-- })
		end,
	},
}
