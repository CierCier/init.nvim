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
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = "propo",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "jupynium" },
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
		providers = {
			jupynium = {
				name = "Jupynium",
				module  = "jupynium.blink_cmp",
				score_offset = 100,
			}
		}
	},
	opts_extend = { "sources.default" },
}
