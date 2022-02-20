local ok, _ = pcall(require, "telescope")
if not ok then
  error("This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)")
  return
end

local telescope = require "telescope"
local actions = require "telescope.actions"
local action_state = require("telescope.actions.state")
local commands = require("telescope._extensions.commands")

local M = {}

M.sessions = function(opts)
  opts = opts or {}
  require("telescope.pickers").new(
    opts,
    {
      prompt_title = "TMUXP Sessions",
      finder = require("telescope.finders").new_table(
        {
          results = commands.list_sessions
        }
      ),
      sorter = require("telescope.config").values.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(
          function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            commands.load_session(selection[1])
          end
        )
        return true
      end
    }
  ):find()
end

return telescope.register_extension {exports = {sessions = M.sessions}}
