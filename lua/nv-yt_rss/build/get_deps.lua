local utils = require("nv-yt_rss.utils")

local M = {}

function M.get_deps ()
  local gist_url = "https://gist.github.com/tjluoma/fdbc63ceb78a2aecd3d638fd18b6ec6e"
  local gist_dir = utils.get_plug_path() .. "youtube-rss_gist"
  -- local gist_dir = vim.fn.stdpath("data") .. "/lazy/neovim_yt-rss-extract/lua/youtube-rss_gist"

  if vim.fn.isdirectory(gist_dir) == 0 then
    vim.fn.mkdir(gist_dir, "p")

    local output = vim.fn.system({ 'git', 'clone', '--depth=1', gist_url, gist_dir })

    if vim.v.shell_error ~= 0 then
      vim.notify("Gist clone failed:\n" .. output, vim.log.levels.ERROR)
    else
      vim.notify("Gist cloned to: " .. gist_dir, vim.log.levels.INFO)
    end

  else
    local output = vim.fn.system({ "git", "-C", gist_dir, "pull", "--ff-only" })

    if vim.v.shell_error ~= 0 then
      vim.notify("Gist pull failed:\n" .. output, vim.log.levels.ERROR)
    else
      vim.notify("Gist updated in: " .. gist_dir, vim.log.levels.INFO)
    end
  end
end

return M
