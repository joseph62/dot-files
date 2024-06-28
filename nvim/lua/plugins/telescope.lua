return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	setup = {
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
}
