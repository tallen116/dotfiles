-- https://github.com/nvim-telescope/telescope.nvim

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
      dependencies = { 'nvim-lua/plenary.nvim' },
			keys = {
				{"<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Telescope find files"},
				{"<C-p>", "<cmd>Telescope git_files<cr>", desc= "Telescope git files"},
				{"<leader>ps", "<cmd>:lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') })<cr>", desc = "Telescope grep string"},
			},
    }
