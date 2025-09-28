return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    "neovim/nvim-lspconfig",
    -- "hrsh7th/cmp-vsnip",
    -- "hrsh7th/vim-vsnip",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-K>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-J>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-B>"] = cmp.mapping.scroll_docs(-4),
        ["<C-F>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-E>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        -- { name = "vsnip" }, -- For vsnip users.
      }, {
        { name = "buffer" },
      }),
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "git" },
      }, {
        { name = "buffer" },
      })
    })
    require("cmp_git").setup() ]]
    --

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local eslint_base_on_attach = vim.lsp.config.eslint.on_attach
    vim.lsp.config("eslint", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if not eslint_base_on_attach then
          return
        end

        eslint_base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "LspEslintFixAll",
        })
      end,
    })
    vim.lsp.enable("eslint")

    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = { "graphql", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    })
    vim.lsp.enable("graphql")

    vim.lsp.config("stylelint_lsp", {
      capabilities = capabilities,
      settings = {
        stylelintplus = {
          autoFixOnFormat = true,
        },
      },
      on_attach = function(_, buffer)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = buffer,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end,
    })
    vim.lsp.enable("stylelint_lsp")

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      settings = {
        python = {
          pythonPath = ".venv/bin/python",
        },
      },
    })
    vim.lsp.enable("pyright")

    local new_servers = {
      "clangd",
      "jsonls",
      "lua_ls",
      "rust_analyzer",
      "kotlin_lsp",
    }
    for _, server in ipairs(new_servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
      vim.lsp.enable(server)
    end

    -- HACK: Ignore buggy GraphQL validation error message
    local graphql_ns = vim.api.nvim_create_namespace("vim.lsp.graphql.2")
    vim.diagnostic.enable(false, { ns_id = graphql_ns })
  end,
}
