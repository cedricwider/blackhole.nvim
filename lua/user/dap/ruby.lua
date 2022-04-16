-- local status_ok, dap_ruby = pcall(require, "dap-ruby")
-- if not status_ok then
-- 	return
-- end
--
-- dap_ruby.setup()
local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters.ruby = {
	type = "server",
	host = "127.0.0.1",
	port = 38698,
}

dap.configurations.ruby = {
	{
		type = "ruby",
		name = "debug current file",
		request = "attach",
		port = 38698,
		server = "127.0.0.1",
	},
}
