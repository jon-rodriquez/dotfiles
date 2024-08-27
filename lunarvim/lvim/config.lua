--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-night"
lvim.transparent_window = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
-- unmap a default keymapping
vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
--
vim.keymap.set("i", "jk", "<ESC>")

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<CR>", "v split" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope oldfiles<CR>", "Recents" }
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" }
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files theme=dropdown<CR>", "Find Text" }
lvim.builtin.which_key.mappings["t"] = { "<cmd>ToggleTerm direction=float<CR>", "Terminal" }
lvim.builtin.which_key.mappings["d"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings['D'] = {
  "<cmd>lua vim.diagnostic.open_float()<CR>", "float diag"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
vim.opt.relativenumber = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true


-- lvim.builtin.treesitter.textobjects.select = {
--   enable = true,

--   -- Automatically jump forward to textobj, similar to targets.vim
--   lookahead = true,

--   keymaps = {
--     -- You can use the capture groups defined in textobjects.scm
--     ["af"] = "@function.outer",
--     ["if"] = "@function.inner",
--     ["ac"] = "@class.outer",
--     -- You can optionally set descriptions to the mappings (used in the desc parameter of
--     -- nvim_buf_set_keymap) which plugins like which-key display
--     ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--     -- You can also use captures from other query groups like `locals.scm`
--     ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
--   },
--   -- You can choose the select mode (default is charwise 'v')
--   --
--   -- Can also be a function which gets passed a table with the keys
--   -- * query_string: eg '@function.inner'
--   -- * method: eg 'v' or 'o'
--   -- and should return the mode ('v', 'V', or '<c-v>') or a table
--   -- mapping query_strings to modes.
--   selection_modes = {
--     ['@parameter.outer'] = 'v', -- charwise
--     ['@function.outer'] = 'V',  -- linewise
--     ['@class.outer'] = '<c-v>', -- blockwise
--   },
--   -- If you set this to `true` (default is `false`) then any textobject is
--   -- extended to include preceding or succeeding whitespace. Succeeding
--   -- whitespace has priority in order to act similarly to eg the built-in
--   -- `ap`.
--   --
--   -- Can also be a function which gets passed a table with the keys
--   -- * query_string: eg '@function.inner'
--   -- * selection_mode: eg 'v'
--   -- and should return true of false
--   include_surrounding_whitespace = true,
-- }

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "jsonls",
  "eslint"
}
-- change UI setting of `LspInstallInfo`
-- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--   uninstall_server = "d",
--   toggle_server_expand = "o",
-- }

---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = true

---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", opts)
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format",
}

---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
lvim.lsp.on_attach_callback = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "eslint", filetype = { "typescript", "typescriptreact" },
    { command = "rustfmt", filetype = { "rust" } } }
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "eslint", filetype = { "typescript" } }
}

-- Additional Plugins
lvim.plugins = {
  { 'christoomey/vim-tmux-navigator' },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup()
    end,
  },
  { 'github/copilot.vim' },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependacies = "nvim-treesitter/nvim-treesitter",
  },
  { 'simrat39/rust-tools.nvim' },
  { 'MunifTanjim/nui.nvim' },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependacies = {
      { 'MunifTanjim/nui.nvim' }
    }
  }
}

vim.cmd [[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
