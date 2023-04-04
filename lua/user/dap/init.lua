local dap = require("dap")
local M = {}

local function configure()
	local dap_breakpoint = {
		error = {
			text = "🔴",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "👉",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_extensions()
	local dapui = require("dapui")
	dapui.setup()
	require("nvim-dap-virtual-text").setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
end

local function configure_adapters()
	require("user.dap.ruby")
	require("user.dap.node2")
	require("user.dap.javascript_chrome")
	require("user.dap.vscode-js-debug")
end

local function configure_keys()
	vim.keymap.set("n", "F5", function()
		require("dap").continue()
	end)
	vim.keymap.set("n", "F7", function()
		require("dap").step_out()
	end)
	vim.keymap.set("n", "F8", function()
		require("dap").step_over()
	end)
	vim.keymap.set("n", "F9", function()
		require("dap").step_into()
	end)
end

function M.setup()
	configure()
	configure_extensions()
	configure_adapters()
	configure_keys()
	require("telescope").load_extension("dap")
end

-- configure_adapters()

return M
