local dap = require("dap")


vim.keymap.set("n", "<F5>", function()
	dap.toggle_breakpoint()
end, { desc = "Debug Toggle Breakpoint" }
)

vim.keymap.set("n", "<F9>", function()
	dap.continue()
end, { desc = "Debug Continue" }
)

vim.keymap.set("n", "<C-F9>", function()
	dap.run_to_cursor()
end, { desc = "Debug Run to Cursor" }
)

vim.keymap.set("n", "<F8>", function()
	dap.step_over()
end, { desc = "Debug Step Over" }
)

vim.keymap.set("n", "<F10>", function()
	dap.step_into()
end, { desc = "Debug Step Into" }
)

vim.keymap.set("n", "<F11>", function()
	dap.terminate()
end, { desc = "Debug Terminate" })


dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-dap",
	name = "lldb",
}


dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {

		},
	},
}
dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {

		},
		initCommands = function()
			local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
			assert(
				vim.v.shell_error == 0,
				'failed to get rust sysroot using `rustc --print sysroot`: '
				.. rustc_sysroot
			)
			local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
			local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
			return {
				([[!command script import '%s']]):format(script_file),
				([[command source '%s']]):format(commands_file),
			}
		end,
		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end
	},
}




local dapui = require("dapui")
dapui.setup {}

vim.keymap.set("n", "<leader>D", function()
	dapui.toggle()
end, { desc = "Debug UI Toggle" })


dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
