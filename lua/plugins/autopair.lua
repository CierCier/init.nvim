return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local npairs = require("nvim-autopairs")

		npairs.setup({
			check_ts = true, -- use treesitter to check for pairs
			ts_config = {
				lua = { "string" }, -- it will not add a pair on that treesitter node
				javascript = { "template_string" },
				java = false, -- don't check treesitter on java
			},
			-- FastWrap is a powerful feature to wrap existing text in pairs
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

		-- Integration with COQ (if you use it)
		-- Since you use coq_nvim, we should make sure they don't fight over the same keys.
		-- COQ handles <CR> by default, so we usually don't need to map it here.
	end,
}
