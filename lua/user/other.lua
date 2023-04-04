local status_ok, other = pcall(require, "other-nvim")
if not status_ok then
	return
end

other.setup({
	mappings = {
		{
			pattern = "app/(.*)/(.*).rb$",
			target = "spec/%1/%2_spec.rb",
		},
		{
			pattern = "spec/(.*)/(.*)_spec.rb$",
			target = "app/%1/%2.rb",
		},
		{
			pattern = "server/src/(.*)/(.*).ts$",
			target = "server/test/%1/%2.spec.ts",
		},
		{
			pattern = "server/test/(.*)/(.*).spec.ts$",
			target = "server/src/%1/%2.ts",
		},
		{
			pattern = "client/(.*)/(.*).ts$",
			target = "client/test/%1/%2.spec.ts",
		},
	},
})
