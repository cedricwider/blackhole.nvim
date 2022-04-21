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
	},
})
