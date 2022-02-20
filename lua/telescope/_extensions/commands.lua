local Job = require("plenary.job")

local M = {}

M.list_sessions = Job:new({command = "tmuxp", args = {"ls"}, cwd = "~"}):sync()

--- Loads tmuxp session
--- Creates new session if it doesn't exist, switches to open session if it exists
--- Supports .yml files in the ~/.tmuxp/ directory
--- @param session_name string session to create/load
M.load_session = function(session_name)
  Job:new(
    {
      command = "tmuxp",
      cwd = "~",
      args = {"load", session_name, "-y"}
    }
  ):start()
end

return M
