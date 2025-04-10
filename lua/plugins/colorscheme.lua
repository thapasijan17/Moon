function ColorMyPencils(color)
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd([[ colorscheme oxocarbon ]])
	-- 		ColorMyPencils()
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "moon", -- auto, main, moon, or dawn
	-- 			dark_variant = "moon", -- main, moon, or dawn
	-- 			dim_inactive_windows = false,
	-- 			disable_background = true,
	-- 			extend_background_behind_borders = true,
	-- 			enable = {
	-- 				terminal = true,
	-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
	-- 				migrations = true, -- Handle deprecated options automatically
	-- 			},
	--
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = true,
	-- 				transparency = true,
	-- 			},
	--
	-- 			groups = {
	-- 				border = "muted",
	-- 				link = "iris",
	-- 				panel = "surface",
	--
	-- 				error = "love",
	-- 				hint = "iris",
	-- 				info = "foam",
	-- 				note = "pine",
	-- 				todo = "rose",
	-- 				warn = "gold",
	--
	-- 				git_add = "foam",
	-- 				git_change = "rose",
	-- 				git_delete = "love",
	-- 				git_dirty = "rose",
	-- 				git_ignore = "muted",
	-- 				git_merge = "iris",
	-- 				git_rename = "pine",
	-- 				git_stage = "iris",
	-- 				git_text = "rose",
	-- 				git_untracked = "subtle",
	--
	-- 				h1 = "iris",
	-- 				h2 = "foam",
	-- 				h3 = "rose",
	-- 				h4 = "gold",
	-- 				h5 = "pine",
	-- 				h6 = "foam",
	-- 			},
	--
	-- 			highlight_groups = {
	-- 				TelescopeBorder = { fg = "highlight_high", bg = "none" },
	-- 				TelescopeNormal = { bg = "none" },
	-- 				TelescopePromptNormal = { bg = "base" },
	-- 				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
	-- 				TelescopeSelection = { fg = "text", bg = "base" },
	-- 				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme rose-pine-moon")
	-- 		ColorMyPencils()
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			on_highlights = function(hl, c)
	-- 				local prompt = "#2d3149"
	-- 				hl.TelescopeNormal = {
	-- 					bg = c.bg_dark,
	-- 					fg = c.fg_dark,
	-- 				}
	-- 				hl.TelescopeBorder = {
	-- 					bg = c.bg_dark,
	-- 					fg = c.bg_dark,
	-- 				}
	-- 				hl.TelescopePromptNormal = {
	-- 					bg = prompt,
	-- 				}
	-- 				hl.TelescopePromptBorder = {
	-- 					bg = prompt,
	-- 					fg = prompt,
	-- 				}
	-- 				hl.TelescopePromptTitle = {
	-- 					bg = prompt,
	-- 					fg = prompt,
	-- 				}
	-- 				hl.TelescopePreviewTitle = {
	-- 					bg = c.bg_dark,
	-- 					fg = c.bg_dark,
	-- 				}
	-- 				hl.TelescopeResultsTitle = {
	-- 					bg = c.bg_dark,
	-- 					fg = c.bg_dark,
	-- 				}
	-- 			end,
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight-storm")
	-- 		ColorMyPencils()
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- latte, frappe, macchiato, mocha
				background = {
					light = "mocha",
					dark = "mocha",
				},
				transparent_background = false,
				integrations = {
					alpha = true,
					bufferline = true,
					cmp = true,
					dap = true,
					dap_ui = true,
					fidget = true,
					gitsigns = true,
					harpoon = true,
					indent_blankline = {
						enabled = true,
						scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
						colored_indent_levels = true,
					},
					lsp_saga = false,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = {
						enabled = false,
						indentscope_color = "",
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					neogit = true,
					neotest = true,
					noice = true,
					notify = true,
					nvimtree = false,
					telescope = {
						enabled = true,
						-- style = "nvchad",
					},
					treesitter = true,
					treesitter_context = true,
					ufo = false,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
			ColorMyPencils()
		end,
	},
}
