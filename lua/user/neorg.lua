local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<space>",
				hook = nil,
				keybind_presets = "neorg",
			},
		},
		-- ["core.gtd.base"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.qol.toc"] = {},
		-- ["core.presenter"] = {},
		-- ["core.integrations.telescope"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/work/localsearch/notes",
					private = "~/private/notes",
				},
			},
		},
	},
})
