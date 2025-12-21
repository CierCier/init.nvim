return {
	"altermo/ultimate-autopair.nvim",
	event = { "InsertEnter", "CmdlineEnter" },
	branch = "v0.6",
	config = function()
		local ultima = require('ultimate-autopair')
		local ultima_config = { ultima.extend_default({}) }
		ultima.init(ultima_config)
	end
}
