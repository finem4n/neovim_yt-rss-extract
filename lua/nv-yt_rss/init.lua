local M = {}

M.ns = vim.api.nvim_create_namespace("nv-yt_rss")

function M.print_url ()
  local rss = require("nv-yt_rss.rss_wrapper").get_rss("https://www.youtube.com/@kate.cassidy/videos")
  print(rss)
end

function M.build ()
  require("nv-yt_rss.build.get_deps").get_deps()
end
-- M.build = require"build.get_deps")

return M
