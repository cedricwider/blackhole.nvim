local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			-- jest options
			jestCommand = "./node_modules/.bin/jest",
			jestConfigFile = "jest-server.config.js",
			env = { CI = true },
			cwd = function(_)
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-rspec"),
	},
})
