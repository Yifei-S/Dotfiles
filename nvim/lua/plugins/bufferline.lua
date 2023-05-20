return {
	"akinsho/bufferline.nvim",

	version = "*",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
	},

	config = function()
		require("bufferline").setup({})
	end,
}
