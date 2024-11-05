return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		-- format_on_save = function(bufnr)
		--   -- Disable "format_on_save lsp_fallback" for languages that don't
		--   -- have a well standardized coding style. You can add additional
		--   -- languages here or re-enable it for the disabled ones.
		--   local disable_filetypes = { c = true, cpp = true }
		--   return {
		--     timeout_ms = 500,
		--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		--   }
		-- end,
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				php = { "prettier" }, 
				python = { "black" },
				c = {  "clang-format"  },
				cs = {  "omnisharp"  },
        dart = {"dart_format"}
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				local cursor = vim.api.nvim_win_get_cursor(0)
				require("conform").format({ bufnr = args.buf }, function()
					local lines = vim.api.nvim_buf_line_count(0)
					-- print("lines: ", lines)
					-- print("row: ", cursor[1])
					-- print("col: ", cursor[2])
					if cursor[1] > lines then
						cursor = { lines, 0 }
					end
					vim.api.nvim_win_set_cursor(0, cursor)
				end)
			end,
		})
	end,
}
