return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "lukas-reineke/lsp-format.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()
    require("lsp-format").setup()

    local get_opts = function(desc)
      return {
        noremap = true,
        silent = true,
        desc = desc,
      }
    end

    local get_buf_opts = function(bufnr, desc)
      return {
        noremap = true,
        silent = true,
        buffer = bufnr,
        desc = desc,
      }
    end

    local on_attach = function(client, bufnr)
      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, get_buf_opts(bufnr, "Show doc"))
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, get_buf_opts(bufnr, "[G]oto [d]efinition"))
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, get_buf_opts(bufnr, "[G]oto [I]mplementation"))
      vim.keymap.set("n", "gr", vim.lsp.buf.references, get_buf_opts(bufnr, "[G]oto [R]eferences"))
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, get_buf_opts(bufnr, "[G]oto [D]eclaration"))
      vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, get_buf_opts(bufnr, "Show signature help"))
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, get_buf_opts(bufnr, "Type [D]efinition"))
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, get_buf_opts(bufnr, "Rename"))
      vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, get_buf_opts(bufnr, "[R]e[n]ame"))
      vim.keymap.set("n", "<Leader><CR>", vim.lsp.buf.code_action, get_buf_opts(bufnr, "Show code actions"))
      vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, get_buf_opts(bufnr, "Show [C]ode [A]ctions"))
      vim.keymap.set("x", "<Leader>ca", vim.lsp.buf.code_action, get_buf_opts(bufnr, "Show [C]ode [A]ctions"))
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ async = false })
      end, get_opts("Format file"))
      -- Formatting
      --   if client.server_capabilities.documentFormattingProvider then
      --     vim.api.nvim_command [[augroup Format]]
      --     vim.api.nvim_command [[autocmd! * <buffer>]]
      --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = false})]]
      --     vim.api.nvim_command [[augroup END]]
      --   end
      require("lsp-format").on_attach(client, bufnr)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        })
      end,
      ["ts_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.ts_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.emmet_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "html", "javascriptreact", "typescriptreact" },
        })
      end,
      ["cssls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.cssls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            css = { validate = true, lint = { unknownAtRules = "ignore" } },
            scss = { validate = true, lint = { unknownAtRules = "ignore" } },
            less = { validate = true, lint = { unknownAtRules = "ignore" } },
          },
        })
      end,
      ["omnisharp"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.omnisharp.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          handlers = {
            ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
            ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
            ["textDocument/references"] = require("omnisharp_extended").references_handler,
            ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
          },
        })
      end,
    })

    local lspconfig = require("lspconfig")
    lspconfig.dartls.setup({
      cmd = { "dart", "language-server", "--protocol=lsp" },
      filetypes = { "dart" },
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
