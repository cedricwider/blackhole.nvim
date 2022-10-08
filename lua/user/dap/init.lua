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
			text = "➡️",
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
	require("nvim-dap-virtual-text").setup()
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local function configure_adapters()
	-- require("user.dap.ruby")
	-- require("user.dap.javascript_chrome")
	require("user.dap.vscode-js-debug")
end

function M.setup()
	configure()
	configure_extensions()
	configure_adapters()
end

configure_adapters()

return M
