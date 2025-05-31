local utils = require("nv-yt_rss.utils")

local M = {}

function M.get_deps ()
  local gist_url = "https://gist.github.com/tjluoma/fdbc63ceb78a2aecd3d638fd18b6ec6e"
  local gist_dir = utils.get_plug_path() .. "youtube-rss_gist"

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

  local script_path = gist_dir .. "/youtube-rss.sh"
  local executability_checker = "[ -x " .. script_path .. " ] && echo True || echo False"

  local executability = vim.fn.system(executability_checker)
  executability = vim.trim(executability) -- remove trailing whitespaces

  if executability == "True" then
    vim.notify("youtube-rss.sh is executable", vim.log.levels.INFO)

  elseif executability == "False" then
    vim.notify("Updating youtube-rss.sh permissions to be executable", vim.log.levels.INFO)
    vim.notify(script_path, vim.log.levels.INFO)
    local output = vim.fn.system({'chmod', 'u+x', script_path})
    vim.notify("Setting permissions failed:\n" .. output, vim.log.levels.ERROR)
  end
end

return M
