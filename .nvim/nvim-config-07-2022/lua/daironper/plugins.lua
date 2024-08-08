return require("packer").startup(function(use)

-- LSP
		use({
			"neovim/nvim-lspconfig",
				"williamboman/nvim-lsp-installer",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"jose-elias-alvarez/null-ls.nvim",
		})

-- Completition
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
		}
	})

end)

