local M = {}

M.ns = vim.api.nvim_create_namespace("nv-yt_rss")

function M.test ()
  print("hej")
end

function M.build ()
  require("nv-yt_rss.build.get_deps").get_deps()
end
-- M.build = require"build.get_deps")

return M
