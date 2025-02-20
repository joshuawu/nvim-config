return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      --on_attach = function() ... end,
      -- handlers = { ... },
      -- ...
      settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = "all",
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {},
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = "auto",
        -- tsserver_file_preferences = {
        --   includeInlayParameterNameHints = "all",
        --   includeCompletionsForModuleExports = true,
        --   quotePreference = "auto",
        --   ...
        -- },
        -- tsserver_format_options = {
        --   allowIncompleteCompletions = false,
        --   allowRenameOfImportPath = false,
        --   ...
        -- }
        -- locale of all tsserver messages, supported locales you can find here:
        -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
        tsserver_locale = "en",
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
        -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        code_lens = "off",
        -- by default code lenses are displayed on all referencable values and for some of you it can
        -- be too much this option reduce count of them by removing member references from lenses
        disable_member_code_lens = true,
        -- JSXCloseTag
        -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
        -- that maybe have a conflict if enable this feature. )
        jsx_close_tag = {
          enable = false,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
      },
    },
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {
      auto_open_qflist = true,
      auto_close_qflist = true,
      auto_focus_qflist = false,
      auto_start_watch_mode = true,
      use_trouble_qflist = true,
      use_diagnostics = false,
      run_as_monorepo = false,
      enable_progress_notifications = true,
      enable_error_notifications = true,
      flags = {
        noEmit = true,
        watch = true,
      },
      hide_progress_notifications_from_history = true,
      pretty_errors = false,
    },
  },
}
