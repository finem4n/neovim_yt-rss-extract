local utils = require("nv-yt_rss.utils")

local M = {}

function M.get_rss ()
  -- local url = vim.fn.system('')
  local script_filepath = utils.get_plug_path() .. "youtube-rss_gist/youtube-rss.sh"
  print(script_filepath)
end

return M
