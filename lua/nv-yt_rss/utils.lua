local M = {}

function M.get_plug_path ()
  local path = debug.getinfo(1, "S")
  local new_path = path.source:sub(2):match("^(.*lua/)")
  return new_path
end

function M.insert_url (url)
-- Sources:
-- https://vi.stackexchange.com/a/39684

  -- TODO if luasnip is available then use snippet instead of out line
  -- why? it'll be easier to jump
  local url_len = string.len(url)
  -- TODO add config and allow edition of out_line
  local out_line = url .. ' "~name" "tags"'

  -- 0 for current window
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

  -- 0 for current buffer
  -- replacement must be an array; see docs
  vim.api.nvim_buf_set_lines(0, row, row, true, { out_line })
  vim.api.nvim_win_set_cursor(0, {row+1, url_len+3})
end

return M
