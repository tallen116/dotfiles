-- https://github.com/ThePrimeagen/harpoon

return {
	"ThePrimeagen/harpoon",
  dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = true,
	keys = {
		{ "<leader>a", '<cmd>:lua require("harpoon.mark").add_file()<cr>', desc = "Add file to harpoon" },
		{ "<C-e>", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon quick menu" },
	},
}
