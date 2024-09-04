-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["v"] = { "<cmd>vsplit<CR>", "v split" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope oldfiles<CR>", "Recents" }
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope live_grep theme=ivy<CR>", "Find Text" }
lvim.builtin.which_key.mappings["f"] = {
  name = "find",
  f = { "<cmd>Telescope find_files theme=dropdown<CR>", "Find Text" },
  t = { "<cmd>TodoTelescope keywords=TODO <CR>", "Find TODO" },
  b = { "<cmd>TodoTelescope keywords=FIX <CR>", "Find Fix" }
}
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
lvim.builtin.which_key.mappings["l"]["f"] = {
  function()
    require("lvim.lsp.utils").format { timeout_ms = 10000 }
  end,
  "Format",
}
