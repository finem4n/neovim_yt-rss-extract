local M = {}

function M.get_plug_path ()
  local path = debug.getinfo(1, "S")
  local new_path = path.source:sub(2):match("^(.*lua/)")
  return new_path
end

return M
