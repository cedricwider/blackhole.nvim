local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm run test --",
			env = { CI = true },
			cwd = function(_)
				return vim.fn.getcwd()
			end,
		}),
		require("neotest-rspec"),
	},
})
