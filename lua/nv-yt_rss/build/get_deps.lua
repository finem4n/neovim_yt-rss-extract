local M = {}

function M.get_deps ()
  local gist_url = "https://gist.github.com/tjluoma/fdbc63ceb78a2aecd3d638fd18b6ec6e"
  local gist_dir = vim.fn.stdpath("data") .. "/lazy/neovim_yt-rss-extract/lua/youtube-rss_gist"

  if vim.fn.isdirectory(gist_dir) == 0 then
    vim.fn.mkdir(gist_dir, "p")

    local output = vim.fn.system({ 'git', 'clone', '--depth=1', gist_url, gist_dir })
  end
end

return M
