return {
	"saghen/blink.cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then return cmp.jump_forward()
					elseif cmp.is_menu_visible() then return cmp.accept()
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then return cmp.jump_backward()
					elseif cmp.is_menu_visible() then return cmp.select_prev()
					end
				end,
				"fallback",
			},
		},

		appearance = {
			nerd_font_variant = "propo",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		snippets = {
			preset = "luasnip",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = {
				enabled = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
