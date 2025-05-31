local M = {}

M.ns = vim.api.nvim_create_namespace("nv-yt_rss")

function M.print_url ()
  local yt_url = vim.fn.input("Paste the YouTube channel URL: ")
  local rss_url = require("nv-yt_rss.rss_wrapper").get_rss(yt_url)
  
  require("nv-yt_rss.utils").insert_url(rss_url)
end

function M.build ()
  require("nv-yt_rss.build.get_deps").get_deps()
end

return M
