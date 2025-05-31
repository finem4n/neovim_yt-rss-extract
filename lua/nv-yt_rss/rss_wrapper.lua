local utils = require("nv-yt_rss.utils")

local M = {}

function M.get_rss (youtube_link)
  -- TODO check for nils
  local script_filepath = utils.get_plug_path() .. "youtube-rss_gist/youtube-rss.sh"
  local rss_link = vim.fn.system({script_filepath, youtube_link})
  rss_link = vim.trim(rss_link)
  return rss_link
end

return M
