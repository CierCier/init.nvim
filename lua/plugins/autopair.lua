return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%)%>%]%]%}%, ;]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		local function avoid_pairing_import_brace(opts)
			if vim.bo[opts.bufnr or 0].filetype ~= "silver" then return nil end
			local before = opts.line:sub(1, opts.col - 1)
			if before:match("^%s*import%s+[%w_%.]+%s*$") then return false end
		end
		for _, rule in ipairs(npairs.get_rules("{")) do
			rule:with_pair(avoid_pairing_import_brace, 1)
		end

		require("nvim-ts-autotag").setup()
	end,
}
