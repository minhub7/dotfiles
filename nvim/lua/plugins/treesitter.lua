local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = { enable = true },
    highlight = {
      enable = true, -- false will disable the whole extension
      -- disable = { "" }, -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
      end,
      additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = { enable = true, enable_autocmd = false, },
}

  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

