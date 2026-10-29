local function in_silver_import()
	if vim.in_fast_event() or vim.bo.filetype ~= "silver" then return false end
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	return line:sub(1, col):match("^%s*import%s") ~= nil
end

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
			trigger = {
				-- Silver gates these triggers by context on the server. Only
				-- unblock them on import lines so ordinary code keeps the
				-- default no-menu behavior for space and braces.
				show_on_blocked_trigger_characters = function()
					return in_silver_import() and { "\n", "\t" } or { " ", "\n", "\t" }
				end,
				show_on_x_blocked_trigger_characters = function()
					return in_silver_import() and { "'", '"', "(", "[" } or { "'", '"', "(", "{", "[" }
				end,
			},
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
